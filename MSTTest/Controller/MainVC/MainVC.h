//
//  MainVC.h
//  MSTTest
//
//  Created by Эдуард Пятницын on 05.07.15.
//  Copyright (c) 2015 EP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainVC : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *factorialField;
@property (weak, nonatomic) IBOutlet UITextField *resultField;
@property (weak, nonatomic) IBOutlet UIButton *factorialResultBtn;
@property (weak, nonatomic) IBOutlet UITextField *resolutionField;
@property (weak, nonatomic) IBOutlet UIButton *loadImageResBtn;
@property (weak, nonatomic) IBOutlet UIButton *loadImageScaleBtn;

-(unsigned long long) factorial:(unsigned long long) n;
-(BOOL) isResolutionFieldOk;
@end
