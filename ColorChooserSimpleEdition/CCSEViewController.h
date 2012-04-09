//
//  CCSEViewController.h
//  ColorChooserSimpleEdition
//
//  Created by developer on 12/04/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCSEViewController : UIViewController

@property (nonatomic,retain) IBOutlet UISlider* redSlider;
@property (nonatomic,retain) IBOutlet UISlider* greenSlider;
@property (nonatomic,retain) IBOutlet UISlider* blueSlider;
@property (nonatomic,retain) IBOutlet UISlider* alphaSlider;

@property (nonatomic,retain) IBOutlet UILabel* redLabel;
@property (nonatomic,retain) IBOutlet UILabel* greenLabel;
@property (nonatomic,retain) IBOutlet UILabel* blueLabel;
@property (nonatomic,retain) IBOutlet UILabel* alphaLabel;


-(IBAction) redSliderChanged:(UISlider*)slider;
-(IBAction) greenSliderChanged:(UISlider*)slider;
-(IBAction) blueSliderChanged:(UISlider*)slider;
-(IBAction) alphaSliderChanged:(UISlider*)slider;

@end
