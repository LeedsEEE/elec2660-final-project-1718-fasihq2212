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


@interface ViewController : UIViewController
// In this section we declare the permanent variables
#pragma mark Permanent Variables

@property (weak, nonatomic) IBOutlet UILabel *OneStepQuiztitle;
@property (weak, nonatomic) IBOutlet UILabel *welcomelabel;

@property (weak, nonatomic) IBOutlet UIImageView *Imageoflogo;
@property (weak, nonatomic) IBOutlet UILabel *ClickonButtontobegin;

@property (nonatomic, strong) MMDrawerController *drawercontroller; //We have declared the MMDrawerController to be used in ViewController.m


// Here we have outlet and action for the button

#pragma mark Button Variables

- (IBAction)action1button:(UIButton *)sender;



    
    
    
    
    







@end

