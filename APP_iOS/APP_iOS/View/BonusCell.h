//
//  BonusCell.h
//  APP_iOS
//
//  Created by 林小果 on 15/10/4.
//  Copyright (c) 2015年 Li. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^BonusBlock)(NSInteger row);

@interface BonusCell : UITableViewCell

@property (nonatomic, strong)IBOutlet UILabel *lblTitle;
@property (nonatomic, strong)IBOutlet UILabel *lblFee;

@property (nonatomic, assign)NSInteger row;
@property (nonatomic, copy)BonusBlock block;
@end
