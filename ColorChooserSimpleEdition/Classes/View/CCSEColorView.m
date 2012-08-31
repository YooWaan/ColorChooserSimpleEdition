//
// CCSEColorView.m -
//
//
//
// Created by wooyoowaan@gmail.com on Sun Aug 12 18:09:33 2012
// Copyright 2012 by yoowaan. All rights reserved.
//

#import "CCSEColorView.h"

#import <QuartzCore/QuartzCore.h>

/*
 * Renderer
 *
 */
@implementation CCSESaturationColorViewRenderer

@synthesize hue, saturation, brightness, alpha, width, division;

-(id) init {
  if ((self = [super init]) != nil) {
	self.hue = 1.0;
	self.saturation = 0.0;
	self.brightness = 1.0;
	self.alpha = 1.0;
	self.division = 12;
  }
  return self;
}


-(void) render:(CGRect)rect {
  CGContextRef context = UIGraphicsGetCurrentContext();
  CGFloat renderingNumber = 0.0;
  CGFloat incrementNumber = 1.0f / self.division;
  CGFloat separatorWidth = 1.5;

  NSLog(@"div [%d]", self.division);

  for (NSInteger i = 0; i < self.division ; i++, renderingNumber += incrementNumber ) {
	UIColor* color = [UIColor lightGrayColor];
	[color setFill];
	CGContextFillRect(context, CGRectMake(0, self.width * i, rect.size.width , separatorWidth));

	color = [self renderingColorWithNumber:renderingNumber];

	[color setFill];
	//NSLog(@"[%d] %@", i,  NSStringFromCGRect(CGRectMake( self.colorWidth*i, 0, self.colorWidth, rect.size.height)));
	CGContextFillRect(context, CGRectMake( 0, self.width * i + separatorWidth, rect.size.width , self.width-separatorWidth));
  }
}

-(UIColor*) renderingColorWithNumber:(CGFloat)renderingNumber {
  return [UIColor colorWithHue:self.hue
					   saturation:renderingNumber
					   brightness:self.brightness
							alpha:self.alpha];
}


@end


@implementation CCSEHueColorViewRenderer

-(UIColor*) renderingColorWithNumber:(CGFloat)renderingNumber {
  return [UIColor colorWithHue:renderingNumber
					saturation:self.saturation
					brightness:self.brightness
						 alpha:self.alpha];
}

@end



/*
 *
 *
 *
 *
 *
 */
@interface CCSEColorView () {
  id <CCSEColorViewRenderer> colorRenderer;
}

@end


@implementation CCSEColorView

@synthesize type, renderer = colorRenderer, delegate;

-(void) viewInitializeWithFrame:(CGRect)frame {
  self.colorWidth = 42;
  self.colorDivision = 12;

  [self setRenderer:CCSEColorViewRenderingTypeSaturation withNumber:0.5];

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
  if (colorRenderer) {
	[colorRenderer release];
	colorRenderer = nil;
  }
  [super dealloc];
}

-(void) setRenderer:(CCSEColorViewRenderingType)renderingType withNumber:(CGFloat)number {
  if (colorRenderer) {
	[colorRenderer release];
	colorRenderer = nil;
  }
  if (renderingType == CCSEColorViewRenderingTypeSaturation) {
	colorRenderer = [[[[CCSESaturationColorViewRenderer alloc] init] autorelease] retain];
	colorRenderer.hue = number;
  } else if (renderingType == CCSEColorViewRenderingTypeHue) {
	colorRenderer = [[[[CCSEHueColorViewRenderer alloc] init] autorelease] retain];
	colorRenderer.saturation = 0.4f;
  }

  colorRenderer.width = self.colorWidth;
  colorRenderer.division = self.colorDivision;
}

-(CGFloat) colorWidth {
  return self.renderer.width;
}

-(void) setColorWidth:(CGFloat)width {
  self.renderer.width = width;
}

-(NSInteger) colorDivision {
  return self.renderer.division;
}

-(void) setColorDivision:(NSInteger)div {
  self.renderer.division = div;
}

-(CCSEColorViewRenderingType) type {
  return type;
}

-(id <CCSEColorViewRenderer>) renderer {
  return colorRenderer;
}

-(void) drawRect:(CGRect)rect {
  [self.renderer render:rect];
}

@end
