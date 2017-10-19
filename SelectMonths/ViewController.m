//
//  ViewController.m
//  SelectMonths
//
//  Created by 周周旗 on 2017/10/19.
//  Copyright © 2017年 ZQ. All rights reserved.
//

#import "ViewController.h"
#import "PaymentChooseDateVC.h"
#import "UIView+BFKit.h"
#import "UIColor+BFKit.h"
#import "UIViewController+MJPopupViewController.h"

@interface ViewController ()
@property (nonatomic, strong)NSString *start_date;
@property (nonatomic, strong)NSString *end_date;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, 200, 100)];
    [btn addTarget:self action:@selector(GotoSelectMonthsVC) forControlEvents:UIControlEventTouchUpInside];
    [btn setBackgroundColor:[UIColor redColor]];
    [btn setTitle:@"点击选择月份" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)GotoSelectMonthsVC{
    PaymentChooseDateVC *payVC = [[PaymentChooseDateVC alloc]initWithNibName:@"PaymentChooseDateVC" bundle:nil];
    [payVC.view createBordersWithColor:[UIColor clearColor] withCornerRadius:10.0f andWidth:0];
    [payVC setBlockMonths:^(NSString *start_date,NSString *end_date){
        self.start_date = start_date;
        self.end_date = end_date;
        [self dismissPopupViewControllerWithanimationType:MJPopupViewAnimationFade];
    }];
    [self presentPopupViewController:payVC animationType:(MJPopupViewAnimationFade)];

}
@end
