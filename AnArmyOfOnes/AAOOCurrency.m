//
//  AAOOCurrency.m
//  AnArmyOfOnes
//
//  Created by Sonia Casas on 30/5/15.
//  Copyright (c) 2015 Sonia Casas. All rights reserved.
//

#import "AAOOCurrency.h"

@implementation AAOOCurrency

@synthesize currencyCode,currencyValue;

/*
 * Designated initializer.
 */
- (id)initWithCode:(NSString *)code value:(float)value {
    
    self = [super init];
    
    if (self) {
        
        currencyCode = code;
        currencyValue = value;
    }
    
    return self;
}

@end
