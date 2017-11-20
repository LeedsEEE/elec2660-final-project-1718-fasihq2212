//
//  LeftTableViewController.m
//  BrainAppQuiz
//
//  Created by Fasih Qureshi on 18/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "LeftTableViewController.h"

@interface LeftTableViewController ()

@end

@implementation LeftTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.data = [[implementtypeanddes alloc]init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1; //We need only one section with 3 topics
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
    
    // 3 rows in the section for each topic
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"firstcell" forIndexPath:indexPath];
    
    // Configure the cells
    
    if (indexPath.row == 0){  //indexpath.row defines the row in the section.
    
    cell.textLabel.text = @"Numerical Reasoning";
    cell.detailTextLabel.text = @"Mathematics Based Topic";
    
    }
    else if (indexPath.row == 1){
        cell.textLabel.text = @"General Knowledge";
        cell.detailTextLabel.text = @"Trivia Based Topic";
      
    }
    else if (indexPath.row == 2){
        
        cell.textLabel.text = @"Riddles";
        cell.detailTextLabel.text = @"Think outside the box";
       
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    return @"Choose a Topic"; //the title of the section is Choose a topic
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([[segue identifier] isEqualToString:@"transmit"]){  // In this section, we are passing on the type of test and description from the table view to the beginsecondviewcontroller.
        
        BeginSecondViewController *destinationViewController = [segue destinationViewController]; //we need to define the destination view controller. In this case, it is the beginsecondviewcontroller.
        NSIndexPath *indexpath  = [self.tableView indexPathForSelectedRow]; //import tableview components so we can use indexpath.row and section.
        
        if(indexpath.section ==0){ //there is only one section which contains 3 topics
            
            typeoftestanddescription *temptesr = [self.data.firtsection objectAtIndex:indexpath.row]; //'data' has been declared in the h file of the tableview controller. It refers to the implementtypeanddes.h file. The first section from this h file components are being fetched. These components are the type of test(typeoftest) and the full description (desc). There are 3 rows and 3 topics, thus objectatIndex function assigns the specific row in the table view
            
            destinationViewController.typee = temptesr; //set the temporary typeoftestanddescription (temptesr) as an object in the new viewcontroller
            

        
    }
    
    
}
}

@end
