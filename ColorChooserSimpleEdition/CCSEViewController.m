//
//  CCSEViewController.m
//  ColorChooserSimpleEdition
//
//  Created by developer on 12/04/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "CCSEViewController.h"

#import <QuartzCore/QuartzCore.h>

@interface CCSEViewController ()

-(void) updateColor:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue withAlpha:(CGFloat)alpha;

-(void) updateColorLabel:(UILabel*)label withColorText:(NSString*)text andBackgroundColor:(UIColor*)bgColor;

@end

@implementation CCSEViewController

@synthesize redSlider, blueSlider, greenSlider, alphaSlider, redLabel, greenLabel, blueLabel, alphaLabel;


-(void) dealloc {
    self.redSlider = nil;
    self.redLabel = nil;
    self.greenSlider = nil;
    self.greenLabel = nil;
    self.blueSlider = nil;
    self.blueLabel = nil;
    self.alphaSlider = nil;
    self.alphaLabel = nil;
    [super dealloc];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    CGFloat radius = 4;
    self.redLabel.layer.cornerRadius = radius;
    self.greenLabel.layer.cornerRadius = radius;
    self.blueLabel.layer.cornerRadius = radius;
    self.alphaLabel.layer.cornerRadius = radius;

    CGFloat redNum = self.redSlider.value;
    CGFloat greenNum = self.greenSlider.value;
    CGFloat blueNum = self.blueSlider.value;
    CGFloat alphaNum = self.alphaSlider.value;
    
    [self updateColor:redNum withGreen:greenNum withBlue:blueNum withAlpha:alphaNum];

    NSLog(@"view [%@]", self.view);
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

-(void) updateColor:(CGFloat)red withGreen:(CGFloat)green withBlue:(CGFloat)blue withAlpha:(CGFloat)alpha {

    NSString* format = @"%1.4f";
    
    [self updateColorLabel:self.redLabel withColorText:[NSString stringWithFormat:format, red]
        andBackgroundColor:[UIColor colorWithRed:red green:0 blue:0 alpha:1.0]];
    
    [self updateColorLabel:self.greenLabel withColorText:[NSString stringWithFormat:format, green]
        andBackgroundColor:[UIColor colorWithRed:0 green:green blue:0 alpha:1.0]];
    
    [self updateColorLabel:self.blueLabel withColorText:[NSString stringWithFormat:format, blue]
        andBackgroundColor:[UIColor colorWithRed:0 green:0 blue:blue alpha:1.0]];
        
    self.alphaLabel.alpha =  alpha;
    
    self.view.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}


-(void) updateColorLabel:(UILabel*)label withColorText:(NSString*)text andBackgroundColor:(UIColor*)bgColor {
    label.text = text;
    CGFloat red, green, blue;
    [bgColor getRed:&red green:&green blue:&blue alpha:NULL];
    label.textColor = [UIColor colorWithRed:(1.0 - red) green:(1.0 - green) blue:(1.0 - blue) alpha:1.0];
    label.backgroundColor = bgColor;
}

-(IBAction) redSliderChanged:(UISlider*)slider {
    [self updateColor:self.redSlider.value withGreen:self.greenSlider.value withBlue:self.blueSlider.value withAlpha:self.alphaSlider.value];
}

-(IBAction) greenSliderChanged:(UISlider*)slider {
    [self updateColor:self.redSlider.value withGreen:self.greenSlider.value withBlue:self.blueSlider.value withAlpha:self.alphaSlider.value];
}

-(IBAction) blueSliderChanged:(UISlider*)slider {
    [self updateColor:self.redSlider.value withGreen:self.greenSlider.value withBlue:self.blueSlider.value withAlpha:self.alphaSlider.value];
}

-(IBAction) alphaSliderChanged:(UISlider*)slider{
    [self updateColor:self.redSlider.value withGreen:self.greenSlider.value withBlue:self.blueSlider.value withAlpha:self.alphaSlider.value];
}


@end
