//
//  TMDownloadViewController.m
//  EmtiDrom
//
//  Created by Тарас on 15.10.16.
//  Copyright © 2016 Тарас. All rights reserved.
//

#import "TMDownloadViewController.h"

@implementation TMDownloadViewController

@synthesize delegate;
@synthesize tag;
@synthesize downloadData;
@synthesize response;
@synthesize connection;

- (void)dealloc {
    self.downloadData = nil;
    self.response = nil;
    self.connection = nil;
}

+ (id)downloadWithURL:(NSString*)url delegate:(id)delegate sel:(SEL)selector {
    TMDownloadViewController *request = [TMDownloadViewController downloadWithURL:url delegate:delegate];
    [request setSuccessSelector:selector];
    return request;
}

+ (id)downloadWithURL:(NSString*)url delegate:(id)delegate {
    TMDownloadViewController *request = [[TMDownloadViewController alloc] init];
    
    return request;
}

@end
