//
//  WelcomeViewController.m
//  Sermo
//
//  Created by Zach Lucas on 5/2/14.
//  Copyright (c) 2014 Zach Lucas. All rights reserved.
//

#import "WelcomeViewController.h"

@interface WelcomeViewController ()

@end

@implementation WelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //Language picker
    self.languageArray  = [[NSArray alloc]         initWithObjects:@"English",@"Spanish",@"German",@"French",@"Portuguese",@"Italian" , nil];

    
    [_nativeLanguagePicker selectRow:3 inComponent:0 animated:NO];
    // white status bar
    [self setNeedsStatusBarAppearanceUpdate];
    
    _SermoTitle.center = CGPointMake(150, -250);
    _HiLabel.center = CGPointMake(150, -250);
    _nativeLanguagePicker.center = CGPointMake(150, 650);
    _ContinueButton.center = CGPointMake(150, 650);
    _logInButton.center = CGPointMake(150, 650);
    _SermoTitle.layer.opacity = 0.1;
    
    [UIView animateWithDuration:2.0f
                          delay:0
                        options:UIViewAnimationOptionCurveEaseInOut
                     animations:^
     {
         _SermoTitle.center = CGPointMake(200, 200);
         _SermoTitle.layer.opacity = 1;
         _HiLabel.center = CGPointMake(300, 300);
         _nativeLanguagePicker.center = CGPointMake(300, 300);
         _ContinueButton.center = CGPointMake(300, 300);
         _logInButton.center = CGPointMake(300, 300);

     }
                     completion:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    PFUser *currentUser = [PFUser currentUser];
    NSLog(@"%@",currentUser.email);
    NSLog(@"cur^^");
        if (currentUser) {
            // do stuff with the user
           [self performSegueWithIdentifier:@"alreadyLoggedInSegue" sender:self];
        } else {
            // show the signup or login screen
        }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier isEqualToString:@"continueSignUpSegue"])
    {
        ViewController *controller = (ViewController *)segue.destinationViewController;
        NSInteger row;
        row = [_nativeLanguagePicker selectedRowInComponent:0];
        controller.languagePicked = [_languageArray objectAtIndex:row];
        NSLog(@"lagnuage: %@", controller.languagePicked);
    }
}

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
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:[self.languageArray objectAtIndex:row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
    
}

@end
