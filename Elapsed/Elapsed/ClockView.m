//
//  ClockView.m
//  Elapsed
//
//  Created by Jason Scharff on 9/19/15.
//  Copyright © 2015 Jason Scharff. All rights reserved.
//

#import "ClockView.h"

#import "AutoLayoutHelper.h"
#import "BEMAnalogClockView.h"
#import "Elapsed-Swift.h"


@interface ClockView()

@property (nonatomic, strong) BEMAnalogClockView *clockView;
@property (nonatomic, strong) UILabel *textLabel;

@end


@implementation ClockView

-(id)init {
  self = [super init];
  _textLabel = [UILabel new];
  [AutolayoutHelper configureView:self subViews:VarBindings(_textLabel, _clockView) constraints:@[@"H:|[_clockView]|", @"V:|[_clockView]-2-[_textLabel]", @"X:_textLabel.centerX == superview.centerX"]];
   
  return self;
}

-(void)setTime : (NSDate *)time isClockIn: (BOOL)isClockIn {
  
  NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear
                                                                fromDate:time];
  
  _clockView.minutes = components.minute;
  _clockView.hours = components.hour;
  
  if(isClockIn) {
    _clockView.minuteHandColor = [UIColor clockInColor];
    _clockView.faceBackgroundColor = [UIColor clockInColor];
    _textLabel.textColor = [UIColor clockInColor];
    _textLabel.text = @"IN";
  }
  else {
    _clockView.minuteHandColor = [UIColor clockOutColor];
    _clockView.faceBackgroundColor = [UIColor clockOutColor];
    _textLabel.textColor = [UIColor clockOutColor];
    _textLabel.text = @"OUT";
  }
}


@end
