//
//  ViewController.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 18/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
// In this section we declare the permanent variables
#pragma mark Permanent Variables

@property (weak, nonatomic) IBOutlet UILabel *OneStepQuiztitle;
@property (weak, nonatomic) IBOutlet UILabel *welcomelabel;

@property (weak, nonatomic) IBOutlet UIImageView *Imageoflogo;
@property (weak, nonatomic) IBOutlet UILabel *ClickonButtontobegin;

// Here we have outlet and action for the button

#pragma mark Button Variables

@property (weak, nonatomic) IBOutlet UIButton *buttonaction;

- (IBAction)action1button:(UIButton *)sender;

@end

