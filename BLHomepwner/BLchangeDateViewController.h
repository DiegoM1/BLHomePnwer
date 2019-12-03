//
//  BLchangeDateViewController.h
//  BLHomepwner
//
//  Created by Diego Sebastián Monteagudo Díaz on 12/2/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BLItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface BLchangeDateViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;

@property (nonatomic,strong) BLItem *item;

@end

NS_ASSUME_NONNULL_END
