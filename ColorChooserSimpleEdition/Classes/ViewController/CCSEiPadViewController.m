//
// CCSEiPadViewController.m -
//
//
//
// Created by wooyoowaan@gmail.com on Sun Aug 12 19:11:50 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "CCSEiPadViewController.h"

#import <iAd/iAd.h>

#import "CCSEColors.h"
#import "CCSEiPadColorListViewController.h"

#define CCSE_TOP_SECTION 0
#define CCSE_COLORS_SECTION 1
#define CCSE_CONFIG_SECTION 2

@implementation CCSEiPadViewController

@synthesize topTableView;


- (void)viewDidLoad {
  [super viewDidLoad];
  //self.topTableView.tableFooterView = [[[ADBannerView alloc] initWithFrame:CGRectMake(0,0, self.topTableView.frame.size.width, 64)] autorelease];
}

- (void)viewDidUnload {
  [super viewDidUnload];
  self.topTableView = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}

#pragma mark --
#pragma mark UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:NO];
  if (indexPath.section == CCSE_TOP_SECTION || indexPath.section == CCSE_COLORS_SECTION) {
	CCSEiPadColorListViewController* list = [[[CCSEiPadColorListViewController alloc] initWithNibName:@"CCSEiPadColorListViewController" bundle:nil] autorelease];
	[self.navigationController pushViewController:list animated:YES];
  }

}


#pragma mark --
#pragma mark UITableViewDataSource


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  static NSString *CellIdentifier = @"Cell";
  UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  if (cell == nil) {
	cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
	//cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
  }
  if (indexPath.section == CCSE_TOP_SECTION) {
	cell.textLabel.text = @"Logo";
  } else if (indexPath.section == CCSE_COLORS_SECTION) {
	NSArray* array = [[NSUserDefaults standardUserDefaults] objectForKey:CCSE_USER_DAFAULTS_CHOOSE_COLORS];
	cell.textLabel.text = [[array objectAtIndex:indexPath.row] description];
  } else if (indexPath.section == CCSE_CONFIG_SECTION) {
	if (indexPath.row == 0) {
	  cell.textLabel.text = @"Clear";
	} else {
	  cell.textLabel.text = @"Configuration";
	}
  }
  return cell;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  // LOGO , Colors , Apps configuration
  return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  if (section == CCSE_TOP_SECTION) {
	return 1;
  } else if (section == CCSE_COLORS_SECTION) {
	NSArray* array = [[NSUserDefaults standardUserDefaults] objectForKey:CCSE_USER_DAFAULTS_CHOOSE_COLORS];
	return [array count];
  } else if (section == CCSE_CONFIG_SECTION) {
	// cldar , configuration
	return 2;
  }
  return 0;
}



@end
