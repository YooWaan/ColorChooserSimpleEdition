//
//  Ccseiphoneviewcontroller.h
//  ColorChooserSimpleEdition
//
//  Created by developer on 12/04/09.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCSEiPhoneViewController : UIViewController

@property (nonatomic, retain) IBOutlet UITableView* colorTableView;

@property (nonatomic) CGFloat redValue;
@property (nonatomic) CGFloat greenValue;
@property (nonatomic) CGFloat blueValue;
@property (nonatomic) CGFloat alphaValue;

@end
