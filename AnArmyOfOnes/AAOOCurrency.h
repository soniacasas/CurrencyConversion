//
//  AAOOCurrency.h
//  AnArmyOfOnes
//
//  Created by Sonia Casas on 30/5/15.
//  Copyright (c) 2015 Sonia Casas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AAOOCurrency : NSObject

/**
 *  The related currency code.
 */
@property (nonatomic, readonly, copy) NSString *currencyCode;

/**
 * The currency Value.
 */
@property (nonatomic, readonly) float currencyValue;

/**
 * Designated initializer.
 *
 * @param code       The currency code to store.
 * @param value      The currency value to store.
 * @return The initialized currency instance.
 */
- (id)initWithCode:(NSString *)code value:(float)value;

@end
