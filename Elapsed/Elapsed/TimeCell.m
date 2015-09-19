//
//  TimeCell.m
//  Elapsed
//
//  Created by Jason Scharff on 9/19/15.
//  Copyright © 2015 Jason Scharff. All rights reserved.
//

#import "TimeCell.h"

#import "AutoLayoutHelper.h"
#import "ClockInSheet.h"
#import "ClockView.h"
#import "Elapsed-Swift.h"



@interface TimeCell()

@property (nonatomic, strong)ClockView *clockView;
@property (nonatomic, strong) UILabel *mainTimeLabel;
@property (nonatomic, strong) NSDateFormatter *formatter;

@end

@implementation TimeCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
  self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
  _mainTimeLabel = [UILabel new];
  _mainTimeLabel.font = [UIFont fontWithName:@"HelveticaNeue-Bold"  size:25];
  _clockView = [[ClockView alloc]init];
  _formatter = [[NSDateFormatter alloc]init];
  [_formatter setDateFormat:@"h:mm a"];
  UIView *spacerOne = [UIView new];
  UIView *spacerTwo = [UIView new];
  [AutolayoutHelper configureView:self subViews:VarBindings(_mainTimeLabel, _clockView, spacerOne, spacerTwo) constraints:@[@"V:|-10-[_clockView]-8-|", @"H:|-20-[_clockView][spacerOne][_mainTimeLabel][spacerTwo(==spacerOne)]|", @"X:_mainTimeLabel.centerY == superview.centerY"]];
  
  
  return self;
}

-(void)configureWithEntry : (ClockInSheet *)entry {
  [_clockView setTime:entry.time isClockIn:entry.isClockIn];
  NSString *time = [_formatter stringFromDate:entry.time];
  _mainTimeLabel.text = time;
  if(entry.isClockIn) {
    _mainTimeLabel.textColor = [UIColor clockInColor];
  }
  else {
    _mainTimeLabel.textColor = [UIColor clockOutColor];
  }
  
}

@end
