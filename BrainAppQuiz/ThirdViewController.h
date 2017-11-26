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



@interface ThirdViewController : ViewController

@property (nonatomic, strong) NSString *testtype;
@property(nonatomic, strong) NSString *chosenanswer;
@property (nonatomic, strong) NSString *actualanswer;
@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *choice;
@property NSInteger questionnumber;
@property NSInteger alpha;





#pragma mark Labels

@property (weak, nonatomic) IBOutlet UILabel *Questionlabelfirst;
@property (weak, nonatomic) IBOutlet UILabel *firstchoice;
@property (weak, nonatomic) IBOutlet UILabel *secondchoice;
@property (weak, nonatomic) IBOutlet UILabel *thirdchoice;
@property (weak, nonatomic) IBOutlet UILabel *fourthchoice;
@property (weak, nonatomic) IBOutlet UILabel *notification;

#pragma mark Button Action
- (IBAction)choicepressed:(UIButton*)sender;



#pragma mark Question Functions

-(NSString*) checkanswerfunc: (NSString*) test :(NSString*) chosen : (NSInteger) indie;
-(NSString*) nextquestion: (NSString*) test : (NSInteger) indie;
-(NSString*) nextanswerchoice: (NSString*) test :(NSInteger) indie;




@end
