//
//  TMImageCache.m
//  EmtiDrom
//
//  Created by Тарас on 20.10.16.
//  Copyright © 2016 Тарас. All rights reserved.
//

#import "TMImageCache.h"

@implementation TMImageCache

@synthesize imageCache;

static TMImageCache* sharedImageCache = nil;

+ (TMImageCache *)sharedImageCache {
    @synchronized ([TMImageCache class]) {
        
        if (!sharedImageCache)
            sharedImageCache = [[self alloc] init];
    
        return sharedImageCache;
    }
    return nil;
}

+ (id)alloc {
    
    @synchronized ([TMImageCache class]) {
        sharedImageCache = [super alloc];
        
        return sharedImageCache;
    }
    
    return nil;
}

- (id)init {
    self = [super init];
    if (self != nil) {
        imageCache = [[NSCache alloc] init];
    }
    
    return self;
}

- (void)AddImage:(UIImage *)image imageURL:(NSString *)imgURL; {
    
    [imageCache setObject:image forKey:imgURL];
}

- (UIImage *)GetImage:(NSString *)imageURL {
    
    return [imageCache objectForKey:imageURL];
}

- (BOOL)DoesExist:(NSString *)imageURL {
    if ([imageCache objectForKey:imageURL] == nil) {
        return false;
    }
    return true;
}

@end
