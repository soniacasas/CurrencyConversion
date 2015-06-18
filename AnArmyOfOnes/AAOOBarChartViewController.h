//
//  AAOOBarChartViewController.h
//  AnArmyOfOnes
//
//  Created by Sonia Casas on 2/6/15.
//  Copyright (c) 2015 Sonia Casas. All rights reserved.
//

#import "JBBaseChartViewController.h"
#import "AAOOCurrencyList.h"
#import <UIKit/UIKit.h>

@interface AAOOBarChartViewController : JBBaseChartViewController

/**
 * The currency list.
 */
@property (nonatomic,retain) AAOOCurrencyList *currencyList;

@end
