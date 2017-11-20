//
//  QuestionAnswerBank.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QuestionAnswerBank : NSObject

@property (nonatomic, strong) NSArray *question;
@property (nonatomic, strong) NSArray *answer;
@property (nonatomic, strong) NSArray *choices;
-(void) questionanswerforNumerical;
-(void) questionanswerforGeneral;
-(void) questionanswerforRiddle;

@end
