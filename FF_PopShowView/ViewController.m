//
//  ViewController.m
//  BottomPopController
//
//  Created by mac on 2018/11/7.
//  Copyright © 2018 healifeGroup. All rights reserved.
//

#import "ViewController.h"
#import "PopContentView.h"
#import "PopCoverBaseViewController.h"

#import "ShowPopViewController.h"
#import "ShowContentViewController.h"

#import <Masonry.h>

#import "ShowPopViewController/ShowAlertPopViewController.h"

#import "AlertViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn1 = [[UIButton alloc] initWithFrame:CGRectMake(100, 200, 200, 40)];
    btn1.backgroundColor = [UIColor orangeColor];
    btn1.tag = 200;
    [btn1 setTitle:@"模态弹窗控制器1" forState:UIControlStateNormal];
    [btn1 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn1];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 300, 200, 40)];
    btn.backgroundColor = [UIColor orangeColor];
    [btn setTitle:@"模态弹窗控制器2" forState:UIControlStateNormal];
    btn.tag = 201;
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    UIButton *btn2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 200, 40)];
    btn2.backgroundColor = [UIColor orangeColor];
    [btn2 setTitle:@"模态弹窗控制器3" forState:UIControlStateNormal];
    btn2.tag = 202;
    [btn2 addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn2];
    
}

-(void)btnAction:(UIButton *)sender{
    
    NSInteger tag = sender.tag - 200;
    if (tag == 0) {
        PopContentView *contentView = [[PopContentView alloc] init];
        contentView.backgroundColor = [UIColor orangeColor];
        
        PopCoverBaseViewController *vc = [[PopCoverBaseViewController alloc] init];
        vc.contentView = contentView;
        vc.contentViewHeight = 200;
        
        contentView.cancelBtnActionBlock = ^(UIButton * _Nonnull sender) {
            [vc dismissContentView];
        };
        [self presentViewController:vc animated:NO completion:nil];
        
    }else if (tag == 1) {
        
//        ShowPopViewController *show = [ShowPopViewController new];
//        [self presentViewController:show animated:NO completion:nil];
    
        ShowContentViewController *vc = [ShowContentViewController new];
        [self presentViewController:vc animated:NO completion:nil];

        vc.showContentViewCompletedBlock = ^(ShowPopViewController * _Nonnull showPopViewController) {
            NSLog(@"showContentViewCompletedBlock");
        };

        vc.dismissContentViewCompletedBlock = ^(ShowPopViewController * _Nonnull showPopViewController) {
            NSLog(@"dismissContentViewCompletedBlock");
        };
    
        
    }else if (tag == 2) {
        
        //        ShowAlertPopViewController *show = [ShowAlertPopViewController new];
        //        show.showAnimated = YES;
        //        [self presentViewController:show animated:NO completion:nil];
        
        AlertViewController *show = [AlertViewController new];
        //        show.showType = kAlertShowTypeBounceOut;
        //        show.dismissType = kAlertDismissTypeBounceOut;
        
        [self presentViewController:show animated:NO completion:nil];
        
        show.showAlertContentViewCompletedBlock = ^(ShowAlertPopViewController * _Nonnull showPopViewController) {
            NSLog(@"showContentViewCompletedBlock");
        };
        
        show.dismissAlertContentViewCompletedBlock = ^(ShowAlertPopViewController * _Nonnull showPopViewController) {
            NSLog(@"dismissContentViewCompletedBlock");
        };
        
    }

}



@end
