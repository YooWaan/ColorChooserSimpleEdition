//
// CCSEiPadColorListViewController.m -
//
//
//
// Created by wooyoowaan@gmail.com on Sun Aug 12 19:45:11 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "CCSEiPadColorListViewController.h"

@implementation CCSEiPadColorListViewController

@synthesize topColorListView, bottomColorListView;

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)viewDidUnload {
  [super viewDidUnload];
  self.topColorListView = nil;
  self.bottomColorListView = nil;
}

-(void) viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  self.topColorListView.colorWidth = 74;
  [self.bottomColorListView.colorView setRenderer:CCSEColorViewRenderingTypeHue withNumber:0.5];
  self.bottomColorListView.colorWidth = 74;
  self.bottomColorListView.colorDivision = 24;
  [self.topColorListView setNeedsLayout];
  [self.bottomColorListView setNeedsLayout];

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return YES;
}



#pragma mark --
#pragma mark CCSEColorViewDelegate

-(void) colorView:(CCSEColorView*)colorView didColorTappedHueColor:(CGFloat)hueColor {}

-(void) colorView:(CCSEColorView*)colorView didColorSelected:(UIColor*)color {}

-(void) colorView:(CCSEColorView*)colorView didSwiped:(BOOL)downDirection {}


@end
