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
    _finaltest = self.testtype;
    
    
    
   
    if ([_finaltest isEqualToString:@"Numerical Reasoning"]){

        QuestionAnswerBank *func = [[QuestionAnswerBank alloc] init];
        
        NSString *firstquestion =   [func printquestion:@"Numerical Reasoning" :0];
        self.Questionlabelfirst.text = firstquestion;
        self.Questionlabelfirst.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
        self.Questionlabelfirst.numberOfLines = 0;
        
         self.firstchoice.text = [func printanswerchoices:@"Numerical Reasoning" :0];
         self.secondchoice.text = [func printanswerchoices:@"Numerical Reasoning" :1];
         self.thirdchoice.text = [func printanswerchoices:@"Numerical Reasoning" :2];
        self.fourthchoice.text = [func printanswerchoices:@"Numerical Reasoning" :3];

    }
    
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

- (IBAction)firstbuttonchoice:(UIButton *)sender {
    
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc] init];
    
    if ([self.finaltest isEqualToString: @"Numerical Reasoning"]){
        
        NSLog( @"%@", self.testtype);
        
        self.notification.text = [func checkanswer:@"Numerical Reasoning" :self.firstchoice.text :0];
        
    }
    
    }

- (IBAction)secondbuttonchoice:(UIButton *)sender {
    
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc] init];
    
    if ([self.finaltest isEqualToString: @"Numerical Reasoning"]){
        
        NSLog( @"%@", self.testtype);
        
        self.notification.text = [func checkanswer:@"Numerical Reasoning" :self.secondchoice.text :0];
        
    }

}

- (IBAction)thirdbuttonchoice:(UIButton *)sender {
    
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc] init];
    
    if ([self.finaltest isEqualToString: @"Numerical Reasoning"]){
        
        NSLog( @"%@", self.testtype);
        
        self.notification.text = [func checkanswer:@"Numerical Reasoning" :self.thirdchoice.text :0];
        
    }
    
}

- (IBAction)fourthbuttonchoice:(UIButton *)sender {
    
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc] init];
    
    if ([self.finaltest isEqualToString: @"Numerical Reasoning"]){
        
        NSLog( @"%@", self.testtype);
        
        self.notification.text = [func checkanswer:@"Numerical Reasoning" :self.fourthchoice.text :0];
        
    }
    

}
@end
