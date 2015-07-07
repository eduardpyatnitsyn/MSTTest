//
//  PicVC.m
//  MSTTest
//
//  Created by Эдуард Пятницын on 05.07.15.
//  Copyright (c) 2015 EP. All rights reserved.
//

#import "PicVC.h"
#import "UIImage+scales.h"

@interface PicVC ()

@end

@implementation PicVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configure];
}

-(void) configure{
    UIActivityIndicatorView *indicator = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    [indicator startAnimating];
    [indicator setCenter:self.view.center];
    [self.view addSubview:indicator];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0),
                   ^{
                       NSURL *url = [NSURL URLWithString:imageURL];
                       NSData *imgData = [NSData dataWithContentsOfURL:url];
                       UIImage *img = [UIImage imageWithData:imgData];
                       if (img){
                           if (self.shouldScale){
                               img = [UIImage imageWithImage:img ByScalingProportionallyToSize:self.picSize];
                           }else
                               img = [UIImage imageWithImage:img scaledToSize:self.picSize];
                           self.imageView.image = img;
                       }else{
                           UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@""
                                                                           message:@"Невозможно отобразить картинку"
                                                                          delegate:nil
                                                                 cancelButtonTitle:@"Ok"
                                                                 otherButtonTitles:nil];
                           [alert show];
                       }
                       [indicator removeFromSuperview];
                   });
}

@end
