//
//  ClockView.h
//  Elapsed
//
//  Created by Jason Scharff on 9/19/15.
//  Copyright © 2015 Jason Scharff. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClockView : UIView

-(void)setTime : (NSDate *)time isClockIn: (BOOL)isClockIn;

@end
