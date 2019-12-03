//
//  BLImageStore.m
//  BLHomepwner
//
//  Created by Diego Sebastián Monteagudo Díaz on 12/3/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "BLImageStore.h"
#import "BLItem.h"
@interface BLImageStore ()
@property (nonatomic, strong) NSMutableDictionary *dictionary;
@end
@implementation BLImageStore
+ (instancetype)sharedStore
{
    static BLImageStore *sharedStore = nil;
    if (!sharedStore) {
        sharedStore = [[self alloc] initPrivate];
    }
    return sharedStore;
}
// No one should call init
- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Singleton"
                                   reason:@"Use +[BLImageStore sharedStore]"
                                    userInfo:nil];
    return nil ;}
            // Secret designated initializer
 - (instancetype)initPrivate
    {
        self = [super init];
        if (self) {
            _dictionary = [[NSMutableDictionary alloc] init];
        }
        return self;
    }
- (void)setImage:(UIImage *)image forKey:(NSString *)key
{
     self.dictionary[key] = image;
}
- (UIImage *)imageForKey:(NSString *)key
{
    return self.dictionary[key];
}
- (void)deleteImageForKey:(NSString *)key
{
    if (!key) {
        return;
    }
    [self.dictionary removeObjectForKey:key];
}

@end
