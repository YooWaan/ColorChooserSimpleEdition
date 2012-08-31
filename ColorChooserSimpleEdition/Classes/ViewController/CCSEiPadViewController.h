//
// CCSEiPadViewController.h -
//
//
//
// Created by wooyoowaan@gmail.com on Sun Aug 12 19:09:42 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __CCSEIPADVIEWCONTROLLER_H_
#define __CCSEIPADVIEWCONTROLLER_H_

#import "CCSEBasicViewController.h"

@interface CCSEiPadViewController : CCSEBasicViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, retain) IBOutlet UITableView* topTableView;

@end

#endif
