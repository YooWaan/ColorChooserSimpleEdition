//
// CCSEColorListView.h -
//
//
//
// Created by wooyoowaan@gmail.com on Sun Aug 12 17:33:24 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __CCSECOLORLISTVIEW_H_
#define __CCSECOLORLISTVIEW_H_

#import "CCSEColorView.h"

@interface CCSEColorListView : UIScrollView

//@property (nonatomic, readonly) UIColor* selectedColor;
@property (nonatomic, readonly) CCSEColorView* colorView;

@property (nonatomic) CGFloat colorWidth;
@property (nonatomic) NSInteger colorDivision;

-(void) viewInitializeWithFrame:(CGRect)frame;

@end

#endif
