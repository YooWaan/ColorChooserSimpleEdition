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

@synthesize colorTableView, redValue, greenValue, blueValue, alphaValue;

- (id)initWithNibName:(NSString*)nibName bundle:(NSBundle*)bundle
{
  self = [super initWithNibName: nibName bundle:bundle];
  if (self) {
    // Custom initialization
    self.redValue = 0.5;
    self.greenValue = 0.5;
    self.blueValue = 0.5;
    self.alphaValue = 1.0;
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
    self.colorTableView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  //return (interfaceOrientation == UIInterfaceOrientationPortrait);
  return YES;
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
  if (indexPath.section == SECTION_COLOR_PANEL) {
    return tableView.frame.size.height /2;
  }
  return 64;
}

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
	  UIView* colorPanel = [[[UIView alloc] initWithFrame:CGRectMake(0,0, tableView.frame.size.width, tableView.frame.size.height/2)] autorelease];
	  [cell.contentView addSubview:colorPanel];
        } else if (indexPath.section == SECTION_SLIDER) {
	  UILabel* label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
	  UISlider* slider = [[[UISlider alloc] initWithFrame:CGRectMake(cell.frame.size.width/2, 0, cell.frame.size.width/2, cell.frame.size.height)] autorelease];
	  [cell.contentView addSubview:label];
	  [cell.contentView addSubview:slider];
        } else if (indexPath.section == SECTION_CELL) {

        }
    }

    // Configure the cell...
    if (indexPath.section == SECTION_COLOR_PANEL) {
      UIView* panel = (UIView*)[cell.contentView.subviews objectAtIndex:0];
      panel.backgroundColor = [UIColor colorWithRed:self.redValue green:self.greenValue blue:self.blueValue alpha:self.alphaValue ];
    } else if (indexPath.section == SECTION_SLIDER) {
      // label slider
      UILabel* label = (UILabel*)[cell.contentView.subviews objectAtIndex:0];
      UISlider* slider = (UISlider*)[cell.contentView.subviews objectAtIndex:1];
      if (indexPath.row == 0) {
	label.text = NSLocalizedString(@"Label.Red", nil);
	slider.value = self.redValue;
      } else if (indexPath.row == 1) {
	label.text = NSLocalizedString(@"Label.Green", nil);
	slider.value = self.greenValue;
      } else if (indexPath.row == 2) {
	label.text = NSLocalizedString(@"Label.Blue", nil);
	slider.value = self.blueValue;
      } else if (indexPath.row == 3) {
	label.text = NSLocalizedString(@"Label.Alpha", nil);
	slider.value = self.alphaValue;
      }
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
