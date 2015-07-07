//
//  PicVCTest.m
//  MSTTest
//
//  Created by Эдуард Пятницын on 05.07.15.
//  Copyright (c) 2015 EP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "PicVC.h"

@interface PicVCTest : XCTestCase{
    PicVC *controller;
}

@end

@implementation PicVCTest

- (void)setUp {
    [super setUp];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    controller = (PicVC*)[mainStoryboard instantiateViewControllerWithIdentifier: @"PicVC"];
    [controller view];
}

-(void) testController{
    XCTAssertNotNil(controller);
    
    NSURL *url = [NSURL URLWithString:imageURL];
    
    __block BOOL waitingForBlock = YES;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       waitingForBlock = NO;
                       NSData *imgData = [NSData dataWithContentsOfURL:url];
                       UIImage *img = [UIImage imageWithData:imgData];
                       XCTAssertNotNil(img);
                   });
    
    while(waitingForBlock) {
        [[NSRunLoop currentRunLoop] runMode:NSDefaultRunLoopMode
                                 beforeDate:[NSDate dateWithTimeIntervalSinceNow:0.1]];
    }
}

@end
