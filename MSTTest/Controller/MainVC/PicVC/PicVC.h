//
//  PicVC.h
//  MSTTest
//
//  Created by Эдуард Пятницын on 05.07.15.
//  Copyright (c) 2015 EP. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *imageURL = @"http://cdn.oboi7.com/cd83c2ca6269fe5b6607c68c3dfb9b73064e1fdb/zakat-oblaka-pejzazhi.jpg";

@interface PicVC : UIViewController

@property (nonatomic) CGSize picSize;
@property (nonatomic) BOOL shouldScale;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
