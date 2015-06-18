//
//  AAOOConverterViewController.m
//  AnArmyOfOnes
//
//  Created by Sonia Casas on 30/5/15.
//  Copyright (c) 2015 Sonia Casas. All rights reserved.
//

#import "AAOOConverterViewController.h"
#import <AFNetworking/AFNetworking.h>
#import "AAOOCurrencyList.h"
#import "AAOOCurrency.h"
#import "AAOOTools.h"
#import "AAOOBarChartViewController.h"

#define currenciesToConvert                               @[@"GBP",@"EUR",@"JPY",@"BRL"]
#define currenciesToConvertDescription                           @{@"GBP":@"UK Pounds", @"EUR":@"EU Euro", @"JPY":@"Japan Yen", @"BRL":@"Brazil Reais"}
#define prefixLabel @"that is"


@interface AAOOConverterViewController () <AKPickerViewDataSource, AKPickerViewDelegate, UITextFieldDelegate>

/**
 * The currency list.
 */
@property (nonatomic, readonly, copy) AAOOCurrencyList *currencyList;

/**
 * The currency list.
 */
@property (nonatomic, readonly, copy) AAOOCurrency *actualCurrency;

@end

@implementation AAOOConverterViewController

@synthesize currencyList = currencyList_;
@synthesize actualCurrency = actualCurrency_;
@synthesize currencyPicker = currencyPicker_;
@synthesize amountTextField = amountTextField_;
@synthesize convertedAmountLabel = convertedAmountLabel_;
@synthesize activity = activity_;
@synthesize messageView = messageView_;
@synthesize messageLabel = messageLabel_;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    currencyList_ = [[AAOOCurrencyList alloc]init];
    [currencyPicker_ setDelegate:self];
    [currencyPicker_ setDataSource:self];
    [currencyPicker_ setInteritemSpacing:5.0f];
    
    [self performRetrieveCurrencyConvertions];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void) performRetrieveCurrencyConvertions {
    
    [activity_ setHidden:NO];
    [self.navigationItem setTitle:@"Loading Rates..."];
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@"http://api.fixer.io/latest?base=USD" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"JSON: %@", responseObject);
        [self requestSucceedWithResponseObject:responseObject];
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"Error: %@", error);
        [self requestFailureWithError:error];
    }];
    
}

- (void) requestSucceedWithResponseObject: (NSDictionary *) responseObject {
    
    if ([responseObject isKindOfClass:[NSDictionary class]]) {
        
        NSDictionary *responseDict = responseObject;
        if ([responseDict objectForKey:@"rates"]) {
            
            NSDictionary *allRates = [responseObject objectForKey:@"rates"];
            for (int i = 0; i < [currenciesToConvert count]; i++) {
                
                if ([allRates objectForKey:currenciesToConvert[i]]) {
                    
                    float value = [[allRates objectForKey:currenciesToConvert[i]] floatValue];
                    
                    AAOOCurrency *actulCurrency = [[AAOOCurrency alloc] initWithCode:currenciesToConvert[i] value:value];
                    [currencyList_ addCurrency:actulCurrency];
                }
            }
            
            if ([currencyList_ currencyCount] == 0) {
                [self showErrorWithString:@"There's no rates for given currency codes"];
                NSLog(@"There's no rates for given currency codes");
            }
            else {
                [currencyPicker_ reloadData];
                [currencyPicker_ selectItem:0 animated:NO];
            }
            
        }
        else {
            [self showErrorWithString:@"Error obtaining rates"];
            NSLog(@"Error obtaining rates");
        }
        
    }
    else {
        [self showErrorWithString:@"There's a problem with the server response"];
        NSLog(@"There's a problem with the server response");
    }
    
    [self.navigationItem setTitle:@"An Army Of Ones"];
    [activity_ setHidden:YES];
    
}

- (void) showErrorWithString: (NSString *)errorString {
    [messageLabel_ setText:errorString];
    [messageView_ setHidden:NO];
}

- (void) requestFailureWithError: (NSError *) error {
    
    [activity_ setHidden:YES];
    [self showErrorWithString:[error localizedDescription]];
    
}

- (void) updateRateWithAmount: (NSInteger)amount {
    
    double convertedAmount = (amount * [actualCurrency_ currencyValue]);
    
    [convertedAmountLabel_ setText:[NSString stringWithFormat:@"%@ %f",prefixLabel, convertedAmount]];
}

#pragma-mark IBActions

- (IBAction)tryAgainButtonTapped:(id)sender {
    [self performRetrieveCurrencyConvertions];
    [messageView_ setHidden:YES];
}

#pragma-mark Picker-View Delegate

- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView {
    return [currencyList_ currencyCount];
}

- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item {
    AAOOCurrency *currency = [currencyList_ currencyAtIndex:item];
    if ([currenciesToConvertDescription objectForKey: [currency currencyCode]]) {
        return [currenciesToConvertDescription objectForKey: [currency currencyCode]];
    }
    else
        return nil;
}

- (void)pickerView:(AKPickerView *)pickerView didSelectItem:(NSInteger)item {
    actualCurrency_ = [currencyList_ currencyAtIndex:item];
    if ([AAOOTools checkCorrectAmountText:[amountTextField_ text]]) {
        [self updateRateWithAmount:[[amountTextField_ text] integerValue]];
    }
}

#pragma mark - TextField Degelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    
    NSString *text = [[textField text] stringByReplacingCharactersInRange:range withString:string];
    
    if ([text length] > 0) {
        if ([AAOOTools checkCorrectAmountText:text]) {
            [self updateRateWithAmount:[text integerValue]];
            return YES;
        }
        else
            return NO;
    }
    else {
        [self updateRateWithAmount:0];
    }
    
    return YES;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString: @"segueStatitics"]) {
        AAOOBarChartViewController *destinationViewController = [segue destinationViewController];
        
        [destinationViewController setCurrencyList:currencyList_];
    }
}

@end
