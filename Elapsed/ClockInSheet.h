//
//  ClockInSheet.h
//  Elapsed
//
//  Created by Jason Scharff on 9/19/15.
//  Copyright © 2015 Jason Scharff. All rights reserved.
//

#import <Realm/Realm.h>

@interface ClockInSheet : RLMObject
@property (nonatomic, strong) NSDate *time;
@property (nonatomic) BOOL isClockIn;
@end

// This protocol enables typed collections. i.e.:
// RLMArray<ClockInSheet>
RLM_ARRAY_TYPE(ClockInSheet)
