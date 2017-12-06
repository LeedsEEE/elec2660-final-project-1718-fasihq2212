//
//  TrueFalseViewController.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 03/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"
#import "MZTimerLabel.h"
#import "QuestionAnswerBank.h"
#import "ProgressHUD.h"
#import "ResultViewController.h"
#import "failViewController.h"


@interface TrueFalseViewController : ViewController

#pragma mark Button Variables- Outlets and actions

@property (weak, nonatomic) IBOutlet UIButton *gobackoutlettrue;
@property (weak, nonatomic) IBOutlet UIButton *sendertag1;
@property (weak, nonatomic) IBOutlet UIButton *sendertag2;
- (IBAction)gobacktrue:(UIButton *)sender;
- (IBAction)answertruefalsepressed:(UIButton *)sender;

#pragma mark variables and placeholder

@property (nonatomic, strong) NSString *truefalsetest;
@property (nonatomic, strong) MZTimerLabel *timer;
@property (nonatomic, strong) NSString *answerpick;
@property NSInteger scoretrue;
@property NSInteger questionnumbertrue;
@property NSInteger beta;
@property (nonatomic, strong) NSString *questiontrue;

#pragma mark UILabels and its subclass

@property (weak, nonatomic) IBOutlet MZTimerLabel *timerlabeltruefalse;
@property (weak, nonatomic) IBOutlet UILabel *questiontruefalse;
@property (weak, nonatomic) IBOutlet UILabel *scorelabeltrue;

#pragma mark Functions for quiz

-(NSInteger*) checkanswerfunctrue: (NSString*) test :(NSString*) chosen : (NSInteger) indie;
-(NSString*) nextquestiontrue: (NSString*) test : (NSInteger) indie;
-(NSString*) nextanswerchoicetrue: (NSString*) test :(NSInteger) indie;

@end
