//
//  failViewController.h
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 02/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ViewController.h"
#import "RQShineLabel.h"
#import "AppDelegate.h"
#import "MMDrawerController.h"
#import "ThirdViewController.h"



@interface failViewController : ViewController
@property (weak, nonatomic) IBOutlet RQShineLabel *scorefinalnegative;

@property (nonatomic, strong) NSString *functest;

- (IBAction)failtry:(UIButton *)sender;
- (IBAction)choosefail:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *tryagainp;
@property (weak, nonatomic) IBOutlet UIButton *chooseanother;

@end
