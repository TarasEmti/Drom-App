//
//  TMDownloadViewController.h
//  EmtiDrom
//
//  Created by Тарас on 15.10.16.
//  Copyright © 2016 Тарас. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TMDownloadViewController : NSObject {
    SEL successSelector;
}

@property (nonatomic, assign) id delegate;
@property (nonatomic, assign) NSInteger tag;
@property (nonatomic, retain) NSMutableData *downloadData;
@property (nonatomic, retain) NSURLResponse *response;
@property (nonatomic, retain) NSURLConnection *connection;

+ (id)downloadWithURL:(NSString*)url delegate:(id)delegate sel:(SEL)selector;
+ (id)downloadWithURL:(NSString*)url delegate:(id)delegate;

- (void)setSuccessSelector:(SEL)selector;
- (void)cancel;

@end
