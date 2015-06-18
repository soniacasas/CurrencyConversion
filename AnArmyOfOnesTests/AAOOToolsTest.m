//
//  AAOOToolsTest.m
//  AnArmyOfOnes
//
//  Created by Sonia Casas on 2/6/15.
//  Copyright (c) 2015 Sonia Casas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AAOOTools.h"

@interface AAOOToolsTest : XCTestCase

@end

@implementation AAOOToolsTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGivenIntegerAmountIsCorrect
{
    BOOL isAnIntegerAmount = [AAOOTools checkCorrectAmountText:@"123456"];
    
    XCTAssertTrue(isAnIntegerAmount, @"123456 is a Valid Integer Amount");
}

- (void)testGivenIntegerAmountIsNotCorrect
{
    BOOL isAnIntegerAmount = [AAOOTools checkCorrectAmountText:@"1234.56"];
    
    XCTAssertFalse(isAnIntegerAmount, @"1234.56 is not Valid Integer Amount");
    
    isAnIntegerAmount = [AAOOTools checkCorrectAmountText:@"123A56"];
    
    XCTAssertFalse(isAnIntegerAmount, @"123A56 Is not a valid integer amount because text have a non numeric character");
}

@end
