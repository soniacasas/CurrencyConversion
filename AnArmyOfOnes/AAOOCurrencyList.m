//
//  AAOOCurrencyList.m
//  AnArmyOfOnes
//
//  Created by Sonia Casas on 1/6/15.
//  Copyright (c) 2015 Sonia Casas. All rights reserved.
//

#import "AAOOCurrencyList.h"
#import "AAOOCurrency.h"

@implementation AAOOCurrencyList

@synthesize currencyList = currencyList_;

/**
 * Superclass designated initializer. Initializes a CurrencyList instance by creating its internal elements.
 *
 * @return An initialized CurrencyList instance.
 */
- (id)init {
    
    if ((self = [super init])) {
        
        currencyList_ = [[NSMutableArray alloc] init];
    }
    
    return self;
}

#pragma mark - Accessing list

/*
 * Returns the currency at the provided index, or nil when the index is out of bounds.
 */
- (AAOOCurrency *)currencyAtIndex:(NSUInteger)index {
    
    AAOOCurrency *result = nil;
    
    if (index < [currencyList_ count]) {
        
        result = [currencyList_ objectAtIndex:index];
        
    }
    
    return result;
}

#pragma mark - Currency list management

/*
 * Adds a currency at the end of the list. When the provided currency is nil, no action is performed.
 */
- (void)addCurrency:(AAOOCurrency *)currency {
    
    if (currency != nil) {
        
        @synchronized(currencyList_) {
            
            [currencyList_ addObject:currency];
            
        }
    }
}

/*
 * Removes a currency from the list. When the provided currency is not found, no action is performed.
 */
- (void)removeCurrency:(AAOOCurrency *)currency{
    
    if (currency != nil) {
        
        @synchronized(currencyList_) {
            
            [currencyList_ removeObject:currency];
            
        }
    }
}

/*
 * Removes all stocks from the list.
 */
- (void)removeAllCurrencies {
    
    @synchronized(currencyList_) {
        
        [currencyList_ removeAllObjects];
        
    }
}

/*
 * Replaces the list with the given list.
 */
- (void)replaceListWithList:(NSArray *)list {
    
    [self removeAllCurrencies];
    
    for (AAOOCurrency *currency in list) {
        
        [self addCurrency:currency];
    }
}

#pragma mark - Properties selectors

/*
 * Returns the currency count.
 */
- (NSUInteger)currencyCount {
    
    return [currencyList_ count];
    
}

/*
 * Returns the stocks list.
 */
- (NSMutableArray *)currencyList {
    
    NSMutableArray *result = nil;
    
    @synchronized(currencyList_) {
        
        result = [NSMutableArray arrayWithArray:currencyList_];
        
    }
    
    return result;
    
}


@end
