//
//  ThirdViewController.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 20/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ThirdViewController.h"

@interface ThirdViewController ()

@end

@implementation ThirdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.questionS = [[QuestionAnswerBank alloc] init];
    self.reference = [[BeginSecondViewController alloc]init];
    self.questionS.questionfornumerical = [NSArray array];
    self.questionS.answerfornumerical = [NSArray array];
    self.questionS.choicesfornumerical = [NSArray array];
    
    NSLog(@"%@", self.reference.typeoftestlabel.text);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/




-(void) printquestion{
    
    NSLog(@"%@", self.reference.typee.typeoftest);
    
    if ([self.reference.typee.typeoftest isEqualToString: @"Numerical Reasoning"]){
        
        NSLog (@"Correct");
        
        NSLog (@"%@", [self.questionS.questionfornumerical objectAtIndex:0]);
      
        
        self.Questionlabelfirst.text = [self.questionS.questionfornumerical objectAtIndex:0];
        
        
        
        
    }
    
    
}
-(void) printanswerchoices{
    
    
    
}
-(void) checkanswer{
    
    
    
}
-(void) nextquestionfunc{
    
    
    
}



- (IBAction)firstbuttonchoice:(UIButton *)sender {
    
}

- (IBAction)secondbuttonchoice:(UIButton *)sender {
}

- (IBAction)thirdbuttonchoice:(UIButton *)sender {
}

- (IBAction)fourthbuttonchoice:(UIButton *)sender {
}
@end
