//
//  TableViewController.m
//  Navigation
//
//  Created by Fernando Lucheti on 19/03/15.
//  Copyright (c) 2015 Vinicius Miana. All rights reserved.
//

#import "TableViewController.h"
#import "Dicionario.h"
#import "LetraAViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Dicionario *dicionario = [Dicionario getInstance];
    UINib *nib = [UINib nibWithNibName:@"TableViewCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:@"celula"];
    NSString *x = [dicionario.alfabeto ler];
    while (![x  isEqual: @"Z"]) {
        x = [dicionario.alfabeto rodar];
        NSLog([dicionario.alfabeto ler]);
    }


    
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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [[[Dicionario getInstance] alfabeto] tamanho];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"celula"];
    Dicionario *dicionario = [Dicionario getInstance];
    
    cell.textLabel.text= [dicionario.alfabeto ler];
    cell.detailTextLabel.text = [dicionario randomStringWithLength:[dicionario.alfabeto ler]
    [dicionario.alfabeto rodar];
    // Configure the cell...
    
    return cell;
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


#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
//    LetraAViewController *letraViewController = [[LetraAViewController alloc] init];
//    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController: letraViewController];
//    UITabBarController *tab = [[UITabBarController alloc] init];
//    UITableView *table = [[UITableView alloc] init];
//    [tab addChildViewController:nav];
////        [tab a addChildViewController:table];
////    self.tabBarController.viewControllers = @[self.navigationController, tableView];
//    
//    // Pass the selected object to the new view controller.
//    Dicionario *dicionario= [Dicionario getInstance];
//    
//    for (int i = 0; i< indexPath.row; i++) {
//
//        [dicionario.alfabeto rodar];
//    }
//    letraViewController.title = [dicionario.alfabeto ler];
//    // Push the view controller.
//    [self.tabBarController showViewController:tab sender: nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
