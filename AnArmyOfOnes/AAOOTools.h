//
//  AAOOTools.h
//  AnArmyOfOnes
//
//  Created by Sonia Casas on 2/6/15.
//  Copyright (c) 2015 Sonia Casas. All rights reserved.
//

#import <Foundation/Foundation.h>

#define UIColorFromHex(hex) [UIColor colorWithRed:((float)((hex & 0xFF0000) >> 16))/255.0 green:((float)((hex & 0xFF00) >> 8))/255.0 blue:((float)(hex & 0xFF))/255.0 alpha:1.0]

@interface AAOOTools : NSObject

+ (BOOL) checkCorrectAmountText:(NSString *)amountText;


@end
