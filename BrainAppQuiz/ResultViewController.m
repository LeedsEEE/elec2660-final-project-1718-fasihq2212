//
//  ResultViewController.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 25/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "ResultViewController.h"


@interface ResultViewController ()

@end

@implementation ResultViewController

@synthesize passedonteststring, morphlabelscore, finalscorealpha, passedonscore, improvementlabel, score;
- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *path = [NSString stringWithFormat:@"%@/352283__sirkoto51__success-loop-1.wav", [[NSBundle mainBundle] resourcePath]]; // Play the theme tune for when the user finishes the test
    NSURL *soundUrl = [NSURL fileURLWithPath:path];
    self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    [self.audio play];
    [self.view addSubview:self.improvementlabel];
    [self.tryagainprop.layer setBorderWidth:1.0];
    [self.tryagainprop.layer setBorderColor:[[UIColor blackColor] CGColor]];
    [self.chooseagainprop.layer setBorderWidth:1.0];
    [self.chooseagainprop.layer setBorderColor:[[UIColor blackColor] CGColor]];
     // putting the border around the choose category button and try again button

    [self.view addSubview:self.resultfinish]; // resultfinish and finalscorealpha are animated variables so we need to assign a seperate view
    [self.view addSubview:self.finalscorealpha]; // we create a subview for the finalscorealpha label since confetti is a subview. We do this for each button and label. 
  
    self.resultfinish.text = self.passedonteststring; // passed on string is the result finish label text
       [self.resultfinish shine]; // This is then animated
    
    self.confetti = [[PHConfettiView alloc] initWithFrame:self.view.bounds];
    self.confetti.colors = @[[UIColor colorWithRed:0.95 green:0.40 blue:0.27 alpha:1.0],
                                 [UIColor colorWithRed:1.00 green:0.78 blue:0.36 alpha:1.0],
                                 [UIColor colorWithRed:0.48 green:0.78 blue:0.64 alpha:1.0],
                                 [UIColor colorWithRed:0.30 green:0.76 blue:0.85 alpha:1.0],
                                 [UIColor colorWithRed:0.58 green:0.39 blue:0.55 alpha:1.0]];
  
    self.confetti.type = PHConfettiTypeConfetti; // the confetti is carried out
    [self.finalscorealpha shine]; // the final score alpha is the score at the end of the test without the multiplier.
    
    [self.view addSubview:self.confetti];
    [self.confetti startConfetti];
    
    [self.view addSubview:self.tryagainprop];
     [self.view addSubview:self.chooseagainprop];
    // the buttons are added as a sub view as well
    
    self.timeshine.text = [NSString stringWithFormat:@"Time: %.2f seconds", self.passedontime]; // the time  and score is set to self.passedontime and self.passedonscore which come from the ThirdViewController
    self.scoreshine.text = [NSString stringWithFormat:@"Score: %li", (long)self.passedonscore];
    
    [self.timeshine shine]; // the time and score is animated
    [self.scoreshine shine]; // score is animated.
    [self.morphlabelscore setText:[NSString stringWithFormat:@"%li", self.passedonscore] withCompletionBlock:^{
        NSLog(@"done"); // this is the improvementlabel that will be animated when the user initially finishes the
    }];
    [self.view addSubview:self.morphlabelscore]; // add subview for morphlabel
    
    [self performSelector:@selector(displayfinalscore) withObject:nil afterDelay:3]; // This function carries out the fade animation. The 

}
    // start Animation
   
    // Do any additional setup after loading the view
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"backtonorm"]){
        
        ThirdViewController *tryagainassign = (ThirdViewController *) segue.destinationViewController;
        tryagainassign.testtype = self.passedonteststring;  // backtonorm segue goes to third view controller for General Knowledge and Numerical Reasoning
    }
    
    else {
        
        TrueFalseViewController *dec = (TrueFalseViewController *) segue.destinationViewController;
        dec.truefalsetest = self.passedonteststring; // here if the identifier is not backtonorm, the type of test is passed on to the TrueFalseViewController.
    }
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

- (IBAction)tryagain:(id)sender {
    
    
    if ([self.passedonteststring isEqualToString:@"General Knowledge"] || [self.passedonteststring isEqualToString:@"Numerical Reasoning"]){
        
        [self performSegueWithIdentifier:@"backtonorm" sender:self];
        NSString *path = [NSString stringWithFormat:@"%@/351256__kinoton__deep-whoosh-1.wav", [[NSBundle mainBundle] resourcePath]];
        
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        
        self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        [self.audio play];

    }
    
    else {
        
        [self performSegueWithIdentifier:@"backtotrue" sender:self];
        NSString *path = [NSString stringWithFormat:@"%@/351256__kinoton__deep-whoosh-1.wav", [[NSBundle mainBundle] resourcePath]];
        
        NSURL *soundUrl = [NSURL fileURLWithPath:path];
        
        self.audio = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
        
        [self.audio play];   // When the try again button is pressed, the segue with identifier function is performed. If the passedontest from the ThirdviewController or truefalseviewcontroller is equal to string of General Knowledge or Numerical Reasoning, the corresponding segue is performed and the appropiate audio is played.


    }
}

- (IBAction)chooseanother:(id)sender {
    
    // Same code used here in ViewController. This code initiates the MMDrawerController. This method uses the app delegate instead. The MMDrawerController is declared as self.funcsidep
    
    
    AppDelegate *appdel = (AppDelegate*)[[UIApplication sharedApplication] delegate]; //created a type for app delegate. it has been imported here.
    
    
    UIStoryboard *mainstory = [UIStoryboard storyboardWithName: @"Main" bundle:nil]; //create a story board
    
    UIViewController *leftview = [mainstory instantiateViewControllerWithIdentifier:@"LeftTableViewController"];     //creating UI view controllers called left view,,right view etc. We are not going to use right as I only want the left view to slide out
    
    UIViewController *centreview = [mainstory instantiateViewControllerWithIdentifier:@"CentreViewController"];
    
    
    UINavigationController *leftnav = [[UINavigationController alloc] initWithRootViewController: leftview]; //create navigation controllers from the view controllers.
    UINavigationController *centrenav = [[UINavigationController alloc] initWithRootViewController: centreview];
    
    self.callfuncsidep = [[MMDrawerController alloc]initWithCenterViewController:centrenav leftDrawerViewController:leftnav]; //assign the navigation  controllers to leftdrawer/right drawer etc..
    
    self.callfuncsidep.openDrawerGestureModeMask = MMOpenDrawerGestureModePanningCenterView;
    self.callfuncsidep.closeDrawerGestureModeMask = MMCloseDrawerGestureModePanningCenterView;
    
    
    [self.callfuncsidep setMaximumLeftDrawerWidth:270];
    
    [self.callfuncsidep  setDrawerVisualStateBlock:[MMDrawerVisualState swingingDoorVisualStateBlock]]; //This is the animation block.. different ones can be used such as parallax etc
    
    appdel.window.rootViewController = self.callfuncsidep; // We are getting the window variable from app delegate and declaring it here. Normally, _window.rootViewController would have been used
    [appdel.window makeKeyAndVisible];
    
    [self.audio stop];
}

-(void) displayfinalscore{
       // The passed on score is calculated based on how many points the user deducted and added when answering the questions. The final score is calculated by using a linear equation
    
    //final score  = (passsedonscore x F) x 1000/passedontime  F is the multiplier and this depends on the score. A higher score means a greater multiplier.
    // In these if statments, the value of F (multiplier) changes accordinngly. The score (self.score) is calculated and the morphlabelscore label is set to the score value (it is animated)
    
    // The highest score the user can get is 110 and the final boundary has the largest multiplier.
    
#pragma mark Calculating score

    if (self.passedonscore <10){
                 self.score = (self.passedonscore * 1) + (1000/self.passedontime);
        [self.morphlabelscore setText:[NSString stringWithFormat:@"%i", self.score] withCompletionBlock:^{
            NSLog(@"done");
        }];
        
    }
    
    else if (self.passedonscore >=10 && self.passedonscore <15){
        
        self.score = (self.passedonscore * 1.5) + (1000/self.passedontime);
        [self.morphlabelscore setText:[NSString stringWithFormat:@"%i", self.score] withCompletionBlock:^{
            NSLog(@"done");
        }];

    }
    else if (self.passedonscore >=15 && self.passedonscore <20){
        
         self.score = (self.passedonscore * 2) + (1000/self.passedontime);
        [self.morphlabelscore setText:[NSString stringWithFormat:@"%i", self.score] withCompletionBlock:^{
            NSLog(@"done");
        }];

    }
    else if (self.passedonscore >=20 && self.passedonscore <25){
        
        self.score = (self.passedonscore * 2.5) + (1000/self.passedontime);
        [self.morphlabelscore setText:[NSString stringWithFormat:@"%i", self.score] withCompletionBlock:^{
            NSLog(@"done");
        }];

    
    }
    
    else if (self.passedonscore >=25 && self.passedonscore <30){
        
       self.score = (self.passedonscore * 3) + (1000/self.passedontime);
        [self.morphlabelscore setText:[NSString stringWithFormat:@"%i", self.score] withCompletionBlock:^{
            NSLog(@"done");
        }];

    }
    
    else if (self.passedonscore>=30 && self.passedonscore < 50){
        
      self.score = (self.passedonscore * 3.5) + (1000/self.passedontime);
        [self.morphlabelscore setText:[NSString stringWithFormat:@"%i", self.score] withCompletionBlock:^{
            NSLog(@"done");
        }];
        
    }
    
    else if (self.passedonscore>= 50 && self.passedonscore < 70 ){
         self.score = (self.passedonscore * 4.5) + (1000/self.passedontime);
        [self.morphlabelscore setText:[NSString stringWithFormat:@"%i", self.score] withCompletionBlock:^{
            NSLog(@"done");
        }];
        
    }

    else if (self.passedonscore >= 70 && self. passedonscore <80){
        
        self.score = (self.passedonscore * 5) + (1000/self.passedontime);
        [self.morphlabelscore setText:[NSString stringWithFormat:@"%i", self.score] withCompletionBlock:^{
            NSLog(@"done");
        }];
    }
    
    else if (self.passedonscore >= 80 && self.passedonscore <100){
        
         self.score = (self.passedonscore * 6.5) + (1000/self.passedontime);
        [self.morphlabelscore setText:[NSString stringWithFormat:@"%i", self.score] withCompletionBlock:^{
            NSLog(@"done");
        }];
        
           }

    else if (self.passedonscore >=100){
        
         self.score = (self.passedonscore * 8.0) + (1000/self.passedontime);
        [self.morphlabelscore setText:[NSString stringWithFormat:@"%i", self.score] withCompletionBlock:^{
            NSLog(@"done");
        }];
        
    }
    
#pragma mark Setting the improvements/explanations     

    //Here the self.score is then used to set the explanations and some improvements for the user. The boundaries are similar to the previous if statments in that in this case, each boundary has been multiplied by 10. The improvement is then animated using RQShineLabel.
    
    if (self.score <100){   // if the score from previous if statement is less than 0 --
        
        self.improvementlabel.text = @"Try harder next time"; // improvement label is printed with text
        [self.improvementlabel shine]; // the UILable is the animated with RQShineLabel. This pattern repeats for different boundaries.
        
        NSLog(@"first");
    }
    
    else if (self.score >=100 && self.score <150){
        
        self.improvementlabel.text = @"Keep going. You're still very far off perfect";
        [self.improvementlabel shine];
        
    }
    else if (self.score >=150 && self.score <200){
        
        self.improvementlabel.text = @"Still the same";
        [self.improvementlabel shine];
        NSLog(@"third");
        
        
    }
    else if (self.score >=200 && self.score <250){
        
        self.improvementlabel.text = @"Making some visible progress now. Keep practicing questions";
        [self.improvementlabel shine];
        NSLog(@"fourth");
        
        
    }
    
    else if (self.score >=250 && self.score <300){
        
       
        self.improvementlabel.text = @"Very good progress being made here";
        [self.improvementlabel shine];
    }
    
    else if (self.score>=300 && self.score < 500){
        
               self.improvementlabel.text = @"Great! You've entered 'the hard to get' scores. It will be very difficult to get a higher score from here so keep practicing!";
        [self.improvementlabel shine];
        NSLog(@"six");
        
    }
    
    else if (self.score>= 500 && self.score < 700 ){
               self.improvementlabel.text = @"Excellent! A competant score";
        [self.improvementlabel shine];
        
        NSLog(@"six");
    }
    
    else if (self.score >= 700 && self. score <800){
        
        self.improvementlabel.text = @"Wow! Wow! You're on a streak! Keep going though you can still improve!";
        [self.improvementlabel shine];
        
        NSLog(@"six");
    }
    
    else if (self.score >= 800 && self.score <1000){
        

        self.improvementlabel.text =  @"You've finally done it! You're nearly an expert in this topic";
        [self.improvementlabel shine];
        NSLog(@"six");
    }
    
    else if (self.score >=1000){
        
        self.improvementlabel.text = @"You're a legend! I should hire you for new questions!";
        [self.improvementlabel shine];
        NSLog(@"six");
        
    }
    
    [ProgressHUD showSuccess]; /// This is a push notification telling the user the score calculation is finished.
}


@end
