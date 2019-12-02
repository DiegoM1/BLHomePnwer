//
//  BLItemStore.h
//  BLHomepwner
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/27/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BLItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface BLItemStore : NSObject

@property (nonatomic) NSArray *allItems;
+(instancetype)sharedStore;
-(instancetype)initPrivate;
-(BLItem *)createItem;
- (void)removeItem:(BLItem *)item;
- (void)moveItemAtIndex:(NSUInteger)fromIndex
                toIndex:(NSUInteger)toIndex;

@end

NS_ASSUME_NONNULL_END
