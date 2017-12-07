//
//  TrueFalseViewController.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 03/12/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "TrueFalseViewController.h"

@interface TrueFalseViewController ()

@end

@implementation TrueFalseViewController

@synthesize  scoretrue, questionnumbertrue, beta, answerpick, timer;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.questionnumbertrue = arc4random() % 18;   // setting question number - random number between 0 and 18 (array)
    self.timer = [[MZTimerLabel alloc] initWithLabel:self.timerlabeltruefalse];  //Give self.timer label UILabel property.
   [self.timer start];
    //self.questionnumber = 0;
    self.beta = 0; // 1st quesiton
    self.scoretrue = 10;
    self.scorelabeltrue.text = @"10"; // setting score to 10 and beta to 0
    TrueFalseViewController *controller = [[TrueFalseViewController alloc] init];
    self.questiontruefalse.text = [controller nextquestiontrue: self.truefalsetest :self.questionnumbertrue];
    self.questiontruefalse.lineBreakMode = NSLineBreakByWordWrapping; // These two lines of code have been implemented so that there is a word wrap with the UILabel. Since its a long descripion, it looks better when the text is word wrapped as opposed to one long line.
    self.questiontruefalse.numberOfLines = 0;
    [self.questiontruefalse.layer setBorderWidth:1.0];
    [self.questiontruefalse.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.gobackoutlettrue.layer setBorderWidth:1.0];
    [self.gobackoutlettrue.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.sendertag1.layer setBorderWidth:1.0];
    [self.sendertag1.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.sendertag2.layer setBorderWidth:1.0];
    [self.sendertag2.layer setBorderColor:[[UIColor blackColor] CGColor]];  // setting the border of button and question label
}

// In the viewdidLoad function, the question number is set as a random number between 0 and 18. The timer label has been activated and intialised to be used with the UILabel called timerlabeltruefalse. The timer begins by using [self.timer start]. The score function is also initialised and the score is set to 10. I am also using beta in order to assign the question number. The value of beta is set to 0 (When the question number is 0 we are accessing index 0 fromt the Question array). The question label is also called using the nextquestiontrue function, which uses the type of test and questionnumber to access the question from the question array.

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"passon"]){
        
        ResultViewController *resu = (ResultViewController*) segue.destinationViewController;
        resu.passedonteststring = self.truefalsetest;
        resu.passedonscore = self.scoretrue;
        resu.passedontime = [self.timer getTimeCounted]; // Once test finishes, pass variable of test type and time elapsed to resultviewcontrolle
    }
    
    else if ([segue.identifier isEqualToString:@"failtrue"]){
        failViewController *fail = (failViewController *) segue.destinationViewController;
        fail.functest = self.truefalsetest; // pass of type of test to fail view controller
    }
}
- (IBAction)gobacktrue:(UIButton *)sender {
    self.gobackoutlettrue.selected = YES; // when user pauses, the timer stops and the button is in selected state
    [self.timer pause];
    NSString *path = [NSString stringWithFormat:@"%@/352651__foolboymedia__piano-notification-3.mp3", [[NSBundle mainBundle] resourcePath]]; // tune is played
    
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    
    self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    
    [self.audio play];
    

    
    UIAlertController *back = [UIAlertController alertControllerWithTitle:@"You have chosen to quit"
                                                                  message:@"Are you sure?"
                                                           preferredStyle:UIAlertControllerStyleAlert]; // declare the initial call
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
                                                      [self.timer reset];
                                                      
                                                      // when user presses yes, the user returns to welcome screen using same code as ViewController.
                                                      
                                                  }];
    UIAlertAction* second = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       
                                                       [self.timer start];
                                                       
                                                       self.gobackoutlettrue.selected = NO; // when pressed no, the timer resumes and the selected state is set to NO
                                                   }];
    
    [back addAction:second];
    [back addAction:first];
    //corresponding actions are added
    [self presentViewController:back animated:YES completion:nil];  // The alert controller is presented in the current view controller using self

}

- (IBAction)answertruefalsepressed:(UIButton *)sender {
    
    TrueFalseViewController *controller = [[TrueFalseViewController alloc] init];
    QuestionAnswerBank *question = [[QuestionAnswerBank alloc] init];
    NSArray *arr = [question answerfortruefalse];
    
    if (self.beta < 9){ // beta is the question index
    
        if(sender.tag == 1){
             /// answer pick is either True or False
            self.answerpick = @"True";
        }
        
        else if (sender.tag == 2){
            
            self.answerpick = @"False";
        }
        
            [controller checkanswerfunctrue:self.truefalsetest :self.answerpick :self.questionnumbertrue]; // this function compares the picked answer with the answer array for the true and false question bank.
            
            if ([self.answerpick isEqualToString: [arr objectAtIndex:self.questionnumbertrue]]){
                
                self.scoretrue = self.scoretrue + 10; // when it is equal, the score increments by 10 and a correct answer tune is played.
                self.scorelabeltrue.text = [NSString stringWithFormat: @"%li", self.scoretrue]; // score label is updated
                NSString *path = [NSString stringWithFormat:@"%@/131660__bertrof__game-sound-correct.wav", [[NSBundle mainBundle] resourcePath]];
                
                NSURL *soundUrl = [NSURL fileURLWithPath:path];
                
                self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
                
                [self.audio play];
            }
            
            else {
                
                self.scoretrue = self.scoretrue - arc4random()%25;
                self.scorelabeltrue.text = [NSString stringWithFormat: @"%li", self.scoretrue];
                NSString *path = [NSString stringWithFormat:@"%@/131657__bertrof__game-sound-wrong.wav", [[NSBundle mainBundle] resourcePath]];
                NSURL *soundUrl = [NSURL fileURLWithPath:path];
                self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
                [self.audio play]; // if the answer is wrong, the score is deducted by a random number between 0 and 25 and a wrong answer ping is played.
            }
        
            if (self.scoretrue <0){
                
                [self performSegueWithIdentifier:@"failtrue" sender:self];
            }
     // if the score reaches below 0, the user is presented to the fail view controller.
        
        self.questionnumbertrue = arc4random()%18; // another question is chosen between 0 and 18
        self.beta = self.beta + 1; // the beta increases by 1
        
        self.questiontruefalse.text = [controller nextquestiontrue:self.truefalsetest :self.questionnumbertrue];
        
    }
    
    else {
        
        if(sender.tag == 1){  // if beta reaches 9 ie the last question, no new questions are printed out
            
            self.answerpick = @"True";
            [controller checkanswerfunctrue:self.truefalsetest :self.answerpick :self.questionnumbertrue];
            
            if ([self.answerpick isEqualToString: [arr objectAtIndex:self.questionnumbertrue]]){
                
                self.scoretrue = self.scoretrue + 10;
                self.scorelabeltrue.text = [NSString stringWithFormat: @"%li", self.scoretrue];
                
            }
            
            else {
                
                self.scoretrue = self.scoretrue - arc4random()%25;
                self.scorelabeltrue.text = [NSString stringWithFormat: @"%li", self.scoretrue];
                
            }
            
            if (self.scoretrue <0){ // if the score is less than 0, then
                
                [self performSegueWithIdentifier:@"failtrue" sender:self];
            }
            else {
            
            
            [self performSegueWithIdentifier:@"passon" sender:self];
            }

        }
        
        else if (sender.tag == 2){
              /// same code as sender.tag == 1 
            self.answerpick = @"False";
            [controller checkanswerfunctrue:self.truefalsetest :self.answerpick :self.questionnumbertrue];
            
            if ([self.answerpick isEqualToString: [arr objectAtIndex:self.questionnumbertrue]]){
                
                self.scoretrue = self.scoretrue + 10;
                self.scorelabeltrue.text = [NSString stringWithFormat: @"%li", self.scoretrue];
                
            }
            
            else {
                
                self.scoretrue = self.scoretrue - arc4random()%25;
                self.scorelabeltrue.text = [NSString stringWithFormat: @"%li", self.scoretrue];
                
            }
            
            if (self.scoretrue <0){
                
                [self performSegueWithIdentifier:@"failtrue" sender:self];
            }
            
            else{
            
            
            [self performSegueWithIdentifier:@"passon" sender:self];

        }
        }
}
}
-(NSInteger*) checkanswerfunctrue: (NSString*) test :(NSString*) chosen : (NSInteger) indie{
    
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc]init];
    
    return  [func checkanswer:test :chosen :indie];
    
    
}

-(NSString*) nextquestiontrue: (NSString*) test : (NSInteger) indie{
    
    QuestionAnswerBank *func = [[QuestionAnswerBank alloc]init];
    _questiontrue = [func printquestion:test :indie];
    
    return _questiontrue;
}


#pragma mark Description

/*
  In this view controller, the True or False Trivia Questions are carried out. In the viewdidLoad, the first question is loaded up and the choices and quit button are given borders around them. The score is initially set to 10 and the timer label starts. As we are on the first question, beta is set to 0. Since we are calling random questions, the questionnumbertrue is set to a random number between 0 and 18. The reason why its set to 18 is explained below. The Questionlabel is also given some line break codes so lomger questions appear on longer lines.
 
 Within the IBAction for the answertruefalsepressed, sender.tag == 1 refers to a true being pressed and sender.tag == 2 refers to a false being pressed. The answerpick is then equal to the string "True" or "False". The checkanswerfunc is carried out and a notification is then displayed in the form of a pop up telling the user whether the answer is correct or wrong. 
 
 The answer is then checked by comparing it with the answers declared in the Question and Answer Bank. If the answers are equal, then the users score increments by 10 and there is a notification ping in the form of audio. Otherwise, the score decreases by a random value between 0 and 25. If the score goes below 0, the user is presented with a new view controller, telling the user that the score has fallen below zero 
 
 The whole IBAction for the button is carried under the condition that beta remains below 9. If beta exceeds 8, then the code used for when the condition was satisfied is used except the new questions are not called with one addition. I have added an else if to the segue functions in order for the correct segue to be performed. 
 
 There is also a UIAlertController that gives the oppurtunity for the user to quit the game or pause it. The actions when the user presses the according button is carred out. When the user presses no, the alert controller is dismissed and when pressed yes, the user returns to the welcomes screen. 
 
 The reason why beta is set to below 9 is due to the incrementation of beta. The last function to be carried out after the if statments. So there is a slight lag: This is shown visually:
 
 Q            value of beta         When beta reaches 9 at the end of the if statement, we do not want to print more questions.
 1                  0
 2                  1
 3                  2
 4                  3
 5                  4
 6                  5
 7                  6
 8                  7
 9                  8
 10                 9
 */

#pragma mark References

/*
 -MZTimerLabel from https://github.com/mineschan/MZTimerLabel  implementation of code from example project and m files
 - Line break code from https://stackoverflow.com/questions/990221/multiple-lines-of-text-in-uilabel
 -segues from Lab 3 
 -Audio implementation from https://codewithchris.com/avaudioplayer-tutorial/
 -functions from Lab 1
 -Setting Borders: https://stackoverflow.com/questions/510382/how-do-i-create-a-round-cornered-uilabel-on-the-iphone
 -MMDDrawerController by MutualMobile-- fetched from Github.com
  Implementation of code from https://www.youtube.com/watch?v=snYmY138RIs by Akash Patel
 -UIALertController from Documentation and API Reference.

 */

@end
