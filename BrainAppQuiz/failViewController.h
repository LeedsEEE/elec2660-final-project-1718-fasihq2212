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
#import "TrueFalseViewController.h"



@interface failViewController : ViewController

@property (weak, nonatomic) IBOutlet RQShineLabel *scorefinalnegative;   //view controller that notifies user that the score has fallen below 0
@property (nonatomic, strong) NSString *functest; // type of test passed from previous view controller
- (IBAction)failtry:(UIButton *)sender; // try again button action
- (IBAction)choosefail:(UIButton *)sender; // choose another category button actions
@property (weak, nonatomic) IBOutlet UIButton *tryagainp;
@property (weak, nonatomic) IBOutlet UIButton *chooseanother; //  property for each button

@end
