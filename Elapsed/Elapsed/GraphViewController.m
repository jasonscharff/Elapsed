//
//  GraphViewController.m
//  Elapsed
//
//  Created by Jason Scharff on 9/19/15.
//  Copyright © 2015 Jason Scharff. All rights reserved.
//

#import "GraphViewController.h"

#import "AutoLayoutHelper.h"
#import "Elapsed-Swift.h"

#import <Realm/Realm.h>
#import <SupportKit/SupportKit.h>

#import "ClockInSheet.h"


@import Charts;

@interface GraphViewController ()

@property (nonatomic, strong) NSArray *hoursPerDay;
@property (nonatomic, strong) NSArray *chartLabels;

@end


@implementation GraphViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  [self configureNavigationBar];
  [self performCalculationsOnTime];
  [self configureBarChart];
    // Do any additional setup after loading the view.
}

-(void)configureBarChart {
  
  
  BarChartView *barChartView = [[BarChartView alloc]init];
  
  barChartView.userInteractionEnabled = NO;
  barChartView.drawGridBackgroundEnabled = NO;
  barChartView.leftAxis.drawGridLinesEnabled = NO;
  barChartView.rightAxis.drawGridLinesEnabled = NO;
  barChartView.xAxis.drawGridLinesEnabled = NO;
  barChartView.legend.position = ChartLegendPositionBelowChartCenter;
  barChartView.legend.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
  barChartView.descriptionText = @"";
  barChartView.noDataText = @"Before we can graph your hours, we need some more data";
  barChartView.xAxis.labelPosition = XAxisLabelPositionBottom;
  barChartView.xAxis.labelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:14];
  
  
  UIButton *helpButton = [UIButton new];
  [helpButton setTitle:@"Does this seem incorrect to you?\n Let us know." forState:UIControlStateNormal];
  helpButton.titleLabel.numberOfLines = 2;
  helpButton.titleLabel.textAlignment = NSTextAlignmentCenter;
  helpButton.layer.borderColor = ([UIColor shadeOfGray]).CGColor;
  helpButton.layer.cornerRadius = 6;
  helpButton.layer.borderWidth = 2;
  helpButton.contentEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10);
  helpButton.titleLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
  [helpButton setTitleColor:[UIColor clockInColor] forState:UIControlStateNormal];
  [helpButton addTarget:self action:@selector(showSupportKit:) forControlEvents:UIControlEventTouchDown];
  
  
  [AutolayoutHelper configureView:self.view subViews:VarBindings(barChartView, helpButton) constraints:@[@"H:|-8-[barChartView]-8-|", @"X:barChartView.height == barChartView.width", @"V:|-80-[barChartView]-12-[helpButton]", @"X:helpButton.centerX == superview.centerX"]];
  [self.view layoutIfNeeded];
  BarChartDataSet *chartDataSet = [[BarChartDataSet alloc]initWithYVals:_hoursPerDay label:@"Number of Hours Worked"];
  
  BarChartData *chartData = [[BarChartData alloc]initWithXVals:_chartLabels dataSets:@[chartDataSet]];
  
  [chartData setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:0.f]];
  barChartView.data = chartData;
  
}

-(void)performCalculationsOnTime {
  RLMResults *entries = [[ClockInSheet allObjects]sortedResultsUsingProperty:@"time" ascending:NO];
  NSMutableArray *hoursPerDay = [[NSMutableArray alloc]init];
  NSMutableArray *xLabels = [[NSMutableArray alloc]init];
  int day = -1;
  CGFloat sum = 0;
  if([entries count] >= 2) {
    int max = (int)[entries count] - 1;
    for (int i= max; i > 0; i--) {
      ClockInSheet *entry = [entries objectAtIndex:i];
      NSDateComponents *component = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth fromDate:entry.time];
      if(component.day != day) {
        NSString *label;
        [hoursPerDay addObject:@(sum)];
        if(day < 0) {
          label = @"";
        }
        else {
         label = [NSString stringWithFormat:@"%@. %li", [self getAbbreviationFromNumber:component.month], (long)component.day];
        }

        [xLabels addObject:label];
        sum = 0;
        day = (int)component.day;
      }
      else {
        if(i+1 == [entries count]) {
          [hoursPerDay addObject:@(sum)];
           NSString *label = [NSString stringWithFormat:@"%@. %li", [self getAbbreviationFromNumber:component.month], (long)component.day];
          [xLabels addObject:label];
        }
        else {
         
          NSDate *dateOne = ((ClockInSheet *)([entries objectAtIndex:i])).time;
          NSDate *dateTwo = ((ClockInSheet *)([entries objectAtIndex:i - 1])).time;
          NSTimeInterval timeInterval = [dateTwo timeIntervalSinceDate:dateOne];
          CGFloat hours = timeInterval/3600;
          sum += hours;
          if(i == [entries count]-1) {
            [hoursPerDay addObject:@(sum)];
             NSString *label = [NSString stringWithFormat:@"%@. %li", [self getAbbreviationFromNumber:component.month], (long)component.day];
            [xLabels addObject:label];
          }
        }
        
      }
    }

  }
  [hoursPerDay removeObjectAtIndex:0];
  [xLabels removeObjectAtIndex:0];
  
  NSMutableArray *hoursPerDayAsEntries = [[NSMutableArray alloc]init];
  for (int i = 0; i < [hoursPerDay count]; i++) {
    NSNumber *hour = hoursPerDay[i];
    BarChartDataEntry *dataEntry = [[BarChartDataEntry alloc]initWithValue:[hour doubleValue] xIndex:i];
    [hoursPerDayAsEntries addObject:dataEntry];
  }
  
  
  
  _hoursPerDay= hoursPerDayAsEntries;
  _chartLabels = xLabels;
  
}

-(void)configureNavigationBar {
  self.title = @"Elapsed";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
                           
-(NSString *)getAbbreviationFromNumber : (long)monthNumber {
  NSString * dateString = [NSString stringWithFormat: @"%ld", monthNumber];
  
  NSDateFormatter* dateFormatter = [[NSDateFormatter alloc] init];
  [dateFormatter setDateFormat:@"MM"];
  NSDate* myDate = [dateFormatter dateFromString:dateString];
  
  NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
  [formatter setDateFormat:@"MMM"];
  NSString *stringFromDate = [formatter stringFromDate:myDate];
  return stringFromDate;
}

-(IBAction)showSupportKit:(id)sender {
  [SupportKit show];
}

@end
