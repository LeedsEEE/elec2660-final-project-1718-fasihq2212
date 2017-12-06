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
    self.questionnumbertrue = arc4random() % 18;
    self.timer = [[MZTimerLabel alloc] initWithLabel:self.timerlabeltruefalse];
   [self.timer start];
    //self.questionnumber = 0;
    self.beta = 0;
    self.scoretrue = 10;
    self.scorelabeltrue.text = @"10";
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
    [self.sendertag2.layer setBorderColor:[[UIColor blackColor] CGColor]];
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
        resu.passedontime = [self.timer getTimeCounted];
    }
    
    else if ([segue.identifier isEqualToString:@"failtrue"]){
        failViewController *fail = (failViewController *) segue.destinationViewController;
        fail.functest = self.truefalsetest;
    }
}
- (IBAction)gobacktrue:(UIButton *)sender {
    self.gobackoutlettrue.selected = YES;
    [self.timer pause];
    
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
                                                      [self.timer reset];
                                                      
                                                  }];
    UIAlertAction* second = [UIAlertAction actionWithTitle:@"No" style:UIAlertActionStyleDefault
                                                   handler:^(UIAlertAction * action) {
                                                       
                                                       [self.timer start];
                                                       
                                                       self.gobackoutlettrue.selected = NO;
                                                       
                                                   }];
    
    [back addAction:second];
    [back addAction:first];
    
    [self presentViewController:back animated:YES completion:nil];

}

- (IBAction)answertruefalsepressed:(UIButton *)sender {
    
    TrueFalseViewController *controller = [[TrueFalseViewController alloc] init];
    QuestionAnswerBank *question = [[QuestionAnswerBank alloc] init];
    NSArray *arr = [question answerfortruefalse];
    
    if (self.beta < 9){
    
        if(sender.tag == 1){
            
            self.answerpick = @"True";
        }
        
        else if (sender.tag == 2){
            
            self.answerpick = @"False";
        }
        
            [controller checkanswerfunctrue:self.truefalsetest :self.answerpick :self.questionnumbertrue];
            
            if ([self.answerpick isEqualToString: [arr objectAtIndex:self.questionnumbertrue]]){
                
                self.scoretrue = self.scoretrue + 10;
                self.scorelabeltrue.text = [NSString stringWithFormat: @"%li", self.scoretrue];
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
                
                [self.audio play];

                
            }
        
            if (self.scoretrue <0){
                
                [self performSegueWithIdentifier:@"failtrue" sender:self];
            }
    
        
        self.questionnumbertrue = arc4random()%18;
        self.beta = self.beta + 1;
        
        self.questiontruefalse.text = [controller nextquestiontrue:self.truefalsetest :self.questionnumbertrue];
        
    }
    
    else {
        
        if(sender.tag == 1){
            
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
            
            if (self.scoretrue <0){
                
                [self performSegueWithIdentifier:@"failtrue" sender:self];
            }
            
            
            [self performSegueWithIdentifier:@"passon" sender:self];

        }
        
        else if (sender.tag == 2){
            
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
            
            
            [self performSegueWithIdentifier:@"passon" sender:self];

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



@end
