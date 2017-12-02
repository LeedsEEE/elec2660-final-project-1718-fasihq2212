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
#import "DPScrollNumberLabel.h"

@interface ResultViewController : ViewController

@property (nonatomic, strong) PHConfettiView *confetti;
@property (nonatomic, strong) NSString *passedonteststring;
@property NSInteger passedonscore;
@property NSTimeInterval passedontime;
@property (weak, nonatomic) IBOutlet UIButton *tryagainprop;
@property (weak, nonatomic) IBOutlet UIButton *chooseagainprop;
@property (weak, nonatomic) IBOutlet UIButton *infooutlet;
@property (nonatomic, strong) MMDrawerController *callfuncsidep;
@property (weak, nonatomic) IBOutlet UILabel *completelabel;
@property (weak, nonatomic) IBOutlet RQShineLabel *resultfinish;
@property (weak, nonatomic) IBOutlet RQShineLabel *improvementlabel;
@property (weak, nonatomic) IBOutlet RQShineLabel *scoreshine;
@property (weak, nonatomic) IBOutlet RQShineLabel *timeshine;


@property (weak, nonatomic) IBOutlet RQShineLabel *finalscorealpha;

@property (nonatomic, strong) DPScrollNumberLabel *label;
@property NSNumber* time;

- (IBAction)tryagain:(id)sender;


- (IBAction)chooseanother:(id)sender;

- (IBAction)displayinfo:(UIButton *)sender;


@end
