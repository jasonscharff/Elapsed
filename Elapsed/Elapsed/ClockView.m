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
  _clockView = [[BEMAnalogClockView alloc]init];
  _clockView.secondHandAlpha = 0;
  _clockView.minuteHandWidth = 2;
  _clockView.hourHandWidth = 2;
  _clockView.hourHandLength = 11;
  _clockView.hourHandOffsideLength = 1;
  _clockView.minuteHandLength = 15;
  _clockView.minuteHandOffsideLength = 1;
  _clockView.faceBackgroundColor = [UIColor clearColor];
  [AutolayoutHelper configureView:self subViews:VarBindings(_textLabel, _clockView) constraints:@[@"H:|[_clockView(==40)]|", @"V:|[_clockView(==40)]-2-[_textLabel]|", @"X:_textLabel.centerX == superview.centerX"]];

  return self;
}

-(void)setTime : (NSDate *)time isClockIn: (BOOL)isClockIn {
  
  NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear
                                                                fromDate:time];
  [UIView setAnimationsEnabled:NO];
  _clockView.minutes = components.minute;
  _clockView.hours = components.hour;
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [UIView setAnimationsEnabled:YES];
});
  
  
  if(isClockIn) {
    _clockView.minuteHandColor = [UIColor clockInColor];
    _clockView.hourHandColor = [UIColor clockInColor];
    _clockView.borderColor = [UIColor clockInColor];
    _textLabel.textColor = [UIColor clockInColor];
    _textLabel.text = @"IN";
  }
  else {
    _clockView.minuteHandColor = [UIColor clockOutColor];
    _clockView.hourHandColor = [UIColor clockOutColor];
    _clockView.borderColor = [UIColor clockOutColor];
    _textLabel.textColor = [UIColor clockOutColor];
    _textLabel.text = @"OUT";
  }
}


@end
