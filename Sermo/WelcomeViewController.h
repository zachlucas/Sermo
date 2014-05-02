//
//  WelcomeViewController.h
//  Sermo
//
//  Created by Zach Lucas on 5/2/14.
//  Copyright (c) 2014 Zach Lucas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface WelcomeViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong, nonatomic) IBOutlet UIPickerView *nativeLanguagePicker;
@property (strong, nonatomic)          NSArray *languageArray;

@property(nonatomic) NSString *username;
@property(nonatomic) NSString *email;
@property(nonatomic) NSString *password;
@property (strong, nonatomic) IBOutlet UILabel *SermoTitle;
@property (strong, nonatomic) IBOutlet UILabel *HiLabel;
@property (strong, nonatomic) IBOutlet UIButton *ContinueButton;

@end
