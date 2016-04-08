//
//  UIImage+imageName.m
//  runtime
//
//  Created by wanghui on 16/4/7.
//  Copyright © 2016年 wanghui. All rights reserved.
//

#import "UIImage+imageName.h"
#import <objc/runtime.h>

@implementation UIImage (imageName)

//加载分类到内存的时候调用

+(void)load {
    // 获取到imageName方法的地址
    Method imageName = class_getClassMethod(self, @selector(imageNamed:));
    // 获取到imageWithName方法的地址
    Method imageWithName = class_getClassMethod(self, @selector(imageWithName:));
    // 交换两个方法的地址
    method_exchangeImplementations(imageName, imageWithName);
}


//不能在分类中重写系统方法imageNamed，因为会把系统的功能给覆盖掉，而且分类中不能调用super.
+(instancetype)imageWithName:(NSString *)name {
    UIImage *image = [UIImage imageWithName:@"2.jpg"];
    if (image == nil) {
        NSLog(@"你的图片地址为空");
    }
    return image;
}

@end
