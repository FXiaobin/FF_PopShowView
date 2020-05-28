//
//  CKPopBottomView.h
//  CKVoice
//
//  Created by chuangku on 2020/5/25.
//  Copyright © 2020 kschuangku. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CKPopBottomView : UIView

- (void)showBottomView:(UIView *)bottomView contentViewHeight:(CGFloat)height;

-(void)dismissBottomViewComplete:(dispatch_block_t)block;


@end

NS_ASSUME_NONNULL_END
