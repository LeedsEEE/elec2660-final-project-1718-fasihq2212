//
//  BeginSecondViewController.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 19/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"
#import "typeoftestanddescription.h" //imported type and description
#import "ThirdViewController.h"

@interface BeginSecondViewController : ViewController

#pragma mark Labels

@property (nonatomic, strong) typeoftestanddescription *typee; //declared the type of test and description variables

@property (weak, nonatomic) IBOutlet UILabel *typeoftestlabel;

@property (weak, nonatomic) IBOutlet UILabel *descriptionlabel;

#pragma mark Button properties
- (IBAction)backbuttonpressed:(UIButton *)sender; //action for when pressing 'go back'

@end
