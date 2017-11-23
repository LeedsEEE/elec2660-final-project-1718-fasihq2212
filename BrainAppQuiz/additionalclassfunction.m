//
//  additionalclassfunction.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 23/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "additionalclassfunction.h"

@implementation additionalclassfunction


-(NSString*) checkanswerfunc: (NSString*) test :(NSString*) chosen : (NSInteger) indie{
    
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc]init];
 
    return [func checkanswer:test :chosen :indie];
    
}

-(NSString*) nextquestion: (NSString*) test : (NSInteger) indie{
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc]init];

    
    if ([test isEqualToString:@"Numerical Reasoning"]){
        
        if (indie <20){
            
            _question = [func printquestion:test :indie];
        }
        
    }
    return _question;
    
}

-(NSString*) nextanswerchoice: (NSString*) test :(NSInteger) indie{
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc]init];

    
    if ([test isEqualToString:@"Numerical Reasoning"]){
        
        if (indie <20){
            
            _first = [func printanswerchoices:test :indie];
    }
    }
    
 return _first;
}

@end
