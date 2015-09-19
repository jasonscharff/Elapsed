//
//  ViewController.m
//  Elapsed
//
//  Created by Jason Scharff on 9/19/15.
//  Copyright © 2015 Jason Scharff. All rights reserved.
//

#import "ViewController.h"

#import <CoreLocation/CoreLocation.h>
#import <CoreBluetooth/CoreBluetooth.h>
#import <Realm/Realm.h>

#import "AutoLayoutHelper.h"
#import "ClockInSheet.h"
#import "GraphViewController.h"
#import "TimeCell.h"



@interface ViewController () <UITableViewDataSource, UITableViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) RLMResults *entries;
@property (nonatomic,retain) CLBeaconRegion *beaconRegion;
@property (nonatomic,retain) CLLocationManager *locationManager;


@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  [self configureNavigationBar];
  _entries = [[ClockInSheet allObjects]sortedResultsUsingProperty:@"time" ascending:NO];
  [self configureTableView];
    

    _locationManager = [[CLLocationManager alloc] init];
    _locationManager.delegate = self;
    
    [_locationManager requestAlwaysAuthorization];
    
    CLBeaconRegion *region = [[CLBeaconRegion alloc] initWithProximityUUID:[[NSUUID alloc] initWithUUIDString:@"2F234454-CF6D-4A0F-ADF2-F4911BA9FFA6"] major: 1 minor: 1 identifier: @"region"];
    region.notifyEntryStateOnDisplay = YES;
    [_locationManager startRangingBeaconsInRegion:region];
    [_locationManager startMonitoringForRegion:region];
    
    CLBeaconRegion *region2 = [[CLBeaconRegion alloc] initWithProximityUUID:[[NSUUID alloc] initWithUUIDString:@"8F3C44B8-ADE7-4FAC-95CC-7F9BF0265301"] major: 1 minor: 1 identifier: @"region2"];
    region2.notifyEntryStateOnDisplay = YES;
    [_locationManager startRangingBeaconsInRegion:region2];
    [_locationManager startMonitoringForRegion:region2];
}

-(void)configureNavigationBar {
  self.title = @"Elapsed";
  [self.navigationItem setHidesBackButton:YES];
  UIButton *graphButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 24, 24)];
  [graphButton setBackgroundImage:[UIImage imageNamed:@"graph"] forState:UIControlStateNormal];
  [graphButton addTarget:self action:@selector(graphPressed:) forControlEvents:UIControlEventTouchDown];
  UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithCustomView:graphButton];
  
  self.navigationItem.rightBarButtonItem = barButtonItem;
}


-(void)configureTableView {
  UITableView *tableView = [[UITableView alloc]init];
  tableView.allowsSelection = NO;
  [tableView registerClass:[TimeCell class] forCellReuseIdentifier:@"timeCell"];
  tableView.rowHeight = UITableViewAutomaticDimension;
  tableView.estimatedRowHeight = 65;
  tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
  [AutolayoutHelper configureView:self.view subViews:VarBindings(tableView) constraints:@[@"H:|[tableView]|", @"V:|[tableView]|"]];
  tableView.delegate = self;
  tableView.dataSource = self;
}

#pragma mark - ibeacon manager

-(void)locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
    if ([region.identifier isEqual: @"region2"]){
        NSLog(@"Welcome! - send in request.");
          ClockInSheet *sheet = [[ClockInSheet alloc]init];
          sheet.time = [NSDate date];
          sheet.isClockIn = YES;
        
        
        
          RLMRealm *realm = [RLMRealm defaultRealm];
          [realm transactionWithBlock:^{
            [realm addObject:sheet];
          }];
    }
}

-(void)locationManager:(CLLocationManager *)manager didExitRegion:(CLRegion *)region {
    if ([region.identifier isEqual: @"region2"]){
        NSLog(@"BYE! - send out request.");
        ClockInSheet *sheet = [[ClockInSheet alloc]init];
        sheet.time = [NSDate date];
        sheet.isClockIn = NO;
        
        
        
        RLMRealm *realm = [RLMRealm defaultRealm];
        [realm transactionWithBlock:^{
            [realm addObject:sheet];
        }];
    }
}

-(void)locationManager:(CLLocationManager *)manager didRangeBeacons:(NSArray *)beacons inRegion:(CLBeaconRegion *)region {
    
    CLBeacon *beacon = [[CLBeacon alloc] init];
    beacon = [beacons lastObject];

    NSLog(@"RSSI: %ld \n", (long)beacon.rssi);
    
    if (beacon.proximity == CLProximityUnknown) {
        
        NSLog(@"WTF - IDK BREH");
        
        
    } else if (beacon.proximity == CLProximityImmediate) {
        
        NSLog(@"Connected - Immediate");
        
    } else if (beacon.proximity == CLProximityNear) {
        
        NSLog(@"Connected - Near");
        
    } else if (beacon.proximity == CLProximityFar) {
        NSLog(@"Connected - Far");
        
    }
    
}


#pragma mark table view data source + delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return [_entries count];
}

- (UITableViewCell * _Nonnull)tableView:(UITableView * _Nonnull)tableView cellForRowAtIndexPath:(NSIndexPath * _Nonnull)indexPath {
  
  TimeCell *cell = [tableView dequeueReusableCellWithIdentifier:@"timeCell"];
  [cell configureWithEntry:[_entries objectAtIndex:indexPath.row]];
   return cell;
  
}

#pragma mark actions

-(IBAction)graphPressed:(id)sender {
  GraphViewController *vc = [[GraphViewController alloc]init];
  UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Back"
                                                               style:UIBarButtonItemStylePlain
                                                              target:nil
                                                              action:nil];
  
  [self.navigationItem setBackBarButtonItem:backItem];

  [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
