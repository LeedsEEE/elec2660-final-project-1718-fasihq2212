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

@interface ResultViewController : ViewController

@property (nonatomic, strong) PHConfettiView *confetti;
@property (nonatomic, strong) NSString *passedonteststring;

@property (weak, nonatomic) IBOutlet UIButton *tryagainprop;
@property (weak, nonatomic) IBOutlet UIButton *chooseagainprop;
@property (nonatomic, strong) MMDrawerController *callfuncsidep;

@property (weak, nonatomic) IBOutlet UILabel *completelabel;
@property (weak, nonatomic) IBOutlet RQShineLabel *resultfinish;

@property (weak, nonatomic) IBOutlet RQShineLabel *improvementlabel;

@property (weak, nonatomic) IBOutlet RQShineLabel *scoreshine;
@property (weak, nonatomic) IBOutlet RQShineLabel *timeshine;


- (IBAction)tryagain:(id)sender;


- (IBAction)chooseanother:(id)sender;
    


@end
