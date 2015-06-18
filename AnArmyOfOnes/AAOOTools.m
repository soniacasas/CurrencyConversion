//
//  AAOOTools.m
//  AnArmyOfOnes
//
//  Created by Sonia Casas on 2/6/15.
//  Copyright (c) 2015 Sonia Casas. All rights reserved.
//

#import "AAOOTools.h"

@implementation AAOOTools

#pragma mark - Data checking

/*
 * Checks if the given text is correct for an amount, that is to say,
 */
+ (BOOL) checkCorrectAmountText:(NSString *)amountText {
    
    NSString *numberRegex = [NSString stringWithFormat:@"[0-9]+"];
    NSPredicate *numberTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", numberRegex];
    return [numberTest evaluateWithObject:amountText];
}

@end
