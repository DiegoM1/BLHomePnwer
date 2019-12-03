//
//  BLImageStore.h
//  BLHomepwner
//
//  Created by Diego Sebastián Monteagudo Díaz on 12/3/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BLImageStore : NSObject
+ (instancetype)sharedStore;

-(void)setImage:(UIImage *)image forKey:(NSString *)key;
-(UIImage *)imageForKey:(NSString *)key;
-(void)deleteImageForKey:(NSString *)key;
@end

NS_ASSUME_NONNULL_END
