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
#import "TrueFalseViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface BeginSecondViewController : ViewController

#pragma mark Labels

@property (nonatomic, strong) typeoftestanddescription *typee; //declared the type of test and description variables

@property (weak, nonatomic) IBOutlet UILabel *typeoftestlabel; // typeoftest label shows the type of test going to be carried out
@property (weak, nonatomic) IBOutlet UILabel *descriptionlabel;
@property (nonatomic, strong) AVAudioPlayer *audio1; // audio to play

#pragma mark Button properties


- (IBAction)backbuttonpressed:(UIButton *)sender; //action for when pressing 'go back'
- (IBAction)BeginAction:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *beginoutlet;
@property (weak, nonatomic) IBOutlet UIButton *gobackoutlet; // outlet for each button

@end
