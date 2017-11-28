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




@interface ResultViewController : ViewController

@property (nonatomic, strong) PHConfettiView *confetti;
@property (nonatomic, strong) NSString *passedonteststring;

@property (weak, nonatomic) IBOutlet UIButton *tryagainprop;
@property (weak, nonatomic) IBOutlet UIButton *chooseagainprop;
@property (nonatomic, strong) MMDrawerController *callfuncsidep;


- (IBAction)tryagain:(id)sender;


- (IBAction)chooseanother:(id)sender;
    


@end
