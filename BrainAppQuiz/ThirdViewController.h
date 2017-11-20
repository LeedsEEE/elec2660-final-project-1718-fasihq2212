//
//  ThirdViewController.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"
#import "QuestionAnswerBank.h"

@interface ThirdViewController : ViewController

#pragma mark Labels

@property (weak, nonatomic) IBOutlet UILabel *Questionlabelfirst;
@property (weak, nonatomic) IBOutlet UILabel *firstchoice;
@property (weak, nonatomic) IBOutlet UILabel *secondchoice;
@property (weak, nonatomic) IBOutlet UILabel *thirdchoice;
@property (weak, nonatomic) IBOutlet UILabel *fourthchoice;

#pragma mark Button Actions

- (IBAction)firstbuttonchoice:(UIButton *)sender;
- (IBAction)secondbuttonchoice:(UIButton *)sender;
- (IBAction)thirdbuttonchoice:(UIButton *)sender;
- (IBAction)fourthbuttonchoice:(UIButton *)sender;



@end
