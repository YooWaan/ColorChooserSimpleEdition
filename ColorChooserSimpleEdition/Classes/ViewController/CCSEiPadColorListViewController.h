//
// CCSEiPadColorListViewController.h -
//
//
//
// Created by wooyoowaan@gmail.com on Sun Aug 12 19:44:32 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __CCSEIPADCOLORLISTVIEWCONTROLLER_H_
#define __CCSEIPADCOLORLISTVIEWCONTROLLER_H_

#import "CCSEColorView.h"
#import "CCSEColorListView.h"

@interface CCSEiPadColorListViewController : UIViewController <CCSEColorViewDelegate>

@property (nonatomic, retain) IBOutlet CCSEColorListView* topColorListView;
@property (nonatomic, retain) IBOutlet CCSEColorListView* bottomColorListView;

@end

#endif
