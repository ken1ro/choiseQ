//
//  CustomSegue.m
//  choiseQ
//
//  Created by Ken Yagura on 13/06/15.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import "CustomSegue.h"

@implementation CustomSegue


- (void)perform
{
    // 遷移元と遷移先のViewControllerを取得
    UIViewController *srcView = self.sourceViewController;
    UIViewController *dstView = self.destinationViewController;
    // ViewControllerを遷移
    [srcView presentModalViewController:dstView animated:NO];
    // アニメーションブロック
    dstView.view.alpha = 0.0f;
    [srcView presentModalViewController:dstView animated:NO];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.5];
    dstView.view.alpha = 1.0f;
    [UIView commitAnimations];
}
@end
