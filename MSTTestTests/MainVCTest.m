//
//  MainVCTest.m
//  MSTTest
//
//  Created by Эдуард Пятницын on 05.07.15.
//  Copyright (c) 2015 EP. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "MainVC.h"

@interface MainVCTest : XCTestCase{
    MainVC *controller;
}

@end

@implementation MainVCTest

- (void)setUp {
    [super setUp];
    
    UIStoryboard *mainStoryboard = [UIStoryboard storyboardWithName:@"Main"
                                                             bundle: nil];
    controller = (MainVC*)[mainStoryboard instantiateViewControllerWithIdentifier: @"MainVC"];
    XCTAssertNotNil(controller);
    [controller view];
}

-(void) testFactorialField{
    XCTAssertNotNil(controller.factorialField);
    [controller.factorialField setText:@"(asd7%)"];
    [controller.factorialField sendActionsForControlEvents:UIControlEventEditingChanged];
    XCTAssertEqualObjects(controller.factorialField.text, @"7", @"expected:7 but value:%@",controller.factorialField.text);
}

-(void) testFactorialFoo{
    XCTAssertEqual([controller factorial:0], 1, @"expected:1 but value:%llu",[controller factorial:0]);
    XCTAssertEqual([controller factorial:6], 720, @"expected:720 but value:%llu",[controller factorial:6]);
}

-(void) testFactorial{
    [controller.factorialField setText:@"7"];
    [controller.factorialResultBtn sendActionsForControlEvents:UIControlEventTouchUpInside];
    XCTAssertNotEqualObjects(controller.resultField.text, @"");
}

-(void) testResolutionFieldValue{
    [controller.resolutionField setText:@"12"];
    XCTAssertFalse([controller isResolutionFieldOk]);
    [controller.resolutionField setText:@"12x"];
    XCTAssertFalse([controller isResolutionFieldOk]);
    [controller.resolutionField setText:@"12x12"];
    XCTAssertTrue([controller isResolutionFieldOk]);
}

@end
