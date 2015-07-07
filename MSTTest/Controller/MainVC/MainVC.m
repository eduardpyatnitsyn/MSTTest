//
//  MainVC.m
//  MSTTest
//
//  Created by Эдуард Пятницын on 05.07.15.
//  Copyright (c) 2015 EP. All rights reserved.
//

#import "MainVC.h"
#import "PicVC.h"

@interface MainVC (){
    CGSize picResolution;
}

@end

static char kResBtnTag = 1;

@implementation MainVC

-(void)viewDidLoad{
    [super viewDidLoad];
    self.loadImageResBtn.titleLabel.numberOfLines = 2;
    self.loadImageScaleBtn.titleLabel.numberOfLines = 2;
}

- (IBAction)factorialFieldChanged:(UITextField *)sender {
    self.factorialField.text = [self cleanStringForInt:self.factorialField.text];
}

- (IBAction)factorialAction:(UIButton *)sender {
    NSInteger value = [self.factorialField.text integerValue];
    if ([self.factorialField.text isEqualToString:@""]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Введите значение в поле факториал" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        return;
    }
    if(value > 22){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Результат слишком большой" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles: nil];
        [alert show];
        return;
    }
    self.resultField.text = [NSString stringWithFormat:@"%llu",[self factorial: value]];
    self.loadImageResBtn.enabled = YES;
    self.loadImageScaleBtn.enabled = YES;
}

-(NSString *) cleanStringForInt:(NSString *)str{
    return [[str componentsSeparatedByCharactersInSet:[[NSCharacterSet characterSetWithCharactersInString:@"0123456789"] invertedSet]] componentsJoinedByString:@""];
}

-(unsigned long long) factorial:(unsigned long long) n{
    if (n == 0) return 1;
    return n * [self factorial:(n-1)];
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    return YES;
}

-(BOOL) isResolutionFieldOk{
    //рассматриваю только лат. x
    NSArray *res = [[self.resolutionField.text lowercaseString] componentsSeparatedByString:@"x"];
    if (res.count != 2) return NO;
    NSString *leftStr = [res firstObject];
    NSString *rightStr = [res lastObject];
    NSLog(@"res[0]= %lf res[1] = %lf",[[res firstObject] floatValue], [[res lastObject] floatValue]);
    if ((leftStr.length == 0) || (rightStr.length == 0)) return NO;
    picResolution.width = [leftStr floatValue];
    picResolution.height = [rightStr floatValue];
    return YES;
}

- (IBAction)loadImageBtnAction:(UIButton *)sender {
    if (![self isResolutionFieldOk]){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"" message:@"Недопустимое значение в поле разрешение\n Введите данные в формате число x число" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
    }else{
        [self performSegueWithIdentifier:@"toPicVC" sender:sender];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton *)sender{
    PicVC *controller = [segue destinationViewController];
    controller.picSize = picResolution;
    controller.shouldScale = sender.tag == kResBtnTag ? NO : YES;
    
}
@end
