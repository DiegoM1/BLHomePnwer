//
//  BLItemStore.m
//  BLHomepwner
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/27/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "BLItemStore.h"
#import "BLItem.h"
@interface BLItemStore ()
@property (nonatomic) NSMutableArray *privateItems;

@end

@implementation BLItemStore
+(instancetype)sharedStore{
    static BLItemStore *sharedStore = nil;
    if (!sharedStore){
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}
-(instancetype)init {
    @throw [NSException exceptionWithName:@"Singleton" reason:@"User + [BLItemStore sharedStore]" userInfo:nil];
    return nil;
}
-(instancetype)initPrivate{
    self = [super init];
    if(self){
        _privateItems = [[NSMutableArray alloc]init];
    }
    return self;
}
-(NSArray *)allItems{
    return self.privateItems;
}
-(BLItem *)createItem{
    BLItem *item = [BLItem randomItem];
    [self.privateItems addObject:item];
    return item;
}
@end
