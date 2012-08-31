//
// CCSEColorListView.m -
//
//
//
// Created by wooyoowaan@gmail.com on Sun Aug 12 17:33:55 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "CCSEColorListView.h"

#import "CCSEColorView.h"

#import <QuartzCore/QuartzCore.h>

@interface CCSEColorListView ()

-(CGSize) sizeOfColorView:(CGFloat) width division:(NSInteger)division;
-(void) changeColorViewFrame:(CGSize)size;

@end

@implementation CCSEColorListView

@synthesize colorView, colorWidth, colorDivision;

-(void) viewInitializeWithFrame:(CGRect)frame {
  CCSEColorView* view = [[[CCSEColorView alloc] initWithFrame:CGRectZero] autorelease];
  [self addSubview:view];
  colorView = view;
  colorView.colorWidth = 54;
  self.colorDivision = 24;

  /*
  self.layer.borderColor = [UIColor redColor].CGColor;
  self.layer.borderWidth = 2.0;
  */
}

-(id) initWithFrame:(CGRect)frame {
  if ((self = [super initWithFrame:frame]) != nil) {
	[self viewInitializeWithFrame:frame];
  }
  return self;
}


-(id)initWithCoder:(NSCoder*)coder {
  if ((self = [super initWithCoder:coder]) != nil) {
	[self viewInitializeWithFrame:self.frame];
  }
  return self;
}

-(void) dealloc {
  colorView = nil;
  [super dealloc];
}

-(void) layoutSubviews {
  [self changeColorViewFrame:[self sizeOfColorView:self.colorWidth division:self.colorDivision]];
}


#pragma mark --
#pragma mark PROPERTY


-(NSInteger) colorDivision {
  return self.colorView.colorDivision;
}

-(void) setColorDivision:(NSInteger)division {
  self.colorView.colorDivision = division;
  [self changeColorViewFrame:[self sizeOfColorView:self.colorWidth division:division]];
}

-(CGFloat) colorWidth {
  return self.colorView.colorWidth;
}

-(void) setColorWidth:(CGFloat)width {
  self.colorView.colorWidth = width;
  //NSLog(@"view ==> %@", NSStringFromCGRect(self.colorView.frame));
  [self changeColorViewFrame:[self sizeOfColorView:width division:self.colorDivision]];
}

#pragma mark --
#pragma mark PRIVATE

-(CGSize) sizeOfColorView:(CGFloat) width division:(NSInteger)division {
  /*
  if (self.colorView.landScape) {
	return CGSizeMake(width * division, self.frame.size.height);
  }
  NSLog(@"width [%f]", self.frame.size.width);
  */

  return CGSizeMake(self.frame.size.width, width * division);
}

-(void) changeColorViewFrame:(CGSize)size {
  self.colorView.frame = CGRectMake(0, 0, size.width, size.height);
  self.contentSize = size;
}

@end
