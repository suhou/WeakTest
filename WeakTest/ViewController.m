//
//  ViewController.m
//  WeakTest
//
//  Created by bifangao on 2019/5/17.
//  Copyright © 2019 bifangao. All rights reserved.
//

#import "ViewController.h"
#import "TestObj.h"
@interface ViewController ()
@property (nonatomic, strong) TestObj *debugObj;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //可以尝试加个按钮方便调试
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.backgroundColor =[UIColor redColor];
    [self.view addSubview:btn];
    
    //正常写代码的时候还是推荐使用self.debugObj这种形式, 这里是为了排除干扰因素于是全部是用ivar的方式
    _debugObj = [TestObj new];
    __weak typeof(self) weakSelf = self;
    _debugObj.block = ^{
        weakSelf.debugObj = nil;
    };
//    [self triggerStrongAction];
}

- (void)triggerStrongAction{
//    [self.debugObj testMethod];//1 不crash
    [_debugObj testMethod];//2 crash
}

- (void)triggerWeakAction{
    __block TestObj *testObj = [TestObj new];
    testObj.block = ^{
        testObj = nil;
    };

    [testObj testMethod];// 3. crash
//    __weak typeof(testObj) weakObj = testObj;
//    [weakObj testMethod]; // 4. 不crash
}

- (void)btnAction:(id)sender{
//    [self triggerStrongAction];// strong语义
    [self triggerWeakAction];// weak语义
}

// _objc_retainAutoreleaseReturnValue
//- (TestObj *)debugObj{
//    return _debugObj;
//}
@end
