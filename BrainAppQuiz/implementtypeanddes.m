//
//  implementtypeanddes.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "implementtypeanddes.h"

@implementation implementtypeanddes


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
        sender1.desc = @"A test of ones ignorance. You will be tested on your overall knoweldge of key events and recognised indvicuals. Be prepared for some challenging questions";
        
        self.firtsection = [NSMutableArray array];
        typeoftestanddescription *sender3 = [[typeoftestanddescription alloc] init];
        sender3.typeoftest = @"Riddles";
        sender3.desc = @"The most diffuclt challenge yet. These simple yet fiendish riddles will twist your perception and make you question yourself";
        
        [self.firtsection addObject:sender];
        [self.firtsection addObject:sender1]; // add object for each topic assigned
        [self.firtsection addObject:sender3];
        
    }
    return self;
}
@end
