//
//  AAOOConverterViewController.h
//  AnArmyOfOnes
//
//  Created by Sonia Casas on 30/5/15.
//  Copyright (c) 2015 Sonia Casas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AKPickerView.h>

@interface AAOOConverterViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *amountTextField;
@property (weak, nonatomic) IBOutlet UILabel *convertedAmountLabel;
@property (weak, nonatomic) IBOutlet AKPickerView *currencyPicker;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;
@property (strong, nonatomic) IBOutlet UIView *messageView;
@property (weak, nonatomic) IBOutlet UILabel *messageLabel;

@end
