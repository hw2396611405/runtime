//
//  UIButton+btn.m
//  runtime
//
//  Created by wanghui on 16/4/7.
//  Copyright © 2016年 wanghui. All rights reserved.
//

#import "UIButton+btn.h"
#import <objc/runtime.h>

const void *key = "key1";
const void *key2 = "key2";
const void *key3 = "key3";


@interface UIButton()
@property(nonatomic,copy)ButtonAction sendAction;

@end


@implementation UIButton (btn)
//自己写setter和getter方法 需要用dynamic修饰
@dynamic index;
@dynamic buttonAction;

-(void)setIndex:(NSIndexPath *)index {
//给谁绑定 Key值 绑定的值 语义修饰
    //给谁绑定 Key值 绑定的值 语义修饰
    objc_setAssociatedObject(self, key, index, OBJC_ASSOCIATION_RETAIN);

}

-(NSIndexPath *)index {
    return objc_getAssociatedObject(self, key);
    
}

-(void)setButtonAction:(ButtonAction)buttionAction {
    [self addTarget:self action:@selector(aaaa) forControlEvents:UIControlEventTouchUpInside];
    objc_setAssociatedObject(self, key2, buttionAction, OBJC_ASSOCIATION_COPY);
    self.sendAction = buttionAction;
}

-(ButtonAction)buttonAction {
    return objc_getAssociatedObject(self, key2);
}

-(void)setSendAction:(ButtonAction)sendAction{
    objc_setAssociatedObject(self, key3, sendAction, OBJC_ASSOCIATION_COPY);
}
-(ButtonAction)sendAction {
    return objc_getAssociatedObject(self, key3);
}

-(void)aaaa {
    NSLog(@"我点击了你");
    if (self.sendAction) {
        //判断block是否被初始化
        self.sendAction([NSIndexPath indexPathForRow:0 inSection:0]);
    }
    
    
}

@end
