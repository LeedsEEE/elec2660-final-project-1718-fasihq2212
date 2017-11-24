//
//  QuestionAnswerBank.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "QuestionAnswerBank.h"

@implementation QuestionAnswerBank


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.questionfornumerical = [NSArray array];
        self.answerfornumerical = [NSArray array];
        self.choicesfornumerical = [NSArray array];
        
        self.questionfornumerical =[NSArray arrayWithObjects: @" In my row in the theatre the seats are numbered consecutively from T1 to T50. I am sitting in seat T17 and you are sitting in seat T39. How many seats are there between us?",
                                    @"What is 2014 − 4102 ?",
                                    @"How many prime numbers are there in the list 1, 12, 123, 1234, 12 345, 123 456 ?",
                                    @"How many minutes are there in 1/12 of a day?",
                                    @"At a party, everyone shook hands with everybody else. There were 66 handshakes. How many people were at the party?",
                                    @"It's dark. You have ten grey socks and ten blue socks you want to put into pairs. All socks are exactly the same except for their colour. How many socks would you need to take with you to ensure you had at least a pair?",
                                    @"My grandson is about as many days as my daugher in weeks, and my grandson is as many months as I am in years. My grandson, my daughter and I together are 120 years. Can you tell me my age in years?",
                                    @"A merchant can place 8 large boxes or 10 small boxes into a carton for shipping. In one shipment, he sent a total of 96 boxes. If there are more large boxes than small boxes, how many cartons did he ship?",
                                    nil];
        
        self.answerfornumerical = @[@"21 seats",
                    @"-2088",
                    @"None",
                    @"120 minutes",
                    @"12 people",
                    @"3 socks",
                    @"72 years old",
                    @"11 Boxes"];
        
        self.choicesfornumerical =
                    @[@"10 seats",
                     @"21 seats",
                     @"18 seats",
                      @"15 seats",
                      
                      @"-2085",
                      @"-2086",
                      @"-2087",
                      @"-2088",
                      
                      @"None",
                      @"One",
                      @"Two",
                      @"Three",
                      
                      @"120 minutes",
                      @"150 minutes",
                      @"130 minutes",
                      @"140 minutes",
                      
                      @"10 people",
                      @"8 people",
                      @"6 people",
                      @"12 people",
                      
                      @"3 socks",
                      @"5 socks",
                      @"4 socks",
                      @"2 socks",
                      
                      @"69 years old",
                      @"70 years old",
                      @"72 years old",
                      @"74 years old",
                      
                      @"9 Boxes",
                      @"11 Boxes",
                      @"13 Boxes",
                      @"15 Boxes"];
        
        
        
    }
    return self;
}

-(NSString*) printquestion: (NSString*) testtypefunc :(NSInteger) index{
    
    

    if ([testtypefunc isEqualToString:@"Numerical Reasoning"]){
        
       _finalquestion = [self.questionfornumerical objectAtIndex: index];
        
    }
     
    return _finalquestion;
    
}

-(NSString*) printanswerchoices: (NSString*) testtypefunc :(NSInteger) index{
    
    if ([testtypefunc isEqualToString:@"Numerical Reasoning"]){
        
        _choice = [self.choicesfornumerical objectAtIndex:index];
        
    }
  
    return _choice;
}

-(NSString*) checkanswer: (NSString*) testtypefunc :(NSString*) answer :(NSInteger) index{
    
    if ([testtypefunc isEqualToString:@"Numerical Reasoning"]){
        
        if ([answer isEqualToString: [self.answerfornumerical objectAtIndex:index]]){
            
            _result = @"Correct!";
            
        }
        else {
            
            _result = @"Incorrect!";
        }
        
    }
    
    
    return _result;
    
}




@end
