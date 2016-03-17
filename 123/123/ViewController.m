//
//  ViewController.m
//  123
//
//  Created by lanou3g on 16/3/3.
//  Copyright © 2016年 Z_xd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSDictionary * dic = @{@"1" : @"q"};
    
    NSArray * Arr = [dic allKeys];
    
    NSLog(@"%@", Arr);
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
    });

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    // 1、invocationOperation的异步方法
//    [self invocationOperationAsyncDemo];
    // 2、invocationOperation的同步方法
    [self invocationOperationsyncDemo1];
    [self invocationOperationsyncDemo2];
    // 同步有两种方法
    
     // 1、blockOperation的异步方法
    [self blockOperationAsyncDemo];
    
    

    
}

- (void)blockOperationAsyncDemo{
    // 1、创建任务
    NSBlockOperation * blockOperation = [NSBlockOperation blockOperationWithBlock:^{
        NSLog(@"%@_____blockOperation",[NSThread currentThread]);
    }];
    // 2、创建队列
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    
    // 3、将任务添加到队列中
    [queue addOperation: blockOperation];
    
}
- (void)invocationOperationsyncDemo2{
    // 任务
    NSInvocationOperation * InvocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationDemo:) object:@"Invocation"];
    /*一个类.h文件中可以有多个类的声明*/
       // 2将任务添加到可调度线程池中
       [InvocationOperation start];
    
}


- (void)invocationOperationsyncDemo1{
    // 任务
    NSInvocationOperation * InvocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationDemo:) object:@"Invocation"];
    /*一个类.h文件中可以有多个类的声明*/
    // 队列-得到的是朱队列3
    NSOperationQueue * mainQueue = [NSOperationQueue mainQueue];
    
    // 将任务添加到并发队列中
    [mainQueue addOperation:InvocationOperation];

}


- (void)invocationOperationAsyncDemo{
    
    // 任务
    NSInvocationOperation * InvocationOperation = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(invocationDemo:) object:@"Invocation"];
    
    NSOperationQueue * queue = [[NSOperationQueue alloc] init];
    
    // 将任务添加到并发队列中
    [queue addOperation:InvocationOperation];
    

}

- (void)invocationDemo:(id)param
{
    NSLog(@"%@",[NSThread currentThread]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
