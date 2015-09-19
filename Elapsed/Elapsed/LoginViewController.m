//
//  LoginViewController.m
//  Elapsed
//
//  Created by Jason Scharff on 9/19/15.
//  Copyright © 2015 Jason Scharff. All rights reserved.
//

#import "LoginViewController.h"

#import "AutoLayoutHelper.h"

@interface LoginViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *usernameField;
@property (nonatomic, strong) UITextField *passwordField;

@end

@implementation LoginViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  self.title = @"Elapsed";
}


-(void)addTextFields {
  _usernameField = [[UITextField alloc]init];
  _usernameField.placeholder = @"username";
  _usernameField.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
  _usernameField.delegate = self;
  _usernameField.tag = 1;
  _usernameField.returnKeyType = UIReturnKeyNext;
  _passwordField = [[UITextField alloc]init];
  _passwordField.placeholder = @"password";
  _passwordField.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:16];
  _passwordField.tag = 2;
  _passwordField.secureTextEntry = YES;
  _passwordField.returnKeyType = UIReturnKeyGo;
  
//  [AutolayoutHelper configureView:self.view subViews:VarBindings(_passwordField, _usernameField) constraints:<#(NSArray *)#>]
}

- (BOOL)textFieldShouldReturn:(UITextField * _Nonnull)textField {
  if(textField.tag == 1) {
    [textField resignFirstResponder];
    [_passwordField becomeFirstResponder];
  }
  else {
    //Send information to server, display error if wrong
  }
 
  return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
