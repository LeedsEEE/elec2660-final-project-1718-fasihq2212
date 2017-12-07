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
// One IBAction button that handles two responses by assigning sender tags. Properties of button with corresponding sender tags declared
#pragma mark variables and placeholder

@property (nonatomic, strong) NSString *truefalsetest; //type of test (True False Trivia)
@property (nonatomic, strong) MZTimerLabel *timer; //Timer label assigned MZTimerLabel class
@property (nonatomic, strong) NSString *answerpick; // Answer picked ("True" or "False")
@property NSInteger scoretrue; // score var
@property NSInteger questionnumbertrue; // Question number (implied array number)
@property NSInteger beta;
@property (nonatomic, strong) NSString *questiontrue; //question displayed

#pragma mark UILabels and its subclass

@property (weak, nonatomic) IBOutlet MZTimerLabel *timerlabeltruefalse;
@property (weak, nonatomic) IBOutlet UILabel *questiontruefalse;
@property (weak, nonatomic) IBOutlet UILabel *scorelabeltrue;

#pragma mark Functions for quiz

-(NSInteger*) checkanswerfunctrue: (NSString*) test :(NSString*) chosen : (NSInteger) indie;
-(NSString*) nextquestiontrue: (NSString*) test : (NSInteger) indie;
-(NSString*) nextanswerchoicetrue: (NSString*) test :(NSInteger) indie;


#pragma mark Description

/*
In this class, we are using very similar methods to bring up the questions in the ThirdViewController (Numerical Reasoning and General Knowledge). The functions declared carry out exactly the same procedures.  We have an IBAction and outlet for each button. Other string and label variables are also declared such as the type of test (True or False Trivia), timer label and answerpicked.
 
 */

@end
