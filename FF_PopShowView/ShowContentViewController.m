//
//  ShowContentViewController.m
//  BottomPopController
//
//  Created by mac on 2019/8/27.
//  Copyright © 2019 healifeGroup. All rights reserved.
//

#import "ShowContentViewController.h"
#import <Masonry.h>
#import "PopContentView.h"

@interface ShowContentViewController ()

@end

@implementation ShowContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    ///1.根据需要修改承载视图的尺寸
    //self.containerView.frame = CGRectMake(0, [UIScreen mainScreen].bounds.size.height, [UIScreen mainScreen].bounds.size.width, 300);
    self.directionType = kShowPopContentViewDirectionTypeLeft;
    self.containerViewHeight = 300.0;
    self.containerViewWidth = 260.0;

    //self.maskBgColor = [[UIColor redColor] colorWithAlphaComponent:0.3];

    ///2.将要显示的自定义视图添加到承载视图上
    PopContentView *contentView = [[PopContentView alloc] init];
    contentView.backgroundColor = [UIColor purpleColor];
    [self.containerView addSubview:contentView];

    [contentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.containerView).insets(UIEdgeInsetsMake(0, 0, 34, 0));
    }];


    contentView.cancelBtnActionBlock = ^(UIButton * _Nonnull sender) {
        [self dismissContentViewWithAnimation:self.showAnimated];
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
