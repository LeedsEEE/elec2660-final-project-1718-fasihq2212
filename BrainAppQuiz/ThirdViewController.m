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
    self.notification.text = @"";
    self.questionnumber = 0;
    
    
    
   
    if ([self.finaltest isEqualToString:@"Numerical Reasoning"]){

        QuestionAnswerBank *func = [[QuestionAnswerBank alloc] init];
        
        NSString *firstquestion =   [func printquestion: self.finaltest :0];
        self.Questionlabelfirst.text = firstquestion;
        self.Questionlabelfirst.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
        self.Questionlabelfirst.numberOfLines = 0;
        
         self.firstchoice.text = [func printanswerchoices:self.finaltest :0];
         self.secondchoice.text = [func printanswerchoices:self.finaltest :1];
         self.thirdchoice.text = [func printanswerchoices:self.finaltest :2];
        self.fourthchoice.text = [func printanswerchoices:self.finaltest :3];

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




- (IBAction)choicepressed:(UIButton*)sender {
    
    
    NSLog(@"%li", sender.tag);
  
    ThirdViewController *controller = [[ThirdViewController alloc]init];
    
    if ([self.finaltest isEqualToString: @"Numerical Reasoning"]){
        if (sender.tag == 1){
            self.chosenanswer = self.firstchoice.text;
        }
        
        else if (sender.tag == 2) {
            self.chosenanswer = self.secondchoice.text;
        }
        else if (sender.tag == 3){
            
            self.chosenanswer = self.thirdchoice.text;
        }
        else if(sender.tag ==4){
            
            self.chosenanswer = self.fourthchoice.text;
        }
       
        [controller  checkanswerfunc];
        
        self.questionnumber = self.questionnumber + 1;

        
        
    }
}



-(NSString*) checkanswerfunc{
    
     QuestionAnswerBank *func = [[QuestionAnswerBank alloc] init];
    
    
        self.notification.text = [func checkanswer: self.finaltest :self.chosenanswer : *(self.questionnumber)];
        

    
    return self.notification.text;
    
}

-(NSString*) nextquestion{

    QuestionAnswerBank *func = [[QuestionAnswerBank alloc] init];
    if ([self.finaltest isEqualToString:@"Numerical Reasoning"]){
        
        if (*(_questionnumber) <20){
            
            self.Questionlabelfirst.text = [func printquestion:self.testtype : *(self.questionnumber)];

        }
        
        
    }
    return self.Questionlabelfirst.text;
    
}

    

    
    


@end
