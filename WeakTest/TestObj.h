//
//  TestObj.h
//  WeakTest
//
//  Created by bifangao on 2019/5/21.
//  Copyright © 2019 bifangao. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TestObj : NSObject
@property (nonatomic, copy) void(^block)(void);
- (void)testMethod;
@end

NS_ASSUME_NONNULL_END
