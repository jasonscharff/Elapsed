//
//  ViewController.m
//  Elapsed
//
//  Created by Jason Scharff on 9/19/15.
//  Copyright © 2015 Jason Scharff. All rights reserved.
//

#import "ViewController.h"

#import <Realm/Realm.h>

#import "AutoLayoutHelper.h"
#import "ClockInSheet.h"
#import "TimeCell.h"


@interface ViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) RLMResults *entries;


@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  self.title = @"Elapsed";
  _entries = [[ClockInSheet allObjects]sortedResultsUsingProperty:@"time" ascending:NO];
  [self configureTableView];
}

-(void)configureTableView {
  UITableView *tableView = [[UITableView alloc]init];
  [tableView registerClass:[TimeCell class] forCellReuseIdentifier:@"timeCell"];
  tableView.rowHeight = UITableViewAutomaticDimension;
  tableView.estimatedRowHeight = 65;
  tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
  [AutolayoutHelper configureView:self.view subViews:VarBindings(tableView) constraints:@[@"H:|[tableView]|", @"V:|[tableView]|"]];
  tableView.delegate = self;
  tableView.dataSource = self;
  
  
  
  
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


- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
