//
//  IncomeViewCtr.m
//  APP_iOS
//
//  Created by 林小果 on 15/10/2.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import "IncomeViewCtr.h"
#import "IncomeCell.h"
#import "BindBankCell.h"
#import "UITableView+Separator.h"

@interface IncomeViewCtr ()
@property (nonatomic, strong)IBOutlet UITableView *tableView;
@end

@implementation IncomeViewCtr

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setTitle:@"收入管理"];
    kWEAKSELF;
    [self setLeftBarButtonWithTitle:@"返回" withBlock:^(NSInteger tag) {
        [weakSelf backAction];
    }];
    [_tableView setNoFooterSeparator];
    [_tableView setFullWidthSeparator];
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


#pragma mark -  UITableViewDelegate
//section头部间距
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 5;
}
//section头部视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 5)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}
//section底部间距
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}
//section底部视图
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view=[[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.frame.size.width, 1)];
    view.backgroundColor = [UIColor clearColor];
    return view;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0)
        return 165;
    else
        return 44;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
        return 2;
    else
        return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        static NSString *identifier=@"IncomeCell";
        IncomeCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [CustomView viewWithNibName:@"IncomeCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        
        return cell;
    } else {
        static NSString *identifier=@"BindBankCell";
        BindBankCell *cell=[tableView dequeueReusableCellWithIdentifier:identifier];
        if (cell == nil) {
            cell = [CustomView viewWithNibName:@"BindBankCell"];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        return cell;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:[tableView indexPathForSelectedRow] animated:YES];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
@end
