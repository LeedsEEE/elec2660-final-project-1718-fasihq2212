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

@synthesize testtype, questionnumber, alpha;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.notification.text = @"";
    
    
    //self.questionnumber = arc4random() % 7;
    self.questionnumber = 0;
    self.alpha = 0;
    NSLog(@"%@", self.testtype);
    
    ThirdViewController *controller = [[ThirdViewController alloc] init];
    self.Questionlabelfirst.text = [controller nextquestion:self.testtype :self.questionnumber];
    self.Questionlabelfirst.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
    self.Questionlabelfirst.numberOfLines = 0;
    self.firstchoice.text = [controller nextanswerchoice:self.testtype : self.questionnumber*4];
    self.secondchoice.text = [controller nextanswerchoice:self.testtype : (self.questionnumber*4) +1];
    self.thirdchoice.text = [controller nextanswerchoice:self.testtype : (self.questionnumber*4)+2];
    self.fourthchoice.text = [controller nextanswerchoice:self.testtype : (self.questionnumber*4)+3];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

/*

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

*/

- (IBAction)choicepressed:(UIButton*)sender {
    
    ThirdViewController *controller  = [[ThirdViewController alloc] init];
    
   NSString *ans = self.testtype;
  
        if (self.alpha <19){
        
        NSLog(@"%ld", (long)self.questionnumber);
        
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
        
       [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
        
        //self.questionnumber = arc4random() % 7;
            self.questionnumber = self.questionnumber + 1;
        self.alpha = self.alpha + 1;
        
        self.Questionlabelfirst.text = [controller nextquestion:self.testtype :self.questionnumber];
        self.Questionlabelfirst.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
        self.Questionlabelfirst.numberOfLines = 0;
        self.firstchoice.text = [controller nextanswerchoice:self.testtype : self.questionnumber*4];
        self.secondchoice.text = [controller nextanswerchoice:self.testtype :(self.questionnumber*4) +1];
        self.thirdchoice.text = [controller nextanswerchoice:self.testtype  :(self.questionnumber*4)+2];
        self.fourthchoice.text = [controller nextanswerchoice:self.testtype : (self.questionnumber*4)+3];

        }
    
        else{
            
            if (sender.tag == 1){
                self.chosenanswer = self.firstchoice.text;
                [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
                UIViewController *result = [self.storyboard instantiateViewControllerWithIdentifier:@"ResultViewController"];
                [self.navigationController presentViewController:result animated:YES completion:nil];
            }
            
            else if (sender.tag == 2) {
                self.chosenanswer = self.secondchoice.text;
                [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
                [self performSegueWithIdentifier:@"resultsegue" sender:self];
            }
           
                else if (sender.tag == 3){
            
                
                self.chosenanswer = self.thirdchoice.text;
                [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
                    [self performSegueWithIdentifier:@"resultsegue" sender:self];

                
                
            }
            else if(sender.tag ==4){
                
                self.chosenanswer = self.fourthchoice.text;
                [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
                [self performSegueWithIdentifier:@"resultsegue" sender:self];

                
            }
            
            

        }
}



-(NSString*) checkanswerfunc: (NSString*) test :(NSString*) chosen : (NSInteger) indie{
    
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc]init];
    
    return [func checkanswer:test :chosen :indie];
    
}

-(NSString*) nextquestion: (NSString*) test : (NSInteger) indie{
   
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc]init];
    _question = [func printquestion:test :indie];
  
    return _question;
}

-(NSString*) nextanswerchoice: (NSString*) test :(NSInteger) indie {
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc]init];
    

    _choice = [func printanswerchoices:test :indie];
   
    
    return _choice;
}



@end
