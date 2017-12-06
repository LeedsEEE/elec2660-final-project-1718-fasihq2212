//
//  ViewController.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 18/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"
#import "MMDrawerVisualState.h" //This is needed for the animation according to the documentation
#import "AppDelegate.h"   //We need to import app delegate so that we can fetch the root view controller
#import <AVFoundation/AVFoundation.h>



@interface ViewController : UIViewController
// In this section we declare the permanent variables
#pragma mark Permanent Variables
@property (nonatomic, strong) AVAudioPlayer *audio;
@property (weak, nonatomic) IBOutlet UILabel *OneStepQuiztitle;
@property (weak, nonatomic) IBOutlet UILabel *welcomelabel;
@property (weak, nonatomic) IBOutlet UIImageView *Imageoflogo;
@property (weak, nonatomic) IBOutlet UILabel *ClickonButtontobegin;

#pragma mark Declare Class
@property (nonatomic, strong) MMDrawerController *drawercontroller; //We have declared the MMDrawerController to be used in ViewController.m


// Here we have outlet and action for the button

#pragma mark Button Variables and Outlets

- (IBAction)action1button:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *buttonp;

// Here, I have declared the variables that are presented when the user launches the application. There are permanent variables such as the OneStepQuiz title where the user cannot change this and the viewDidLoad does not call any functions to change the title//

//MMDrawerController was downloaded from https://github.com/mutualmobile/MMDrawerController //
//The Side panel class was also declared here. This would be carried out when the Begin button is pressed//
    
    
    
    







@end

