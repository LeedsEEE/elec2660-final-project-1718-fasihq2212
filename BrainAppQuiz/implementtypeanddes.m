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
        typeoftestanddescription *sender = [[typeoftestanddescription alloc] init];
        sender.typeoftest = @"Numerical Reasoning";
        sender.desc = @"This section will test your mathematical capability by presenting a wide range of Mental Arithmetic and Reasoning Excercise. It will help to improve the pace of your thinking.";
        
        
        self.firtsection = [NSMutableArray array];
        typeoftestanddescription *sender1 = [[typeoftestanddescription alloc]init];
       
        
    }
    return self;
}
@end
