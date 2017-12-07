//
//  implementtypeanddes.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "implementtypeanddes.h"

@implementation implementtypeanddes

///// Fetched from Lab 3////////


- (instancetype)init
{
    self = [super init];
    if (self) {
        
        self.firtsection = [NSMutableArray array];
        typeoftestanddescription *sender = [[typeoftestanddescription alloc] init]; //create different pointers for each topic
        sender.typeoftest = @"Numerical Reasoning";
        sender.desc = @"This section will test your mathematical capability by presenting a wide range of Mental Arithmetic and Reasoning Excercise. It will help to improve the pace of your thinking.";
        
        
        self.firtsection = [NSMutableArray array];
        typeoftestanddescription *sender1 = [[typeoftestanddescription alloc]init];
       sender1.typeoftest = @"General Knowledge";
        sender1.desc = @"A test of your ignorance. You will be tested on your overall knoweldge of key events and recognised indvicuals. Be prepared for some challenging questions";
        
        self.firtsection = [NSMutableArray array];
        typeoftestanddescription *sender3 = [[typeoftestanddescription alloc] init];
        sender3.typeoftest = @"True or False Trivia";
        sender3.desc = @"One of the more traditional quiz. You will be presented with a selection of True/False Questions. Sounds easy but be wary, the score system here is very unpredictable";
        
        [self.firtsection addObject:sender];
        [self.firtsection addObject:sender1]; // add object for each topic assigned
        [self.firtsection addObject:sender3];
        
    }
    return self;
}


// we create an init function and assign the objects to the NSMutablearray called first section. There are 3 objects describing 3 different objects. Each object is referring to the type of test and its corresponding description. 
@end
