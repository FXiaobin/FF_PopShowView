//
//  AlertViewController.m
//  BottomPopController
//
//  Created by mac on 2019/8/27.
//  Copyright © 2019 healifeGroup. All rights reserved.
//

#import "AlertViewController.h"
#import "PopContentView.h"

#import <Masonry.h>

@interface AlertViewController ()

@end

@implementation AlertViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ///1. 设置要显示视图的尺寸 及 动画类型
    self.alertViewSize = CGSizeMake(260, 300);
    self.showType = kAlertShowTypeSystem;
    self.dismissType = kAlertDismissTypeSystem;
    
    ///2.将要显示的自定义视图添加到承载视图上
    PopContentView *contentView = [[PopContentView alloc] init];
    contentView.backgroundColor = [UIColor purpleColor];
    [self.containerView addSubview:contentView];
    
    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView).insets(UIEdgeInsetsMake(0, 0, 34, 0));
    }];
    
    
    contentView.cancelBtnActionBlock = ^(UIButton * _Nonnull sender) {
        [self dismissAlertContentView];
    };

}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
