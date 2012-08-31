//
// CCSEColorView.h -
//
//
//
// Created by wooyoowaan@gmail.com on Sun Aug 12 18:09:15 2012
// Copyright 2012 by yoowaan. All rights reserved.
//


#ifndef __CCSECOLORVIEW_H_
#define __CCSECOLORVIEW_H_

@class CCSEColorView;

typedef enum ccseColorViewRenderingType {
  CCSEColorViewRenderingTypeSaturation = 1,
  CCSEColorViewRenderingTypeHue = 2
} CCSEColorViewRenderingType;


@protocol CCSEColorViewRenderer <NSObject>

@property (nonatomic) CGFloat hue;
@property (nonatomic) CGFloat saturation;
@property (nonatomic) CGFloat brightness;
@property (nonatomic) CGFloat alpha;

@property (nonatomic) CGFloat width;
@property (nonatomic) NSInteger division;

-(void) render:(CGRect)rect;

@end

@interface CCSESaturationColorViewRenderer : NSObject <CCSEColorViewRenderer>

-(UIColor*) renderingColorWithNumber:(CGFloat)renderingNumber;

@end

@interface CCSEHueColorViewRenderer : CCSESaturationColorViewRenderer
@end

@protocol CCSEColorViewDelegate <NSObject>

-(void) colorView:(CCSEColorView*)colorView didColorTappedHueColor:(CGFloat)hueColor;

-(void) colorView:(CCSEColorView*)colorView didColorSelected:(UIColor*)color;

-(void) colorView:(CCSEColorView*)colorView didSwiped:(BOOL)downDirection;

@end

@interface CCSEColorView : UIView

@property (nonatomic, assign) id <CCSEColorViewDelegate> delegate;

@property (nonatomic) CGFloat colorWidth;
@property (nonatomic) NSInteger colorDivision;

@property (nonatomic, readonly) CCSEColorViewRenderingType type;
@property (nonatomic, readonly) id <CCSEColorViewRenderer> renderer;

-(void) viewInitializeWithFrame:(CGRect)frame;

-(void) setRenderer:(CCSEColorViewRenderingType)renderingType withNumber:(CGFloat)number;

@end

#endif
