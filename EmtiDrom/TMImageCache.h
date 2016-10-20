//
//  TMImageCache.h
//  EmtiDrom
//
//  Created by Тарас on 20.10.16.
//  Copyright © 2016 Тарас. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface TMImageCache : NSObject

@property (nonatomic, retain) NSCache* imageCache;

+ (TMImageCache*)sharedImageCache;
- (void)AddImage:(UIImage *)image imageURL:(NSString *)imgURL;
- (UIImage *)GetImage:(NSString *)imageURL;
- (BOOL)DoesExist:(NSString *)imageURL;

@end
