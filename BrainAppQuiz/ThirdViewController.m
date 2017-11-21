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
    
    if ([self.testtype isEqualToString:@"Numerical Reasoning"]){
        
        QuestionAnswerBank *func = [[QuestionAnswerBank alloc] init];

        self.Questionlabelfirst.text =  [func printquestion:@"Numerical Reasoning" :0];
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
