//
//  ViewController.m
//  Sermo
//
//  Created by Zach Lucas on 5/2/14.
//  Copyright (c) 2014 Zach Lucas. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

NSString* username = @"";
NSString* email = @"";
NSString* password = @"";

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"la: %@",_languagePicked);

    // white status bar
    [self setNeedsStatusBarAppearanceUpdate];
    
    _SermoTitle.center = CGPointMake(150, -250);
    _nameText.center = CGPointMake(150, -250);
    _SignUpLabel.center = CGPointMake(150, -250);
    _emailText.center = CGPointMake(150, 650);
    _firstPWText.center = CGPointMake(150, 650);
    _secondPWText.center = CGPointMake(150, 650);
    //_nativeLanguagePicker.center = CGPointMake(150, 650);

    _SermoTitle.layer.opacity = 0.1;
    
    [UIView animateWithDuration:2.0f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         _SermoTitle.center = CGPointMake(200, 200);
         _SermoTitle.layer.opacity = 1;
         _SignUpLabel.center = CGPointMake(300, 300);
       //  _nativeLanguagePicker.center = CGPointMake(300, 400);
         _nameText.center = CGPointMake(300, 300);
         _emailText.center = CGPointMake(300, 300);
         _firstPWText.center = CGPointMake(300, 300);
         _secondPWText.center = CGPointMake(300, 300);
     }
                     completion:nil];
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)signUp:(id)sender {
    NSLog(@"Signing Up");
    [self userSignUp];
}

// Signs the user up for the service
- (void)userSignUp {
    if (_nameText.text.length < 1){
        _noName.hidden = NO;
        _nameText.text = @"";
    }
    else if (_emailText.text.length < 1) {
        _noEmail.hidden = NO;
        _emailText.text = @"";
    }
    else if (![_firstPWText.text isEqualToString:_secondPWText.text]) {
        _noFirstPW.hidden = NO;
        _firstPWText.text = @"";
        _secondPWText.text = @"";
    }
    else{
        PFUser *user = [PFUser user];
        user.username = _nameText.text;
        user.password = _firstPWText.text;
        user.email = _emailText.text;
        
        
        // other fields can be set just like with PFObject
        //user[@"phone"] = @"415-392-0202";
        user[@"nativeLanguage"] = _languagePicked;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                NSLog(@"Successful Sign up!");
                // Hooray! Let them use the app now.
                [PFUser logInWithUsernameInBackground:user.username password:user.password
                                                block:^(PFUser *user, NSError *error) {
                                                    if (user) {
                                                        // Do stuff after successful login.
                                                        // Segue to main app
                                                        [self performSegueWithIdentifier:@"doneSigningUpSegue" sender:nil];
                                                    } else {
                                                        // The login failed. Check error to see why.
                                                    }
                                                }];
                
                
                
            } else {
                //NSString *errorString = [error userInfo][@"error"];
                NSLog(@"%d",[error code]);
                if ([error code] == 125) {
                    _noEmail.hidden = NO;
                    _emailText.text = @"";
                }
                if ([error code] == 202) {
                    _noName.hidden = NO;
                    _nameText.text = @"";
                }
                // Show the errorString somewhere and let the user try again.
            }
        }];
        
    }
}

-(UIColor*)colorWithHexString:(NSString*)hex
{
    NSString *cString = [[hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) return [UIColor grayColor];
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"]) cString = [cString substringFromIndex:2];
    
    if ([cString length] != 6) return  [UIColor grayColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    NSString *rString = [cString substringWithRange:range];
    
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f)
                           green:((float) g / 255.0f)
                            blue:((float) b / 255.0f)
                           alpha:1.0f];
}


/*
// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)nativeLanguagePicker
{
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)nativeLanguagePicker numberOfRowsInComponent: (NSInteger)component
{
    return 6;
    
}

-(NSString *)pickerView:(UIPickerView *)nativeLanguagePicker titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return [self.languageArray objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)nativeLanguagePicker didSelectRow:(NSInteger)row   inComponent:(NSInteger)component{
    
    NSLog(@"Selected Row %d", row);
    switch(row)
    {
            
        case 0:
            //self.color.textColor = [UIColor colorWithRed:0.0f/255.0f green: 0.0f/255.0f blue:255.0f/255.0f alpha:255.0f/255.0f];
            break;
        case 1:
            //self.color.text = @"Green #00FF00";
            //self.color.textColor = [UIColor colorWithRed:0.0f/255.0f green: 255.0f/255.0f blue:0.0f/255.0f alpha:255.0f/255.0f];
            break;
        case 2:
            //self.color.text = @"Orange #FF681F";
            //self.color.textColor = [UIColor colorWithRed:205.0f/255.0f green:   140.0f/255.0f blue:31.0f/255.0f alpha:255.0f/255.0f];
            break;
        case 3:
            //self.color.text = @"Purple #FF00FF";
            //self.color.textColor = [UIColor colorWithRed:255.0f/255.0f green:   0.0f/255.0f blue:255.0f/255.0f alpha:255.0f/255.0f];
            break;
        case 4:
            //self.color.text = @"Red #FF0000";
            //self.color.textColor = [UIColor colorWithRed:255.0f/255.0f green:   0.0f/255.0f blue:0.0f/255.0f alpha:255.0f/255.0f];
            break;
        case 5:
            //self.color.text = @"Yellow #FFFF00";
            //self.color.textColor = [UIColor colorWithRed:255.0f/255.0f green:   255.0f/255.0f blue:0.0f/255.0f alpha:255.0f/255.0f];
            break;
    }
    
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *title = @"sample title";
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:title attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
    
}*/
                             
@end
