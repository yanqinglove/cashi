//
//  ViewController.m
//  pickerView
//
//  Created by Mac on 17/4/19.
//  Copyright © 2017年 LiuWei. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<UIPickerViewDataSource,UIPickerViewDelegate>
@property (strong,nonatomic) UIPickerView * pickerView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.pickerView;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UIPickerView *)pickerView{
    
    if (!_pickerView) {
        _pickerView = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 200)];
        _pickerView.delegate = self;
        _pickerView.backgroundColor = [UIColor orangeColor];
       _pickerView.showsSelectionIndicator = YES;//
        [self.view addSubview:_pickerView];
    }
    return _pickerView;
}
#pragma mark-pickerView

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 3;
}
- (CGSize)rowSizeForComponent:(NSInteger)component{
    
    return CGSizeMake(80, 80);
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    
    return 100;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 200;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
    if (component ==0) {
        return @"我是第一列";
    }else if (component == 2)
    {
        return @"lili";
    }
    
    return nil;
}
- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component {
    
   
    
    if (component == 1) {
        return  [[NSAttributedString alloc]initWithString:@"我是第二行" attributes:@{NSForegroundColorAttributeName:[UIColor redColor]}];
        
    }
    return nil;
}
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view {
//    
//    if (component ==2) {
//        UIView * view = [[UIView alloc]init];
//        view.backgroundColor = [UIColor redColor];
//        return view;
//        
//    }
//    return nil;
//}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component __TVOS_PROHIBITED{
    
    if (component == 0) {
        [self.pickerView selectRow:0 inComponent:1 animated:YES];
    }
    if (component == 1) {
        [self.pickerView selectRow:0 inComponent:2 animated:YES];
    }
    NSLog(@"row%zd -----component%zd",row,component);
}
// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    NSLog(@"%zd",component);
    switch (component) {
        case 0:
            return 5;
           
        default:
            return 4;
    }
  
}
@end
