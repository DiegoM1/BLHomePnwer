//
//  BLDetailViewController.h
//  BLHomepwner
//
//  Created by Diego Sebastián Monteagudo Díaz on 12/2/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLItem.h"
#import "BLchangeDateViewController.h"
NS_ASSUME_NONNULL_BEGIN

@interface BLDetailViewController : UIViewController 
@property (nonatomic,strong) BLItem *item;
-(void)addDoneButton;

@end

NS_ASSUME_NONNULL_END
