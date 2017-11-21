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


-(NSString*) printquestion: (NSString*) testtypefunc :(int) index;
-(NSString*) printanswerchoices;
-(NSString*) checkanswer;
-(NSString*) nextquestionfunc;


@end
