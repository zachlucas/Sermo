//
//  ViewController.h
//  Sermo
//
//  Created by Zach Lucas on 5/2/14.
//  Copyright (c) 2014 Zach Lucas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface ViewController : UIViewController 
@property (strong, nonatomic) IBOutlet UILabel *SermoTitle;
@property (strong, nonatomic) IBOutlet UITextField *nameText;
@property (strong, nonatomic) IBOutlet UITextField *emailText;
@property (strong, nonatomic) IBOutlet UITextField *firstPWText;
@property (strong, nonatomic) IBOutlet UITextField *secondPWText;
@property (strong, nonatomic) IBOutlet UILabel *SignUpLabel;
@property (strong, nonatomic) IBOutlet UIButton *noName;
@property (strong, nonatomic) IBOutlet UIButton *noEmail;
@property (strong, nonatomic) IBOutlet UIButton *noFirstPW;
@property (strong, nonatomic) IBOutlet UIButton *noSecondPW;

@property (nonatomic) NSString *languagePicked;


@end
