//
//  PaymentChooseDateVC.m
//  NeighBour
//
//  Created by 周周旗 on 2017/10/18.
//  Copyright © 2017年 周旗. All rights reserved.
//

#import "PaymentChooseDateVC.h"
#import "UIView+BFKit.h"
#import "UIColor+BFKit.h"
#define MCOLOR_FFFFFF               [UIColor colorWithHexString:@"#ffffff"]      //
#define MCOLOR_0090EC               [UIColor colorWithHexString:@"#0090EC"]
#define MCOLOR_CCCCCC               [UIColor colorWithHexString:@"#CCCCCC"]
@interface PaymentChooseDateVC ()
{
    NSInteger startIndex;
    NSInteger endIndex;
}
@property (nonatomic, assign)BOOL isSelected;
@property (nonatomic, strong)NSMutableArray *btnArr;
@property (nonatomic, strong)NSString *start_date;
@property (nonatomic, strong)NSString *end_date;

@end

@implementation PaymentChooseDateVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubViews];
}

- (void)initSubViews{
    [self.view setBackgroundColor:MCOLOR_FFFFFF];
    [_view_BG1 createBordersWithColor:[UIColor clearColor] withCornerRadius:10.0f andWidth:0];
    [_view_BG1 setBackgroundColor:MCOLOR_0090EC];
    [_lab_Title setTextColor:MCOLOR_FFFFFF];
    [_lab_Title setFont:[UIFont systemFontOfSize:18.0f]];
    [_lab_Title setFont:[UIFont fontWithName:@"Helvetica-Bold" size:15.0f]];
    [_btn_Cancel createBordersWithColor:MCOLOR_0090EC withCornerRadius:1.0f andWidth:1.0f];
    [_btn_Sure createBordersWithColor:MCOLOR_0090EC withCornerRadius:1.0f andWidth:1.0f];
    [_btn_Sure setBackgroundColor:MCOLOR_0090EC];
    [_btn_Cancel setBackgroundColor:MCOLOR_FFFFFF];
    [_btn_Cancel setTitleColor:MCOLOR_0090EC forState:UIControlStateNormal];
    [_btn_Sure setTitleColor:MCOLOR_FFFFFF forState:UIControlStateNormal];
    _btnArr = [NSMutableArray arrayWithObjects:_btn1,_btn2,_btn3,_btn4,_btn5,_btn6,_btn7,_btn8,_btn9,_btn10,_btn11,_btn12, nil];
    _lab_Year.text = [self getCurrentYear];
    [self setBtnBordersWidth];
}

- (void)setBtnBordersWidth{
    for (UIButton *btn in _btnArr) {
        [btn createBordersWithColor:MCOLOR_CCCCCC withCornerRadius:1.0f andWidth:0.5f];
        [btn setBackgroundColor:MCOLOR_FFFFFF];
    }
}

- (NSString *)getCurrentYear{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateStyle:NSDateFormatterMediumStyle];
    [formatter setTimeStyle:NSDateFormatterShortStyle];
    [formatter setDateFormat:@"YYYY"];
    NSString *currentYear = [formatter stringFromDate:date];
    return currentYear;
}

#pragma mark--点击按钮
- (IBAction)ActionYearUpOrDown:(UIButton *)sender {
    if (sender.tag == 201) {
        _lab_Year.text = [NSString stringWithFormat:@"%d",[_lab_Year.text intValue] - 1];
    }else{
        _lab_Year.text = [NSString stringWithFormat:@"%d",[_lab_Year.text intValue] + 1];
    }
    [self setBtnBordersWidth];
    startIndex = endIndex = 0;
}

- (IBAction)ActionSelectMonth:(UIButton *)sender {
    
    if (sender.selected == YES && _isSelected) {
        endIndex = sender.tag - 100;
    }else if(sender.selected == NO && !_isSelected){
        startIndex = sender.tag - 100;
    }else if (sender.selected == NO && _isSelected){
        if (sender.tag - 100 < startIndex && endIndex != 0) {
            startIndex = endIndex;
        }
        endIndex = sender.tag - 100;
    }
    if (!_isSelected) {
        _isSelected = YES;
    }
    [self setBtnWithColor:sender];
}

- (IBAction)ActionEnter:(id)sender {
    if (self.BlockMonths) {
        self.BlockMonths(_start_date, _end_date);
    }
}

#pragma mark--点击选择月份逻辑
- (void)setBtnWithColor:(UIButton *)sender{
    [self compareA_With_B];
    [self setBtnBordersWidth];
    if (startIndex && endIndex == 0) {
        UIButton *btn = _btnArr[startIndex-1];
        [btn setBackgroundColor:MCOLOR_0090EC];
        btn.selected = YES;
    }else if (startIndex == endIndex && sender.selected == YES){
        UIButton *btn = _btnArr[endIndex-1];
        [btn setBackgroundColor:MCOLOR_FFFFFF];
        endIndex = startIndex = 0;
        _isSelected = NO;
        for (UIButton *btn in _btnArr) {
            btn.selected = NO;
        }
    }else if (startIndex <= endIndex){
        for (int i = (int)startIndex-1; i<=(int)endIndex-1; i++) {
            UIButton *btn = _btnArr[i];
            [btn setBackgroundColor:MCOLOR_0090EC];
            btn.selected = YES;
        }
    }
}

- (void)compareA_With_B{
    if (startIndex == 0 || endIndex == 0) {
        
    }else if (startIndex >= endIndex) {
        NSInteger temp;
        temp = startIndex;
        startIndex = endIndex;
        endIndex = temp;
    }
}

@end
