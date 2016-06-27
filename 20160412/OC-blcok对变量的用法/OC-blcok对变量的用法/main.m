//
//  main.m
//  OC-blcok对变量的用法
//
//  Created by qingyun on 16/4/12.
//  Copyright © 2016年 QingYun. All rights reserved.
                                                                                                                                                                                                                            

#import <Foundation/Foundation.h>
#import "Person.h"
#import "QYMath.h"

int num=100;
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // 1.局部变量
        int a1=10;
        a1++;
        void (^block1)(void)=^{
//            a1++; //在block内部，局部变量相当于一个常量，不可更改！
            NSLog(@"a1=%d",a1);//！它会保留变量的值
            int a2=11+a1;
            NSLog(@"a2=%d",a2);
        };
        block1();//a1=11,a2=22
        a1++;
        block1();//a1=11,a2=22
        
        //2.静态局部变量
        static int a3=20;
        void (^block2)(void)=^{
            a3++;//代码块内部可以修改值！
            NSLog(@"a3=%d",a3);
            int a2=11+a3;
            NSLog(@"a2=%d",a2);
        };
        block2();//21 32
        a3++;
        block2();//23,34
        
        //3.全局变量
        void (^block3)()=^{
            num++;//此时和静态局部变量作用相同
            NSLog(@"num=%d",num);
            int num1=11+num;
            NSLog(@"num1=%d",num1);
        };
        block3();//101 112
        num++;
        block3();//103 114
        
        //4.类的成员变量
        Person *p1=[Person new];
        p1.age=20;
        void (^block4)(int)=^(int year){
            p1.age+=year;// 可以修改成员变量的属性！
            NSLog(@"---%d",p1.age);
//      /Volumes/qingyun/Desktop/Code/20160412/OC-blcok对变量的用法/OC-blcok对变量的用法.xcodeproj      p1=[Person new];//p为局部变量，在block内部不能改变其指向
        };
        block4(3);
        
        QYMath *m1=[[QYMath alloc] initWithBlock:^int(int a, int b) {
            return a+b;
        }];
        m1.firstNum=10;
        m1.secondNum=20;
        NSLog(@"math=%d",m1.block2(m1.firstNum,m1.secondNum));
        
        QYMath *m2=[[QYMath alloc] init];
        m2.firstNum=80;
        m2.secondNum=10;
        m2.myBlock1();
        
        //	如果在代码块内部需要对局部变量进行赋值操作，可以在局部变量定义时使用__block来修饰
       __block int b1=1000;
        void (^MYblock1)(void)=^{
            b1++; //在block内部，局部变量相当于一个常量，不可更改！
            NSLog(@"b1=%d",b1);//！它会保留变量的值
            int b2=11+b1;
            NSLog(@"b2=%d",b2);
        };
        MYblock1();//1001,1012
        b1++;
        MYblock1();//1003 1014
    }
    return 0;
}
