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
                                    @"2 raised to the power of 10 is",
                                    @"140,368 - 12,439 = ",
                                    @"If there are 23 boys and 21 boys are in class A,Class B has 21 boys and 22 girls,how many girls and boys are there in Class A and B?",
                                    @"What does it actually mean when someone says 'There is a 30% chance of raining tomorrow'?",
                                    @"Pi, commonly rounded to 3.141592, represents the circumference divided by the diameter. It is also special because",
                                    @"You have invited 10 people over for dinner. How many different ways are there to arrange them around a circular table?",
                                    @"If you have a piece of paper that is 0.1mm thick, how many times will you have to fold it in half for it to become tall enough to reach the moon?",
                                    @"A car is driving at 100mph down a straight road. What is the speed of each of its wheels at the point where they touch the ground?",
                                    @"If 1/2 of 5 is 3, then what is 1/3 of 10?",
                                    @"If you randomly choose one of the following answers to this question, what is your chance of getting it right?",
                                    @"A claustrophobic person gets on a train. The train enters a tunnel just as it is leaving the station. Where is the best place for him to sit?",
                                
                                    @"What is the next number in the sequence? 1,11,21,1211,111221,312211",
                                    nil];
        
        self.questionforgeneral = [NSArray arrayWithObjects: @"Grand Central Terminal, Park Avenue, New York is the world's",
                                   @"Entomology is the science that studies",
                                   @"For which of the following disciplines is Nobel Prize awarded?",
                                   @"Epsom (England) is the place associated with",
                                   @"Galileo was an Italian astronomer who",
                                   @"First Afghan War took place in",
                                   @"First China War was fought between",
                                   @"Federation Cup, World Cup, Allywyn International Trophy and Challenge Cup are awarded to winners of",
                                   @"Each year World Red Cross and Red Crescent Day is celebrated on",
                                   @"Friction can be reduced by changing from",
                                   @"During World War II, when did Germany attack France?",
                                   @"Logarithm tables were invented by",
                                   @"Joule is the unit of",
                                   @"Kemal Ataturk was",
                                   @"Normally the Commonwealth Games are held at intervals of",
                                   @"Name the instrument used to measure relative humidity",
                                   @"Michael Faraday discovered",
                                   @"Mother Teresa won the Nobel Prize for Peace in",
                                   @"Most commonly used bleaching agent is",
                                   @"Neil Armstrong and Edwin Aldrin were the first to", nil];
        
        self.answerforgeneral = @[@"largest railway station",
                                  @"Insects",
                                  @"All of the above",
                                  @"Horse racing",
                                  @"All of them",
                                  @"1839",
                                  @"China and Britain",
                                  @"Volleyball",
                                  @"May 8",
                                  @"sliding to rolling",
                                  @"1940",
                                  @"John Napier",
                                  @"energy",
                                  @"the founder of modern Turkey",
                                  @"4 years",
                                  @"Hygrometer",
                                  @"All of the above",
                                  @"1979",
                                  @"chlorine",
                                  @"step on the moon"
                                  ];
        
        self.answerfornumerical = @[@"21 seats",
                    @"-2088",
                    @"None",
                    @"120 minutes",
                    @"12 people",
                    @"3 socks",
                    @"72 years old",
                    @"11 Boxes",
                    @"1024",
                    @"127923",
                    @"87",
                    @"For every 10 days like today, it will rain on 3 of the following days",
                    @"Normal",
                    @"3,628,800",
                    @"42",
                    @"0",
                    @"4",
                    @"0%",
                    @"In the back",
                    @"13112221"];
        
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
                      @"15 Boxes",
                      
                      @"1024",
                      @"246",
                      @"1020",
                      @"1000",
                      
                      @"126824",
                      @"127923",
                      @"127929",
                      @"128943",
                      
                     
                      @"73",
                      @"63",
                      @"91",
                      @"87",
                      
                      @"Cannot tell",
                      @"For every 10 days like today, it will rain on 3 of the following days",
                      @"It will rain for 30% of the day on average",
                      @"The volume of rain that will fall in New York will be 30% of the total rainfall",
                      
                      @"Normal",
                      @"Rational",
                      @"Random",
                      @"Infinite",
                      
                      @"3,628",
                      @"36,288",
                      @"3,628,800",
                      @"362,880",
                      
                      @"4200",
                      @"14200",
                      @"142",
                      @"42",
                      
                      @"100",
                      @"50",
                      @"25",
                      @"0",
                      
                      @"2",
                      @"3",
                      @"4",
                      @"5",
                      
                      @"0%",
                      @"25%",
                      @"50%",
                      @"100%",
                      
                      @"Front",
                      @"In the back",
                      @"On the side",
                      @"Cannot tell",
                      
                      @"1311311",
                      @"1213323",
                      @"13112112",
                      @"13112221"];
        
        self.choicesforgeneral = @[@"largest railway station",
                                   @"highest railway station",
                                   @"longest railway station",
                                   @"None of the above",
                                   
                                   @"Behavior of human beings",
                                   @"The formation of rocks",
                                   @"The origin and history of technical and scientific terms",
                                   @"Insects",
                                   
                                   @"Physics and Chemistry",
                                   @"Physiology or Medicine",
                                   @"Literature, Peace and Economics",
                                   @"All of the above",
                                   
                                   @"Shooting",
                                   @"Horse racing",
                                   @"Polo",
                                   @"Snooker",
        
                                   @"All of them",
                                   @"discovered that the movement of pendulum produces a regular time measurement",
                                   @"discovered four satellites of Jupite",
                                   @"developed the telescope",
        
                                   @"1843",
                                   @"1839",
                                   @"1833",
                                   @"1848",
        
                                   @"China and Britain",
                                   @"China and France",
                                   @"China and Egypt",
                                   @"China and Greek",
        
                                   @"Basketball",
                                   @"Tennis",
                                   @"Volleyball",
                                   @"Cricket",
        
                                   @"May 8",
                                   @"May 18",
                                   @"June 8",
                                   @"June 18",
        
                                   @"sliding to rolling",
                                   @"potential energy to kinetic energy",
                                   @"rolling to sliding",
                                   @"dynamic to static",
        
                                   @"1943",
                                   @"1940",
                                   @"1941",
                                   @"1942",
        
                                   @"John Napier",
                                   @"John Doe",
                                   @"John Harrison",
                                   @"John Douglas",
        
                                   @"heat",
                                   @"pressure",
                                   @"energy",
                                   @"temperature",
        
                                   @"None of the choices",
                                   @"the first President of Independent Kenya",
                                   @"revolutionary leader of Soviet Union",
                                   @"the founder of modern Turkey",
        
                                   @"4 years",
                                   @"5 years",
                                   @"there is no fixed interval",
                                   @"3 years",
        
                                   @"Hydrometer",
                                   @"Mercury Thermometer",
                                   @"Hygrometer",
                                   @"Barometer",
        
                                   @"electromagnetism",
                                   @"benzene, liquid gases and optical glass",
                                   @"the induction of electric current",
                                   @"All of the above",
        
                                   @"1954",
                                   @"1988",
                                   @"1979",
                                   @"1992",
        
                                   @"chlorine",
                                   @"sodium chloride",
                                   @"carbon dioxide",
                                   @"alcohol",
        
                                   @"circle the moon",
                                   @"step on the moon",
                                   @"walk in space",
                                   @"journey into space", ];
                                   
                                   
        

    }
    
    return self;
}

    
    
-(NSString*) printquestion: (NSString*) testtypefunc :(NSInteger) index{
    
    

    if ([testtypefunc isEqualToString:@"Numerical Reasoning"]){
        
       _finalquestion = [self.questionfornumerical objectAtIndex: index];
        
    }
    
    else if ([testtypefunc isEqualToString:@"General Knowledge"]){
        
        
        _finalquestion = [self.questionforgeneral objectAtIndex: index];

    }
     
    return _finalquestion;
    
}

-(NSString*) printanswerchoices: (NSString*) testtypefunc :(NSInteger) index{
    
    if ([testtypefunc isEqualToString:@"Numerical Reasoning"]){
        
        _choice = [self.choicesfornumerical objectAtIndex:index];
        
    }
    
    else if ([testtypefunc isEqualToString:@"General Knowledge"]){
        
        _choice = [self.choicesforgeneral objectAtIndex:index];
    }
  
    return _choice;
}

-(NSString*) checkanswer: (NSString*) testtypefunc :(NSString*) answer :(NSInteger) index{
    
    if ([testtypefunc isEqualToString:@"Numerical Reasoning"]){
        
        if ([answer isEqualToString: [self.answerfornumerical objectAtIndex:index]]){
            
            [ProgressHUD showSuccess:@"Excellent"];
        }
        else {
            
            [ProgressHUD showError:@"Wrong"];
        }
    }
    
 else if ([testtypefunc isEqualToString:@"General Knowledge"]){
        
        if ([answer isEqualToString:[self.answerforgeneral objectAtIndex:index]]){
            
            [ProgressHUD showSuccess:@"Excellent"];

        }
        
        else {
            
            [ProgressHUD showError:@"Wrong"];

        }
        
        
  }
    
return _result;
}


@end
