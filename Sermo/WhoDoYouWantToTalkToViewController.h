//
//  WhoDoYouWantToTalkToViewController.h
//  Sermo
//
//  Created by Zach Lucas on 5/2/14.
//  Copyright (c) 2014 Zach Lucas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>


@interface WhoDoYouWantToTalkToViewController : UIViewController <UIPickerViewDataSource,UIPickerViewDelegate>

@property (strong, nonatomic)          NSArray *languageToArray;
@property (strong, nonatomic) IBOutlet UIPickerView *languageToSelector;


@end
