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

@synthesize testtype, questionnumber, alpha, label, score, scoreanswer, timeelapsed;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
  
    
    self.questionnumber = arc4random() % 18;
    //self.rqshinelabel.text = @"test";
    //[self.rqshinelabel shine];
    
    label = [[MZTimerLabel alloc] initWithLabel:self.timerlabel];
    [label start];
    //self.questionnumber = 0;
    self.alpha = 0;
    [self.view addSubview:self.scoreanswer];
    self.scoreanswer.text = @"0";
    NSLog(@"%@", self.testtype);
    ThirdViewController *controller = [[ThirdViewController alloc] init];
    self.Questionlabelfirst.text = [controller nextquestion:self.testtype :self.questionnumber];
    self.Questionlabelfirst.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
    self.Questionlabelfirst.numberOfLines = 0;
    self.firstchoice.text = [controller nextanswerchoice:self.testtype : self.questionnumber*4];
    self.secondchoice.text = [controller nextanswerchoice:self.testtype : (self.questionnumber*4) +1];
    self.thirdchoice.text = [controller nextanswerchoice:self.testtype : (self.questionnumber*4)+2];
    self.fourthchoice.text = [controller nextanswerchoice:self.testtype : (self.questionnumber*4)+3];
    
    [self.gobackoutlet.layer setBorderWidth:1.0];
    [self.gobackoutlet.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.firstbuttonoutlet.layer setBorderWidth:1.0];
    [self.firstbuttonoutlet.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.secondbuttoutlet.layer setBorderWidth:1.0];
    [self.secondbuttoutlet.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.thirdbuttonoutlet.layer setBorderWidth:1.0];
    [self.thirdbuttonoutlet.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.fourthbuttonoutlet.layer setBorderWidth:1.0];
    [self.fourthbuttonoutlet.layer setBorderColor:[[UIColor blackColor] CGColor]];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation



// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"resultsegue"]){
        
        
        ResultViewController *resu = (ResultViewController *) segue.destinationViewController;
        resu.passedonteststring = self.testtype;
        resu.passedontime = [label getTimeCounted];
        resu.passedonscore = self.score;
        
        
        
    }
    

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

}
 

- (IBAction)choicepressed:(UIButton*)sender {

    ThirdViewController *controller  = [[ThirdViewController alloc] init];
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc] init];
    
    NSArray *arr = [func answerfornumerical];
    NSArray *arr1 = [func answerforgeneral];
    
    NSTimeInterval recorded = [label getTimeCounted];
    
    NSLog(@"time = %f",recorded);

    
   NSString *ans = self.testtype;
  
        if (self.alpha <9){
        
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
    
            if ([self.chosenanswer isEqualToString: [arr objectAtIndex:self.questionnumber]] && [self.testtype isEqualToString:@"Numerical Reasoning"]){
                
                self.score = self.score + 1;
                self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
              
            }

            else if ([self.chosenanswer isEqualToString: [arr1 objectAtIndex:self.questionnumber]] && [self.testtype isEqualToString:@"General Knowledge"]){
                self.score = self.score + 1;
                self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                
            }


            NSLog(@"Score  = %ld",(long)self.score);
 

        self.questionnumber = arc4random() % 18;
           // self.questionnumber = self.questionnumber + 1;
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
                 [self performSegueWithIdentifier:@"resultsegue" sender:self];
                self.timeelapsed = [label  getTimeCounted];
                
                NSString *msg = [NSString stringWithFormat:@"You completed the test in: %f seconds",self.timeelapsed];
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Completed!" message:msg delegate:nil cancelButtonTitle:@"Awesome!" otherButtonTitles:nil];
                [alertView show];
                

                            }
            
            else if (sender.tag == 2) {
                self.chosenanswer = self.secondchoice.text;
                [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
                [self performSegueWithIdentifier:@"resultsegue" sender:self];
               self.timeelapsed = [label  getTimeCounted];
                
                NSString *msg = [NSString stringWithFormat:@"You completed the test in: %f seconds",self.timeelapsed];
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Completed!" message:msg delegate:nil cancelButtonTitle:@"Awesome!" otherButtonTitles:nil];
                [alertView show];
                

            }
           
                else if (sender.tag == 3){
            
                
                self.chosenanswer = self.thirdchoice.text;
                [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
                    [self performSegueWithIdentifier:@"resultsegue" sender:self];
                  self.timeelapsed = [label  getTimeCounted];
                    
                    NSString *msg = [NSString stringWithFormat:@"You completed the test in: %f seconds",self.timeelapsed];
                    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Completed!" message:msg delegate:nil cancelButtonTitle:@"Awesome!" otherButtonTitles:nil];
                    [alertView show];
                    


                
                
            }
            else if(sender.tag ==4){
                
                self.chosenanswer = self.fourthchoice.text;
                [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
                [self performSegueWithIdentifier:@"resultsegue" sender:self];
               self.timeelapsed = [label  getTimeCounted];
                NSString *msg = [NSString stringWithFormat:@"You completed the test in: %f seconds",self.timeelapsed];
                UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Completed!" message:msg delegate:nil cancelButtonTitle:@"Awesome!" otherButtonTitles:nil];
                [alertView show];
                


                
            }
            
            
        }
}

- (IBAction)Goback:(UIButton *)sender {
    
    
    self.gobackoutlet.selected = YES;
 
    [label pause];
  
    
    UIAlertController *back = [UIAlertController alertControllerWithTitle:@"You have chosen to quit"
                                                                  message:@"Are you sure?"
                                                           preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction* first = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              
                                                              AppDelegate *appdel = (AppDelegate*)[[UIApplication sharedApplication] delegate];
                                                              
                                                              
                                                              UIStoryboard *mainstory = [UIStoryboard storyboardWithName: @"Main" bundle:nil]; //create a story board
                                                              
                                                              UIViewController *leftview = [mainstory instantiateViewControllerWithIdentifier:@"LeftTableViewController"];     //creating UI view controllers called left view,,right view etc. We are not going to use right as I only want the left view to slide out
                                                              
                                                              UIViewController *centreview = [mainstory instantiateViewControllerWithIdentifier:@"CentreViewController"];
                                                              
                                                              
                                                              UINavigationController *leftnav = [[UINavigationController alloc] initWithRootViewController: leftview]; //create navigation controllers from the view controllers.
                                                              UINavigationController *centrenav = [[UINavigationController alloc] initWithRootViewController: centreview];
                                                              
                                                              self.drawercontroller = [[MMDrawerController alloc]initWithCenterViewController:centrenav leftDrawerViewController:leftnav]; //assign the navigation  controllers to leftdrawer/right drawer etc..
                                                              
                                                              self.drawercontroller.openDrawerGestureModeMask = MMOpenDrawerGestureModePanningCenterView;
                                                              self.drawercontroller.closeDrawerGestureModeMask = MMCloseDrawerGestureModePanningCenterView;

                                                              
                                                              [self.drawercontroller  setDrawerVisualStateBlock:[MMDrawerVisualState swingingDoorVisualStateBlock]]; //This is the animation block.. different ones can be used such as parallax etc
                                                              
                                                              appdel.window.rootViewController = self.drawercontroller; // We are getting the window variable from app delegate and declaring it here. Normally, _window.rootViewController would have been used
                                                              [appdel.window makeKeyAndVisible];
                                                              [label reset];

                                                          }];
    UIAlertAction* second = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault
                                                  handler:^(UIAlertAction * action) {
                                                      
                                                      [label start];
                                                      
                                                      self.gobackoutlet.selected = NO;
                                                  
                                                  }];
    
    [back addAction:second];
    [back addAction:first];
    
    [self presentViewController:back animated:YES completion:nil];
   
}



-(NSInteger*) checkanswerfunc: (NSString*) test :(NSString*) chosen : (NSInteger) indie{
    
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc]init];
    
   return  [func checkanswer:test :chosen :indie];
    

    
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
