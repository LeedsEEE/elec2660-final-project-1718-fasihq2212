//
//  QuestionAnswerBank.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface QuestionAnswerBank : NSObject


@property (nonatomic, strong) NSArray *questionfornumerical;
@property (nonatomic, strong) NSArray *questionforgeneral;
@property (nonatomic, strong) NSArray *questionforriddle;

@property (nonatomic, strong) NSArray *answerfornumerical;
@property (nonatomic, strong) NSArray *answerforgeneral;
@property (nonatomic, strong) NSArray *answerforriddle;

@property (nonatomic, strong) NSArray *choicesfornumerical;
@property (nonatomic, strong) NSArray *choicesforgeneral;
@property (nonatomic, strong) NSArray *choicesforriddle;

@property (nonatomic, strong) NSString *finalquestion;
@property (nonatomic, strong) NSString *choice;
@property (nonatomic, strong) NSString *result;


-(NSString*) printquestion: (NSString*) testtypefunc :(NSInteger) index;
-(NSString*) printanswerchoices: (NSString*) testtypefunc :(NSInteger) index;
-(NSString*) checkanswer: (NSString*) testtypefunc :(NSString*) answer :(NSInteger) index;
-(NSString*) nextquestionfunc;


@end
