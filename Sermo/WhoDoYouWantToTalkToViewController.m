//
//  WhoDoYouWantToTalkToViewController.m
//  Sermo
//
//  Created by Zach Lucas on 5/2/14.
//  Copyright (c) 2014 Zach Lucas. All rights reserved.
//

#import "WhoDoYouWantToTalkToViewController.h"

@interface WhoDoYouWantToTalkToViewController ()

@end

@implementation WhoDoYouWantToTalkToViewController

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

    // white status bar
    [self setNeedsStatusBarAppearanceUpdate];
    
    self.languageToArray  = [[NSArray alloc]         initWithObjects:@"RANDOM",@"English",@"Spanish",@"German",@"French",@"Portuguese",@"Italian" , nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
- (IBAction)logOut:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"backToHomeSegue" sender:self];
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

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)nativeLanguagePicker
{
    return 1;
    
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)languageToSelector numberOfRowsInComponent: (NSInteger)component
{
    return 7;
    
}

-(NSString *)pickerView:(UIPickerView *)languageToSelector titleForRow:(NSInteger)row   forComponent:(NSInteger)component
{
    return [self.languageToArray objectAtIndex:row];
    
}

- (void)pickerView:(UIPickerView *)languageToSelector didSelectRow:(NSInteger)row   inComponent:(NSInteger)component{
    
    NSLog(@"Selected Row %ld", (long)row);
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
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:[self.languageToArray objectAtIndex:row] attributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
    return attString;
    
}

@end
