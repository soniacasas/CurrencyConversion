//
//  AAOOCurrencyListTests.m
//  AnArmyOfOnes
//
//  Created by Sonia Casas on 2/6/15.
//  Copyright (c) 2015 Sonia Casas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "AAOOCurrencyList.h"
#import "AAOOCurrency.h"

@interface AAOOCurrencyListTests : XCTestCase

@end

@implementation AAOOCurrencyListTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCurrencyAtIndexExists
{
    AAOOCurrency *currency1 = [[AAOOCurrency alloc] initWithCode:@"EUR" value:0.9322];
    AAOOCurrency *currency2 = [[AAOOCurrency alloc] initWithCode:@"JPY" value:4.7283];
    AAOOCurrencyList *currencyList = [[AAOOCurrencyList alloc] init];
    [currencyList addCurrency:currency1];
    [currencyList addCurrency:currency2];
    
    AAOOCurrency *askedCurrency = [currencyList currencyAtIndex:1];
    
    XCTAssertEqual(currency2, askedCurrency, @"Should have matched");
    XCTAssertNotNil(askedCurrency, @"Currency should not be nil");
}

- (void)testCurrencyAtIndexDoesNotExists
{
    AAOOCurrency *currency1 = [[AAOOCurrency alloc] initWithCode:@"EUR" value:0.9322];
    AAOOCurrency *currency2 = [[AAOOCurrency alloc] initWithCode:@"JPY" value:4.7283];
    AAOOCurrencyList *currencyList = [[AAOOCurrencyList alloc] init];
    [currencyList addCurrency:currency1];
    [currencyList addCurrency:currency2];
    
    AAOOCurrency *askedCurrency = [currencyList currencyAtIndex:4];

    XCTAssertNil(askedCurrency, "Should be nil");
}

@end
