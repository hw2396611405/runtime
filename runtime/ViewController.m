//
//  ViewController.m
//  runtime
//
//  Created by wanghui on 16/4/7.
//  Copyright © 2016年 wanghui. All rights reserved.
//

#import "ViewController.h"
#import "UIButton+btn.h"
#import <objc/runtime.h>
#import "TableViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    imageView.image = image;
    [self.view addSubview:imageView];
    
    
    
    UIImageView *imageView1 = [[UIImageView alloc]initWithFrame:CGRectMake(100, 400, 100, 100)];
    imageView1.image = image;
    [self.view addSubview:imageView1];
    
    
    UIButton  *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.index = [NSIndexPath indexPathForRow:0 inSection:0];
    button.buttonAction = ^(NSIndexPath *index){
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        TableViewController *TableVC = [storyboard instantiateViewControllerWithIdentifier:@"123"];
        [self presentViewController:TableVC animated:YES completion:nil];
        
       // [self.navigationController pushViewController:TableVC animated:YES];
        
        
        
        NSLog(@"你是怎么实现的");
    };
    button.frame = CGRectMake(220, 100, 100, 100);
    button.backgroundColor = [UIColor redColor];
    [self.view addSubview:button];
    
    UIButton  *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.index = [NSIndexPath indexPathForRow:1 inSection:1];
    button1.buttonAction = ^(NSIndexPath *index){
        NSLog(@"你是怎么实现的111");
    };
    button1.frame = CGRectMake(220, 300, 100, 100);
    button1.backgroundColor = [UIColor redColor];
    [self.view addSubview:button1];
    
    
    
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
