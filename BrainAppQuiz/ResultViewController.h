//
//  ResultViewController.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 25/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"
#import "PHConfettiView.h"
#import "MMDrawerController.h"
#import "AppDelegate.h"
#import "ThirdViewController.h"
#import "RQShineLabel.h"
#import "ProgressHUD.h"
#import "TrueFalseViewController.h"
#import "TOMSMorphingLabel.h"

@interface ResultViewController : ViewController

#pragma mark UILabel Class and Subclass

@property (weak, nonatomic) IBOutlet UILabel *completelabel;
@property (weak, nonatomic) IBOutlet RQShineLabel *resultfinish;
@property (weak, nonatomic) IBOutlet RQShineLabel *improvementlabel;
@property (weak, nonatomic) IBOutlet RQShineLabel *scoreshine;
@property (weak, nonatomic) IBOutlet RQShineLabel *timeshine;
@property (weak, nonatomic) IBOutlet RQShineLabel *finalscorealpha;

@property (weak, nonatomic) IBOutlet TOMSMorphingLabel *morphlabelscore;


#pragma mark Class functions and variables

@property (nonatomic, strong) PHConfettiView *confetti; // confetti class declared
@property (nonatomic, strong) NSString *passedonteststring; // passed on test string from previous view controller
@property NSInteger passedonscore; // passed on score and time
@property NSTimeInterval passedontime;
@property (nonatomic, strong) MMDrawerController *callfuncsidep; // MMDrawerController callfuncisdep is declared so it can be used
@property int score;
//score is decalred.

#pragma mark Button Variables

@property (weak, nonatomic) IBOutlet UIButton *tryagainprop;
@property (weak, nonatomic) IBOutlet UIButton *chooseagainprop;
- (IBAction)tryagain:(id)sender;
- (IBAction)chooseanother:(id)sender; // button actions and outlets decalred

#pragma mark functions

-(void) displayfinalscore;
 // function to display the final score.


@end
