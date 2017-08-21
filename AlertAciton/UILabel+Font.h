//
//  UILabel+Font.h
//  AlertAciton
//
//  Created by 唐云川 on 2017/6/29.
//  Copyright © 2017年 Mr_Tang. All rights reserved.
//
/*
 appearanceLabel为什么不直接调用setFont方法来修改字体大小，而是调用UILabel类目中自定义的方法来间接的调用setFont方法呢？
 　　
 　　因为appearanceLabel其实并不是一个UILabel对象，它不属于UILabel类。为了验证如此，通过打印查看：
 
 NSLog(@"%@", appearanceLabel);
 NSString *className = [NSString stringWithCString:object_getClassName(appearanceLabel) encoding:NSUTF8StringEncoding];
 NSLog(@"所属类：%@", className);
 
 
 控制台输出结果如下：
 
 2016-05-15 17:01:48.498 UIAlertController[2921:92430] <_UIAppearance:0x7f9e90c37b60> <Customizable class: UILabel> when contained in (
 UIAlertController
 ) with invocations (
 "<NSInvocation: 0x7f9e90c38370>",
 "<NSInvocation: 0x7f9e90e0bf50>"
 )>
 2016-05-15 17:01:48.498 UIAlertController[2921:92430] 所属类：_UIAppearance
 
 
 appearanceWhenContainedInInstancesOfClasses方法返回的是一个UIAppearance类型，其本身其实是一个协议。至此，修改字体大小为什么通过UILabel类目间接的调用setFont方法也就清楚了
 
 */
#import <UIKit/UIKit.h>

@interface UILabel (Font)

- (void)changeFont:(UIFont *)font;
@end
