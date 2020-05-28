//
//  CKPopBottomView.m
//  CKVoice
//
//  Created by chuangku on 2020/5/25.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import "CKPopBottomView.h"

@interface CKPopBottomView ()

@property (nonatomic,strong) UIView *maskBg;

@property (nonatomic,strong) UIView *bottomView;

@end

@implementation CKPopBottomView

-(instancetype)init{
    if (self = [super init]) {
        self.frame = [UIScreen mainScreen].bounds;
        
        [self addSubview:self.maskBg];
        
    }
    return self;
}

- (void)showBottomView:(UIView *)bottomView contentViewHeight:(CGFloat)height{
    self.bottomView = bottomView;
    [self addSubview:bottomView];
    
    UIWindow *window = [UIApplication sharedApplication].windows.lastObject;
    [window addSubview:self];
    
    height += kSafeAreaBottomHeight;
    
    bottomView.frame = CGRectMake(0, kHeight, kWidth, height);
    self.maskBg.alpha = 0.0;
    
    [UIView animateWithDuration:0.2 animations:^{
        
        CGRect frame = bottomView.frame;
        frame.origin.y -= height;
        bottomView.frame = frame;
        
        self.maskBg.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        
    }];
   
}

-(void)dismissBottomViewComplete:(dispatch_block_t)block{
    
    [UIView animateWithDuration:0.2 animations:^{
        
        CGRect frame = self.bottomView.frame;
        frame.origin.y = kHeight;
        self.bottomView.frame = frame;
        
        self.maskBg.alpha = 0.0;
        
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
        if (block) {
            block();
        }
        
    }];
}

-(void)dismissPop:(UITapGestureRecognizer *)sender{
    [self dismissBottomViewComplete:^{
        
    }];
}

-(UIView *)maskBg{
    if (_maskBg == nil) {
        _maskBg = [[UIView alloc] initWithFrame:self.bounds];
        _maskBg.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissPop:)];
        [_maskBg addGestureRecognizer:tap];
    }
    return _maskBg;
}

@end
