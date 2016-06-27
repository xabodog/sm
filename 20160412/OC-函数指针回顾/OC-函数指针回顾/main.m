//
//  main.m
//  OC-函数指针回顾
//
//  Created by qingyun on 16/4/12.
//  Copyright © 2016年 QingYun. All rights reserved.
//

#import <Foundation/Foundation.h>
//函数
void func1(void);
void func2(int ,int );
int func3(int ,int );
//指针函数:返回值为指针的函数
int * func4(int ,int);

int (*funcPtr)(int,int);//函数指针：指向函数类型的指针
struct Student{
    char* name;
    int age;
};
typedef struct
{
    char*name;
    int age;
}Student;
typedef struct Person{
    char *name;
    int age;
}myPerson;
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //函数的调用
        func1();
        func2(12, 23);
        NSLog(@"==>%d",func3(12, 23));
        //指针函数的调用
        NSLog(@"==>%p,%d",func4(12, 23),*(func4(12, 23)));
        //函数指针:就是以地址，函数名也是一个地址！
        funcPtr=func3;
        NSLog(@"函数指针:%p,%p,%d",funcPtr,func3,funcPtr(12,23));
        NSLog(@"%p",&funcPtr);
        struct Student s1={"xiaoming",23};
        NSLog(@"%s,%d",s1.name,s1.age);
        
        Student s2={"xiaoli",32};
        NSLog(@"%s,%d",s2.name,s2.age);
        
//        struct Person p1={}
        myPerson p1={"xiaomin",22};
        NSLog(@"%s,%d",p1.name,p1.age);
    }
    return 0;
}
//函数的实现
void func1()
{
    NSLog(@"无参数无返回值的函数...");
}
void func2(int a,int b)
{
    NSLog(@"带两个int参数的无返回值的函数...%d",a+b);
}
int func3(int a,int b)
{
    NSLog(@"带两个int参数的返回值为int的函数...");
    return a+b;
}

//指针函数的实现
int* func4(int a,int b)
{
    NSLog(@"带两个整型参数的返回值为int型指针的指针函数...");
    int result1=a+b;
    int *p=&result1;
    return p;
}
