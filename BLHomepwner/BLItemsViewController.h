//
//  BLItemsViewController.h
//  BLHomepwner
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/27/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BLItemsViewController : UITableViewController
@property NSMutableArray *highPrice;
@property NSMutableArray *lowPrice;

@property (nonatomic, strong) IBOutlet UIView *headerView;
@property NSArray *items;
-(UIView *)headerView;
@end


NS_ASSUME_NONNULL_END
