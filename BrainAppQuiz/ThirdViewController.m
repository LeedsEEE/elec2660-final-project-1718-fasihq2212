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

@synthesize testtype, questionnumber, alpha, label, score, scoreanswer;

// Here similar code is used in the TrueFalseViewController. However instead, we are dealing with 4 choices rather than two. Also the choices are different for each question where as in True or False trivia, there are only 2 answers. A full description of this is provided in the TrueFalseViewController however, it will be pasted here for ease of reference.

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view
    self.questionnumber = arc4random() % 18; // The first question is a random number between 0 and 18. We are going to access the Question array from the Questionbank using self.question number
    //self.rqshinelabel.text = @"test";
    //[self.rqshinelabel shine];
    
    label = [[MZTimerLabel alloc] initWithLabel:self.timerlabel]; // the MZTimerLabel is initiated and is set to the timer label. This initiated the timer.
    [label start]; // The timer starts using this function.
   
    //self.questionnumber = 0;
    
    self.alpha = 0; //alpha will be responsible in making sure 10 questions are called.
   
    self.score = 10;  //score initially starts of at 10
   
    [self.view addSubview:self.scoreanswer]; // score answer is added to a seperate view
    
    self.scoreanswer.text = @"10";  // score answer is printed as 10 initially
    
    NSLog(@"%@", self.testtype);
   
    ThirdViewController *controller = [[ThirdViewController alloc] init]; // We are allocating this so we can call the function declared in this view controller.
    
    self.Questionlabelfirst.text = [controller nextquestion:self.testtype :self.questionnumber]; // the nextquestion function prints out question using the testtype (which is passed on by the BeginSecondViewController via the table view controller)
   
    self.Questionlabelfirst.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
    self.Questionlabelfirst.numberOfLines = 0;
    [self.Questionlabelfirst.layer setBorderWidth:1.0];
    [self.Questionlabelfirst.layer setBorderColor:[[UIColor blackColor] CGColor]]; // The question label is given a black border

    self.firstchoice.text = [controller nextanswerchoice:self.testtype : self.questionnumber*4]; //  Each of the choice UILabels are given texts usign the nextanswerchoice function. This uses the self.testtype and question number to access the corresponding choices depending on question number. There is a relationship between the question number and choice number This can be shown here ---
    
    /*
     Questionarray     choicearray
    0                  0,1,2,3
    1                  4,5,6,7 ...
     
     
     CA  = (QA x 4) + n  CA= choice array QA= Question array  n = number of choice where first choice is 0  (n = 0). This relationship remains the same for all questions and choices called
     
     */
    
    
    // 
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


 // We have two segues that is dependant on the score. If the user gets a score below 0, the user goes to the fail view controller, other wise the user is directed to the result view controller
// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"resultsegue"]){
        
        
        ResultViewController *resu = (ResultViewController *) segue.destinationViewController;
        resu.passedonteststring = self.testtype; // the type of test, score and time is passed on
        resu.passedontime = [label getTimeCounted];
        resu.passedonscore = self.score;
    
    }

    else if ([segue.identifier isEqualToString:@"fail"]){
        
        failViewController *fail = (failViewController*) segue.destinationViewController;
        fail.functest = self.testtype; //  only the type of test is passed on. 
        
    }
    

    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.

}
  /// The choice pressed is the IBAction that is shared amogst all the buttons.


- (IBAction)choicepressed:(UIButton*)sender {

    ThirdViewController *controller  = [[ThirdViewController alloc] init];
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc] init]; // two classes are declared so they can be used.
    
    NSArray *arr = [func answerfornumerical]; // answer for numerical from question bank
    NSArray *arr1 = [func answerforgeneral]; //answer for general from question bank
    
    NSTimeInterval recorded = [label getTimeCounted];
    
    NSLog(@"time = %f",recorded); //NSLog (time elapsed)

    
   NSString *ans = self.testtype;
  
        if (self.alpha <9){  //The statements carried out for when the first 9 questions are called.
        
        NSLog(@"%ld", (long)self.questionnumber);
        
        if (sender.tag == 1){ // each button within the same action has a different sender tag that was set in the attributes tab. Sender tag 1 is the first choice, sender tag 2 is second choice etc.
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
            [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber]; // checkanswerfunc is carried out and returns a notification (pop up notification)
    
            if ([self.chosenanswer isEqualToString: [arr objectAtIndex:self.questionnumber]] && [self.testtype isEqualToString:@"Numerical Reasoning"]){ // We need to determine the score functionality here. If the chosen answer is the same answer as the answer in the answer array arr and the type of test is Numerical Reasoning, then the score increments by 10 and it is printed.
                
                self.score = self.score + 10;
                self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                NSString *path = [NSString stringWithFormat:@"%@/131660__bertrof__game-sound-correct.wav", [[NSBundle mainBundle] resourcePath]];
                
                NSURL *soundUrl = [NSURL fileURLWithPath:path]; //the correct answer audio is then played
                
                self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
                
                [self.audio play];

                
              
            }
            else if ([self.chosenanswer isEqualToString: [arr1 objectAtIndex:self.questionnumber]] && [self.testtype isEqualToString:@"General Knowledge"]){
                //Same exact function only for when the testype is General Knowledge
                self.score = self.score + 10;
                self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                NSString *path = [NSString stringWithFormat:@"%@/131660__bertrof__game-sound-correct.wav", [[NSBundle mainBundle] resourcePath]];
                
                NSURL *soundUrl = [NSURL fileURLWithPath:path];
                
                self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
                
                [self.audio play];


            }
        
            else { //if the above two conditions are not met, the score is deducted by a random number between 0 and 15.
                
                self.score = self.score - arc4random()%15;
                self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                NSString *path = [NSString stringWithFormat:@"%@/131657__bertrof__game-sound-wrong.wav", [[NSBundle mainBundle] resourcePath]];
                
                NSURL *soundUrl = [NSURL fileURLWithPath:path]; //new audio file played that shows wrong answer
                
                self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
                
                [self.audio play];


            }

            if (self.score <0){  // if the score becomes negative, the user is sent to the failviewcontroller
                
                [self performSegueWithIdentifier:@"fail" sender:self];
                NSString *path = [NSString stringWithFormat:@"%@/342756__rhodesmas__failure-01.wav", [[NSBundle mainBundle] resourcePath]];
                
                NSURL *soundUrl = [NSURL fileURLWithPath:path];
                
                self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
                
                [self.audio play];  // new tune is played to notify change in circumstance.

            }

            NSLog(@"Score  = %ld",(long)self.score);
 

        self.questionnumber = arc4random() % 18; //  a new question is generated
            //self.questionnumber = self.questionnumber + 1;
        self.alpha = self.alpha + 1; // alpha incremented by 1 so second question is then printed
        self.Questionlabelfirst.text = [controller nextquestion:self.testtype :self.questionnumber]; // second random question is printed and its choices.
        self.Questionlabelfirst.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
        self.Questionlabelfirst.numberOfLines = 0;
        [self.Questionlabelfirst.layer setBorderWidth:1.0];
            [self.Questionlabelfirst.layer setBorderColor:[[UIColor blackColor] CGColor]];

        self.firstchoice.text = [controller nextanswerchoice:self.testtype : self.questionnumber*4];
        self.secondchoice.text = [controller nextanswerchoice:self.testtype :(self.questionnumber*4) +1];
        self.thirdchoice.text = [controller nextanswerchoice:self.testtype  :(self.questionnumber*4)+2];
        self.fourthchoice.text = [controller nextanswerchoice:self.testtype : (self.questionnumber*4)+3];

         

        }
    
        else{ //  if we have reached the last question, we are not going to print any additional choices. Only the notification and score is displayed. The segue is perfromed here
            
            if (sender.tag == 1){
                self.chosenanswer = self.firstchoice.text;  //if the first choice is pressed, then the notification is displayed
                [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
            
    
                
                if ([self.chosenanswer isEqualToString: [arr objectAtIndex:self.questionnumber]] && [self.testtype isEqualToString:@"Numerical Reasoning"]){
                    
                    self.score = self.score + 10; // score is incremented for each condition
                    self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                    
                    
                }
                else if ([self.chosenanswer isEqualToString: [arr1 objectAtIndex:self.questionnumber]] && [self.testtype isEqualToString:@"General Knowledge"]){
                    
                    self.score = self.score + 10;
                    self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                    
                }
                
                else {
                    
                    self.score = self.score - arc4random()%15; //decremented here
                    self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                    
                }
                
                if (self.score <0){
                    
                    [self performSegueWithIdentifier:@"fail" sender:self];
                    NSString *path = [NSString stringWithFormat:@"%@/342756__rhodesmas__failure-01.wav", [[NSBundle mainBundle] resourcePath]];
                    
                    NSURL *soundUrl = [NSURL fileURLWithPath:path];
                    
                    self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
                    
                    [self.audio play]; // if the score goes below 0 in the last question , the fail segue is performed, otherwise the user goes to the Results View Controller.

                }
                
                else{
                

                 [self performSegueWithIdentifier:@"resultsegue" sender:self];
                }
            }
            
            // The exact same code is used for each sender.tag value.
            
            else if (sender.tag == 2) {
                self.chosenanswer = self.secondchoice.text;
                [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
                
                
                if ([self.chosenanswer isEqualToString: [arr objectAtIndex:self.questionnumber]] && [self.testtype isEqualToString:@"Numerical Reasoning"]){
                    
                    self.score = self.score + 10;
                    self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                    
                    
                }
                else if ([self.chosenanswer isEqualToString: [arr1 objectAtIndex:self.questionnumber]] && [self.testtype isEqualToString:@"General Knowledge"]){
                    
                    self.score = self.score + 5;
                    self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                    
                }
                
                else {
                    
                    self.score = self.score - arc4random()%15;
                    self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                    
                }
                
                if (self.score <0){
                    
                    [self performSegueWithIdentifier:@"fail" sender:self];
                    NSString *path = [NSString stringWithFormat:@"%@/342756__rhodesmas__failure-01.wav", [[NSBundle mainBundle] resourcePath]];
                    
                    NSURL *soundUrl = [NSURL fileURLWithPath:path];
                    
                    self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
                    
                    [self.audio play];
                }
                else{
                
                [self performSegueWithIdentifier:@"resultsegue" sender:self];
                }
                
            }
           
                else if (sender.tag == 3){
            
                
                self.chosenanswer = self.thirdchoice.text;
                [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
                  
                    
                    if ([self.chosenanswer isEqualToString: [arr objectAtIndex:self.questionnumber]] && [self.testtype isEqualToString:@"Numerical Reasoning"]){
                        
                        self.score = self.score + 10;
                        self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                        
                    }
                    else if ([self.chosenanswer isEqualToString: [arr1 objectAtIndex:self.questionnumber]] && [self.testtype isEqualToString:@"General Knowledge"]){
                        
                        self.score = self.score + 5;
                        self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                        
                    }
                    
                    else {
                        
                        self.score = self.score - arc4random()%15;
                        self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                        
                    }
                    
                    if (self.score <0){
                        
                        [self performSegueWithIdentifier:@"fail" sender:self];
                        NSString *path = [NSString stringWithFormat:@"%@/342756__rhodesmas__failure-01.wav", [[NSBundle mainBundle] resourcePath]];
                        
                        NSURL *soundUrl = [NSURL fileURLWithPath:path];
                        
                        self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
                        
                        [self.audio play];

                    }
                    else{

                    [self performSegueWithIdentifier:@"resultsegue" sender:self];
                  
                    }
                
                
            }
            else if(sender.tag ==4){
                
                self.chosenanswer = self.fourthchoice.text;
                [controller checkanswerfunc:self.testtype :self.chosenanswer :self.questionnumber];
                
                
                if ([self.chosenanswer isEqualToString: [arr objectAtIndex:self.questionnumber]] && [self.testtype isEqualToString:@"Numerical Reasoning"]){
                    
                    self.score = self.score + 10;
                    self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                    
                }
                else if ([self.chosenanswer isEqualToString: [arr1 objectAtIndex:self.questionnumber]] && [self.testtype isEqualToString:@"General Knowledge"]){
                    
                    self.score = self.score + 5;
                    self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                    
                }
                
                else {
                    
                    self.score = self.score - arc4random()%15;
                    self.scoreanswer.text = [NSString stringWithFormat: @"%li", self.score];
                    
                }
                
                if (self.score <0){
                    
                    [self performSegueWithIdentifier:@"fail" sender:self];
                    NSString *path = [NSString stringWithFormat:@"%@/342756__rhodesmas__failure-01.wav", [[NSBundle mainBundle] resourcePath]];
                    
                    NSURL *soundUrl = [NSURL fileURLWithPath:path];
                    
                    self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
                    
                    [self.audio play];

                }
                

                else{
                    [self performSegueWithIdentifier:@"resultsegue" sender:self];
               
                }
                
            }
            
            
        }
}


// The go back button presents a UIAlertController.
- (IBAction)Goback:(UIButton *)sender {
    
    
    self.gobackoutlet.selected = YES; // button is selected
 
    [label pause]; // the timer is stops in this state
    
    NSString *path = [NSString stringWithFormat:@"%@/352651__foolboymedia__piano-notification-3.mp3", [[NSBundle mainBundle] resourcePath]];
    
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [self.audio play]; // audio is played when button is pressed
  
    
    UIAlertController *back = [UIAlertController alertControllerWithTitle:@"You have chosen to quit"
                                                                  message:@"Are you sure?"
                                                           preferredStyle:UIAlertControllerStyleAlert]; // the alert controller is presented here.
    UIAlertAction* first = [UIAlertAction actionWithTitle:@"Yes" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {  // the first action has a title Yes, and when the user presses Yes, the same code to set up MMDrawerController is carried out
                                                              
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
                                                      
                                                      [label start]; // when user presses no the user is returned to the test and the timer resumes
                                                      
                                                      self.gobackoutlet.selected = NO; // selected state is no
                                                  
                                                  }];
    
    [back addAction:second];
    [back addAction:first]; // the action is then added to the UIAlertController
    [self presentViewController:back animated:YES completion:nil];
    // the alert controller is presented in the current view controller.
}


 //These functions are called from QuestionAnswerBank and will be explained in more detail.
-(NSInteger*) checkanswerfunc: (NSString*) test :(NSString*) chosen : (NSInteger) indie{
    
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc]init];
    
   return  [func checkanswer:test :chosen :indie];
     // checkanswerfunc is the function that carries out the function declared in the QuestionAnswerBank

}

-(NSString*) nextquestion: (NSString*) test : (NSInteger) indie{
   
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc]init];
    _question = [func printquestion:test :indie];
  
    return _question; // a string is returned
}

-(NSString*) nextanswerchoice: (NSString*) test :(NSInteger) indie {
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc]init];
    

    _choice = [func printanswerchoices:test :indie]; // string of choice also returned
   
    
    return _choice;
}



@end
