//
//  TestObj.m
//  WeakTest
//
//  Created by bifangao on 2019/5/21.
//  Copyright © 2019 bifangao. All rights reserved.
//

#import "TestObj.h"

@implementation TestObj
- (void)dealloc{
    NSLog(@"obj dealloc");
}

- (void)testMethod{
    
    if (self.block) {
        self.block();
    }
    NSLog(@"%@", self);
}
@end
