//
// CCSEBasicViewController.m -
//
//
//
// Created by wooyoowaan@gmail.com on Tue Aug 14 16:04:28 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "CCSEBasicViewController.h"

#import <iAd/iAd.h>

@implementation CCSEBasicViewController

-(void) setupADBanner {
  CGFloat height= 32;
  CGFloat width = self.view.frame.size.width / 4;
  self.navigationItem.titleView = [[[ADBannerView alloc] initWithFrame:CGRectMake(0,0, width, height)] autorelease];
}

@end
