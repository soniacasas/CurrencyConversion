//
//  AAOOCurrencyList.h
//  AnArmyOfOnes
//
//  Created by Sonia Casas on 1/6/15.
//  Copyright (c) 2015 Sonia Casas. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AAOOCurrency;

@interface AAOOCurrencyList : NSObject

/**
 * Currency count.
 */
@property (nonatomic, readonly, assign) NSUInteger currencyCount;

/**
 * Currency List. All objects are AAOOCurrency instances.
 */
@property (nonatomic, readonly, strong) NSMutableArray *currencyList;


/**
 * Returns the currency at the provided index, or nil when the index is out of bounds.
 *
 * @param index The currency index to look for.
 * @return The currency at the given index or nil when out of bounds.
 */
- (AAOOCurrency *)currencyAtIndex:(NSUInteger)index;

/**
 * Adds a currency at the end of the list. When the provided stock is nil, no action is performed.
 *
 * @param currency The currency to add.
 */
- (void)addCurrency:(AAOOCurrency *)currency;

/**
 * Removes a currency from the list. When the provided currency is not found, no action is performed.
 *
 * @param currency The currency to remove.
 */
- (void)removeCurrency:(AAOOCurrency *)currency;

/**
 * Replaces the list with the given list.
 *
 * @param list The list to update with.
 */
- (void)replaceListWithList:(NSArray *)list;

/**
 * Removes all currencies from the list.
 */
- (void)removeAllCurrencies;

@end
