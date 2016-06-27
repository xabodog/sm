//
//  QYMath.m
//  OC-blcok对变量的用法
//
//  Created by qingyun on 16/4/12.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import "QYMath.h"

@implementation QYMath
-(instancetype)initWithBlock:(myBlock2)blk
{
    if (self=[super init])
    {
        _block2=blk;
    }
    return self;
}
-(instancetype)init
{
    if (self=[super init])
    {
        _myBlock1=^int(){
            NSLog(@"11111111111");
            return _firstNum+_secondNum;
        };
    }
    return self;
}
//-(void)setFirstNum:(int)firstNum
//-(void)setBlock2:(myBlock2)block2
//{
//    
//}
//-(void)setMyBlock1:(int (^)(void))myBlock1
//{
//    
//}
@end
