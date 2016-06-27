//
//  main.m
//  OC-Block块
//
//  Created by qingyun on 16/4/12.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>
//无参数无返回值的block块
void (^block1)(void);
void (^block2)()=^
{
    NSLog(@">无参数无返回值的block...");
};//Block中，返回值和参数如果为void是可以省略的
//无返回值有参数的block
void (^block3)(int,int)=^(int a,int b)
{
    NSLog(@">>带参数无返回值的block  %d",a+b);
};
//有返回值有参数的block
int (^block4)(int,int)=^int(int a,int b)
{
    NSLog(@">>>有返回值有参数的block...");
    return a+b;
};
//在C的函数中使用block
void test1(int x,int y)
{
    int (^block5)(int,int)=^int(int a,int b)
    {
        return a+b;
    };
    NSLog(@">>>>block的返回值==>%d",block5(x,y));
}
//给block取别名
typedef int (^myBlock) (int,int);//myBlock是一个block类型
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //^脱字符，表示blcok的标志！
        //调用
        block1();
        block2();
        block3(12,21);
        NSLog(@">>>>>%d",block4(21,34));
        
        test1(100,99);
        
        //给blcok取别名
//        myBlock result=^int(int a,int b)
//        {
//            block1();
//            return a*b;
//        };
//        //使用
//        NSLog(@">>>>>>typedef==>%d",result(88,11));
        
        //内联使用：将blcok当做参数使用
        NSArray *myArr=@[@100,@78,@86,@88,@67];
        NSLog(@"排序前:%@",myArr);
        NSArray *newArr=[myArr sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
            return [obj1 compare:obj2];//默认是升序
            //            return [obj2 compare:obj1];//默认为降序
        }];
        NSLog(@"排序后:%@",newArr);
    }
    return 0;
}
//实现
void (^block1)(void)=^void(void)
{
    NSLog(@"这是个无参数无返回值的Block...");
};//注意：block是一个代码块，需要分号结束！
