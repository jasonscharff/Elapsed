//
//  TimeCell.h
//  Elapsed
//
//  Created by Jason Scharff on 9/19/15.
//  Copyright © 2015 Jason Scharff. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ClockInSheet;
@interface TimeCell : UITableViewCell


-(void)configureWithEntry : (ClockInSheet *)entry;

@end
