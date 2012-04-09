//
//  CCSEiPhoneViewController.m
//  ColorChooserSimpleEdition
//
//  Created by developer on 12/04/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CCSEiPhoneViewController.h"


//
// Section Numbers
//
#define SECTION_COLOR_PANEL 0
#define SECTION_SLIDER      1
#define SECTION_CELL        2

//
// Table Request queue key
//

NSString* const REUSE_QUEUE_COLOR_PANEL_IDENTIFIER = @"_color_panel_";
NSString* const REUSE_QUEUE_SLIDER_IDENTIFIER = @"_slider_";
NSString* const REUSE_QUEUE_CELL_IDENTIFIER = @"_color_cell_";


@interface CCSEiPhoneViewController ()

@end

@implementation CCSEiPhoneViewController


@synthesize redValue, greenValue, blueValue, alphaValue;

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    switch(section) {
    case SECTION_COLOR_PANEL:
        return 1;
    case SECTION_SLIDER :
        return 4;
    case SECTION_CELL :
        return 1;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* CellIdentifier;
    if (indexPath.section == 0) {
        CellIdentifier = REUSE_QUEUE_COLOR_PANEL_IDENTIFIER;
    } else if (indexPath.section == 1) {
        CellIdentifier = REUSE_QUEUE_SLIDER_IDENTIFIER;
    } else if (indexPath.section == 2) {
        CellIdentifier = REUSE_QUEUE_CELL_IDENTIFIER;
    }

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        if (indexPath.section == SECTION_COLOR_PANEL) {
        } else if (indexPath.section == SECTION_SLIDER) {
        } else if (indexPath.section == SECTION_CELL) {
        }
    }

    // Configure the cell...
    if (indexPath.section == SECTION_COLOR_PANEL) {
    } else if (indexPath.section == SECTION_SLIDER) {
    } else if (indexPath.section == SECTION_CELL) {
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     [detailViewController release];
     */
}

@end
