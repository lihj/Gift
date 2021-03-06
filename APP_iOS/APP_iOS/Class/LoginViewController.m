//
//  LoginViewController.m
//  APP_iOS
//
//  Created by Li on 15/10/8.
//  Copyright © 2015年 Li. All rights reserved.
//

#import "LoginViewController.h"
#import "KeyboardManager.h"
#import "AppDelegate.h"
#import "ShopModel.h"
#import "NSDictionary+JSONString.h"
#import "DES3Util.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [_nickNameTextField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
    [_passwordTextField setValue:[UIColor lightGrayColor] forKeyPath:@"_placeholderLabel.textColor"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    _nickNameTextField.text = [ShareValue instance].loginName;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Action

- (IBAction)loginAction:(id)sender {
    
    if (!_nickNameTextField.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入用户名"];
        return;
    }
    if (!_passwordTextField.text.length) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        return;
    }
    
    [ShareValue instance].loginName = _nickNameTextField.text;
    [ShareValue instance].loginPwd = _passwordTextField.text;
    
    [[Http instance] login:_nickNameTextField.text pwd:_passwordTextField.text completion:^(NSError *error, ShopModel *shop) {
        if (error.code == 0) {
            NSLog(@"登陆成功，用户名字：%@", shop.name);
            [ShareValue instance].shopModel = shop;
            [kAppDelegate showMainViewController];
        }
        else {
            [SVProgressHUD showErrorWithStatus:@"登录失败!"];
        }
    }];

}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
    if (textField == _passwordTextField) {
        [[IQKeyboardManager sharedManager] setKeyboardDistanceFromTextField:125];
    }
    else if (textField == _nickNameTextField) {
        [[IQKeyboardManager sharedManager] setKeyboardDistanceFromTextField:170];
    }
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField {
    [[IQKeyboardManager sharedManager] setKeyboardDistanceFromTextField:10];
    return YES;
}

@end
