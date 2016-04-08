//
//  UIButton+btn.h
//  runtime
//
//  Created by wanghui on 16/4/7.
//  Copyright © 2016年 wanghui. All rights reserved.
//

#import <UIKit/UIKit.h>

 typedef void(^ButtonAction)(NSIndexPath *index);


@interface UIButton (btn)
@property(nonatomic,strong)NSIndexPath *index;
@property(nonatomic,copy)ButtonAction buttonAction;
@end
