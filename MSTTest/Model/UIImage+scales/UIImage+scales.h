//
//  UIImage+scales.h
//  MSTTest
//
//  Created by Эдуард Пятницын on 05.07.15.
//  Copyright (c) 2015 EP. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (scales)

+(UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;
+(UIImage *)imageWithImage:(UIImage *)image ByScalingProportionallyToSize:(CGSize)size;

@end
