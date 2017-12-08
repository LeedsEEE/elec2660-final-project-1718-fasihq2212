//
//  QuestionAnswerBank.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ProgressHUD.h"
#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>




@interface QuestionAnswerBank : NSObject

@property (nonatomic, strong) AVAudioPlayer *ad;


@property (nonatomic, strong) NSArray *questionfornumerical; // we need array for question for each category
@property (nonatomic, strong) NSArray *questionforgeneral;
@property (nonatomic, strong) NSArray *questionfortruefalse;

@property (nonatomic, strong) NSArray *answerfornumerical; // array for answer for each category
@property (nonatomic, strong) NSArray *answerforgeneral;
@property (nonatomic, strong) NSArray *answerfortruefalse;

@property (nonatomic, strong) NSArray *choicesfornumerical; //array for all the choices
@property (nonatomic, strong) NSArray *choicesforgeneral;
@property (nonatomic, strong) NSArray *choicesfortruefalse;

@property (nonatomic, strong) NSString *finalquestion; //  the question
@property (nonatomic, strong) NSString *choice; // choice printed
@property NSInteger score; //score value

-(NSString*) printquestion: (NSString*) testtypefunc :(NSInteger) index; // 3 different types of function with different arguments to return different types variables. 
-(NSString*) printanswerchoices: (NSString*) testtypefunc :(NSInteger) index;
-(NSInteger*) checkanswer: (NSString*) testtypefunc :(NSString*) answer :(NSInteger) index;


@end
