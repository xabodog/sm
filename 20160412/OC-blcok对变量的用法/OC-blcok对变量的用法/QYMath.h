//
//  QYMath.h
//  OC-blcok对变量的用法
//
//  Created by qingyun on 16/4/12.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef int(^myBlock2)(int,int);
@interface QYMath : NSObject
@property(nonatomic,assign)int firstNum,secondNum;
@property(nonatomic,copy)int (^myBlock1)(void);//当做成员变量

@property(nonatomic,copy)myBlock2 block2;//成员变量
-(instancetype)initWithBlock:(myBlock2)blk;//把block当做参数
@end
