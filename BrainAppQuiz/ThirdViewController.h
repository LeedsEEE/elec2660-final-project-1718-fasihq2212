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
#import "additionalclassfunction.h"

@interface ThirdViewController : ViewController

@property (nonatomic, strong) NSString *testtype;
@property(nonatomic, strong) NSString *chosenanswer;
@property (nonatomic, strong) NSString *actualanswer;
@property NSInteger questionnumber;



#pragma mark Labels

@property (weak, nonatomic) IBOutlet UILabel *Questionlabelfirst;
@property (weak, nonatomic) IBOutlet UILabel *firstchoice;
@property (weak, nonatomic) IBOutlet UILabel *secondchoice;
@property (weak, nonatomic) IBOutlet UILabel *thirdchoice;
@property (weak, nonatomic) IBOutlet UILabel *fourthchoice;
@property (weak, nonatomic) IBOutlet UILabel *notification;

#pragma mark Button Action
- (IBAction)choicepressed:(UIButton*)sender;

@property (weak, nonatomic) IBOutlet UIButton *propertofbutton;




    
    







@end
