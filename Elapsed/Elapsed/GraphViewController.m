//
//  GraphViewController.m
//  Elapsed
//
//  Created by Jason Scharff on 9/19/15.
//  Copyright © 2015 Jason Scharff. All rights reserved.
//

#import "GraphViewController.h"

#import "JBBarChartView.h"
#import <Realm/Realm.h>

#import "ClockInSheet.h"


@interface GraphViewController () <JBBarChartViewDataSource, JBBarChartViewDelegate>

@property (nonatomic, strong) NSArray *hoursPerDay;

@end

@implementation GraphViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  [self performCalculationsOnTime];
  [self configureNavigationBar];
    // Do any additional setup after loading the view.
}

-(void)configureBarChart {
  JBBarChartView *barChartView = [[JBBarChartView alloc] init];
  barChartView.dataSource = self;
  barChartView.delegate = self;
}

-(void)performCalculationsOnTime {
  
  RLMResults *entries = [[ClockInSheet allObjects]sortedResultsUsingProperty:@"time" ascending:NO];
  NSMutableArray *hoursPerDay = [[NSMutableArray alloc]init];
  if([entries count] >= 2) {
    for (int i=1; i < [entries count]; i++) {
      ClockInSheet *entry = [entries objectAtIndex:i];
      NSDateComponents *component = [[NSCalendar currentCalendar] components:NSCalendarUnitDay fromDate:entry.time];
    }

  }
  
}

-(void)configureNavigationBar {
  self.title = @"Elapsed";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark bar chart delegate + data source

- (NSUInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView {
  return [_hoursPerDay count];
}

- (CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtIndex:(NSUInteger)index {
  return [_hoursPerDay[index]floatValue];
}

@end
