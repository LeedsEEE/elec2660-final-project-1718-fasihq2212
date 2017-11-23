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

@synthesize testtype, questionnumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.notification.text = @"";
    self.questionnumber = 0;
    NSLog(@"%@", self.testtype);
    
    additionalclassfunction *function = [[additionalclassfunction alloc]init];

    self.Questionlabelfirst.text = [function nextquestion:self.testtype :self.questionnumber];
    self.Questionlabelfirst.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
    self.Questionlabelfirst.numberOfLines = 0;
    
    self.firstchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber];
    self.secondchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber + 1];
    self.thirdchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber+ 2];
     self.fourthchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber+ 3];
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

- (IBAction)choicepressed:(UIButton*)sender {
    
   NSString *ans = self.testtype;
  
    additionalclassfunction *function = [[additionalclassfunction alloc]init];

    
    if ([self.testtype isEqualToString: @"Numerical Reasoning"]){
        if (sender.tag == 1){
            self.chosenanswer = self.firstchoice.text;
          self.notification.text =   [function checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
            
            self.questionnumber = self.questionnumber + 1;
            
            self.Questionlabelfirst.text = [function nextquestion:self.testtype :self.questionnumber];
            self.Questionlabelfirst.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
            self.Questionlabelfirst.numberOfLines = 0;
            
            self.firstchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber];
            self.secondchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber + 1];
            self.thirdchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber+ 2];
            self.fourthchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber+ 3];

        }
        
        else if (sender.tag == 2) {
            self.chosenanswer = self.secondchoice.text;
            self.notification.text = [function checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
            
            self.questionnumber = self.questionnumber + 1;
            
            self.Questionlabelfirst.text = [function nextquestion:self.testtype :self.questionnumber];
            self.Questionlabelfirst.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
            self.Questionlabelfirst.numberOfLines = 0;
            
            self.firstchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber];
            self.secondchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber + 1];
            self.thirdchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber+ 2];
            self.fourthchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber+ 3];

        }
        else if (sender.tag == 3){
            
            self.chosenanswer = self.thirdchoice.text;
            self.notification.text = [function checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
            
            self.questionnumber = self.questionnumber + 1;
            
            self.Questionlabelfirst.text = [function nextquestion:self.testtype :self.questionnumber];
            self.Questionlabelfirst.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
            self.Questionlabelfirst.numberOfLines = 0;
            
            self.firstchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber];
            self.secondchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber + 1];
            self.thirdchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber+ 2];
            self.fourthchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber+ 3];

        }
        else if(sender.tag ==4){
            
            self.chosenanswer = self.fourthchoice.text;
           self.notification.text =  [function checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
            
            self.questionnumber = self.questionnumber + 1;
            
            self.Questionlabelfirst.text = [function nextquestion:self.testtype :self.questionnumber];
            self.Questionlabelfirst.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
            self.Questionlabelfirst.numberOfLines = 0;
            
            self.firstchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber];
            self.secondchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber + 1];
            self.thirdchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber+ 2];
            self.fourthchoice.text = [function nextanswerchoice:self.testtype :self.questionnumber+ 3];

        }
       
        
        
        
    }
}





@end
