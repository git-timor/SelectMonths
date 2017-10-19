//
//  PaymentChooseDateVC.h
//  NeighBour
//
//  Created by 周周旗 on 2017/10/18.
//  Copyright © 2017年 周旗. All rights reserved.
//


#import <UIKit/UIKit.h>


@interface PaymentChooseDateVC : UIViewController
@property (nonatomic, copy, readwrite)void (^BlockMonths)(NSString *start_date,NSString *end_date);

@property (weak, nonatomic) IBOutlet UIView *view_BG1;
@property (weak, nonatomic) IBOutlet UIView *view_BG2;
@property (weak, nonatomic) IBOutlet UILabel *lab_Title;
@property (weak, nonatomic) IBOutlet UILabel *lab_Year;
@property (weak, nonatomic) IBOutlet UIButton *btn_Cancel;
@property (weak, nonatomic) IBOutlet UIButton *btn_Sure;
@property (weak, nonatomic) IBOutlet UIButton *btn_DownYear;
@property (weak, nonatomic) IBOutlet UIButton *btn_UpYear;
@property (weak, nonatomic) IBOutlet UIButton *btn1;
@property (weak, nonatomic) IBOutlet UIButton *btn2;
@property (weak, nonatomic) IBOutlet UIButton *btn3;
@property (weak, nonatomic) IBOutlet UIButton *btn4;
@property (weak, nonatomic) IBOutlet UIButton *btn5;
@property (weak, nonatomic) IBOutlet UIButton *btn6;
@property (weak, nonatomic) IBOutlet UIButton *btn7;
@property (weak, nonatomic) IBOutlet UIButton *btn8;
@property (weak, nonatomic) IBOutlet UIButton *btn9;
@property (weak, nonatomic) IBOutlet UIButton *btn10;
@property (weak, nonatomic) IBOutlet UIButton *btn11;
@property (weak, nonatomic) IBOutlet UIButton *btn12;
@end
