//
//  functionsforquiz.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 21/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionAnswerBank.h"

@interface functionsforquiz : NSObject

@property (nonatomic, strong) QuestionAnswerBank *function;


-(void) printquestion;
-(void) printanswerchoices;
-(void) checkanswer;
-(void) nextquestionfunc;


@end
