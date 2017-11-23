//
//  additionalclassfunction.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QuestionAnswerBank.h"


@interface additionalclassfunction : NSObject


@property (nonatomic, strong) NSString *question;
@property (nonatomic, strong) NSString *first;



-(NSString*) checkanswerfunc: (NSString*) test :(NSString*) chosen : (NSInteger) indie;
-(NSString*) nextquestion: (NSString*) test : (NSInteger) indie;
-(NSString*) nextanswerchoice: (NSString*) test :(NSInteger) indie;
@end
