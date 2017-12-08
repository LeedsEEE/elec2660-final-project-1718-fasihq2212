//
//  ThirdViewController.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"
#import "QuestionAnswerBank.h"
#import "BeginSecondViewController.h"
#import "ResultViewController.h"
#import "MZTimerLabel.h"
#import "RQShineLabel.h"
#import "failViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface ThirdViewController : ViewController

#pragma mark Additional Variables

@property (nonatomic, strong) NSString *testtype; // This is the placeholder for the test type passed on from the tableview controller.
@property(nonatomic, strong) NSString *chosenanswer;  //This is the answer chosen from the corresponding button
@property (nonatomic, strong) NSString *actualanswer; // We compare the chosen answer with the actual answer
@property (nonatomic, strong) NSString *question; // the question that we call from the question bank
@property (nonatomic, strong) NSString *choice; // the choices we assign to each buttton (also called from the question bank)
@property  NSInteger score; // The score that is incremented depending on the answer
@property (nonatomic, strong) MZTimerLabel *label; // A custom UILabel class to declare timer.
@property NSInteger questionnumber; // declare question number so we can access the question and its choices
@property NSInteger alpha; // Used to define how many questions will be called



#pragma mark Labels

@property (weak, nonatomic) IBOutlet UILabel *Questionlabelfirst; // question label
@property (weak, nonatomic) IBOutlet UILabel *firstchoice;
@property (weak, nonatomic) IBOutlet UILabel *secondchoice;
@property (weak, nonatomic) IBOutlet UILabel *thirdchoice;
@property (weak, nonatomic) IBOutlet UILabel *fourthchoice; // four different labels for each choice.
@property (weak, nonatomic) IBOutlet UILabel *timerlabel; // a label where the timer will be placed.
@property (weak, nonatomic) IBOutlet UILabel *scoreanswer; // a label to display the score

#pragma mark Button Outlets

@property (weak, nonatomic) IBOutlet UIButton *firstbuttonoutlet; // We have an outlet for each choice button so we can customise it
@property (weak, nonatomic) IBOutlet UIButton *secondbuttoutlet;
@property (weak, nonatomic) IBOutlet UIButton *thirdbuttonoutlet;
@property (weak, nonatomic) IBOutlet UIButton *fourthbuttonoutlet;



#pragma mark Button Action
- (IBAction)choicepressed:(UIButton*)sender; // One action for each button declared by choice pressed. Every single choice button share the same IBAction command called choicepressed
- (IBAction)Goback:(UIButton *)sender; //We have a go back
@property (weak, nonatomic) IBOutlet UIButton *gobackoutlet; // an outlet for the go back screen


#pragma mark Question Functions

-(NSInteger*) checkanswerfunc: (NSString*) test :(NSString*) chosen : (NSInteger) indie;
-(NSString*) nextquestion: (NSString*) test : (NSInteger) indie;
-(NSString*) nextanswerchoice: (NSString*) test :(NSInteger) indie;

// the functions used to call the question, check the questions and print the choices.





@end
