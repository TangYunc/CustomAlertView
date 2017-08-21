//
//  GetAllIvarViewController.m
//  AlertAciton
//
//  Created by 唐云川 on 2017/6/29.
//  Copyright © 2017年 Mr_Tang. All rights reserved.
//

/*
 getClassInfo
 */


#import "GetAllIvarViewController.h"
#import <objc/runtime.h>

@interface GetAllIvarViewController ()

@end

@implementation GetAllIvarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"你正在使用UIAlertController写Alert" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"你点击了alert的取消按钮!");
    }];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
        NSLog(@"你点击了alert的确定按钮!");
    }];
    
    [alertControl addAction:cancel];
    [alertControl addAction:confirm];
    UILabel *label = [[UILabel alloc] init];
    NSLog(@"********所有变量/值:\n%@", [self getAllIvar:alertControl]);
    NSLog(@"********所有属性:\n%@", [self getAllProperty:alertControl]);

}

//通过运行时获取KEY
//获得所有变量
- (NSArray *)getAllIvar:(id)object
{
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int count;
    Ivar *ivars = class_copyIvarList([object class], &count);
    for (int i = 0; i < count; i++) {
        Ivar ivar = ivars[i];
        const char *keyChar = ivar_getName(ivar);
        NSString *keyStr = [NSString stringWithCString:keyChar encoding:NSUTF8StringEncoding];
        @try {
            id valueStr = [object valueForKey:keyStr];
            NSDictionary *dic = nil;
            if (valueStr) {
                dic = @{keyStr : valueStr};
            } else {
                dic = @{keyStr : @"值为nil"};
            }
            [array addObject:dic];
        }
        @catch (NSException *exception) {}
    }
    return [array copy];
}

//获得所有属性
- (NSArray *)getAllProperty:(id)object
{
    NSMutableArray *array = [NSMutableArray array];
    
    unsigned int count;
    objc_property_t *propertys = class_copyPropertyList([object class], &count);
    for (int i = 0; i < count; i++) {
        objc_property_t property = propertys[i];
        const char *nameChar = property_getName(property);
        NSString *nameStr = [NSString stringWithCString:nameChar encoding:NSUTF8StringEncoding];
        [array addObject:nameStr];
    }
    return [array copy];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
