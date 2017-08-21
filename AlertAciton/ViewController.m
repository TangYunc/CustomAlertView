//
//  ViewController.m
//  AlertAciton
//
//  Created by Mr_Tang on 16/1/8.
//  Copyright © 2016年 Mr_Tang. All rights reserved.
//

#import "ViewController.h"
#import "UILabel+Font.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)alert3:(id)sender {
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"标题" message:@"副标题" preferredStyle:UIAlertControllerStyleAlert];
    
    // 自定义标题
    NSMutableAttributedString *title = [[NSMutableAttributedString alloc] initWithString:@"已用微信支付完成付款？ 请点击“已支付”付款遇到问题？ 请尝试其他方式付款"];
    [title addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0,title.length)];
    [title addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:51 / 255.0 green:51/255.0 blue:51/ 255.0 alpha:1.0] range:NSMakeRange(0,title.length)];
    [alertControl setValue:title forKey:@"attributedTitle"];
    
    // 自定义副标题
    NSMutableAttributedString *subTitle = [[NSMutableAttributedString alloc] initWithString:@"本次订单获取佣金￥9.9 请到店铺订单里查看"];
    [subTitle addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14] range:NSMakeRange(0,subTitle.length)];
    [subTitle addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:102 / 255.0 green:102/255.0 blue:102/ 255.0 alpha:1.0] range:NSMakeRange(0,subTitle.length)];
    [subTitle addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:199 / 255.0 green:9/255.0 blue:9/ 255.0 alpha:1.0] range:NSMakeRange(8,subTitle.length - 17)];
    [alertControl setValue:subTitle forKey:@"attributedMessage"];
    
    // 自定义取消按钮
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"已支付" style:UIAlertActionStyleCancel handler:nil];
 /*
    // 设置按钮背景图片
    UIImage *image = [[UIImage imageNamed:@"icon_182"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [cancelAction setValue:image forKey:@"image"];
    // 设置按钮的title的对齐方式
    [cancelAction setValue:[NSNumber numberWithInteger:NSTextAlignmentLeft] forKey:@"titleTextAlignment"];
  */
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    [alertControl addAction:okAction];
    [alertControl addAction:cancelAction];
    //设置按钮字体大小
    UILabel * appearanceLabel = [UILabel appearanceWhenContainedInInstancesOfClasses:@[UIAlertController.class]];
    [appearanceLabel changeFont:[UIFont systemFontOfSize:15]];
    
    //设置按钮字体颜色
    [cancelAction setValue:[UIColor colorWithRed:74 / 255.0 green:144/255.0 blue:226/ 255.0 alpha:1.0] forKey:@"titleTextColor"];
    [okAction setValue:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/ 255.0 alpha:1.0] forKey:@"titleTextColor"];
    [self presentViewController:alertControl animated:YES completion:nil];
    
    //参考按钮字体大小的设置资料：http://dongxin.online/2016/05/15/修改UIAlertAction的字体颜色和大小/
}
- (IBAction)alert1:(id)sender {
}


- (IBAction)alertAction:(id)sender {
    
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"登录失败" message:@"你正在使用UIAlertController写Alert" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"NO" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"你点击了alert的取消按钮!");
    }];
    
    UIAlertAction *confirm = [UIAlertAction actionWithTitle:@"YES" style:UIAlertActionStyleDefault handler:^(UIAlertAction *  action) {
        NSLog(@"你点击了alert的确定按钮!");
    }];
    
    [alertControl addAction:cancel];
    [alertControl addAction:confirm];
    [self presentViewController:alertControl animated:YES completion:nil];
    //    [self presentViewController:alertControl animated:YES completion:^{
    //        NSLog(@"即将弹出警告框！");
    //    }];
    
}

- (IBAction)sheetAction:(id)sender {
    
    UIAlertController *sheetControl = [[UIAlertController alloc]init];
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action){
        NSLog(@"你点击了sheet的取消按钮!");
    }];
    
    UIAlertAction *weibo = [UIAlertAction actionWithTitle:@"微博" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"你点击了sheet的微博按钮!");
    }];
    
    UIAlertAction *qq = [UIAlertAction actionWithTitle:@"QQ" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"你点击了QQ的微博按钮!");
    }];
    
    UIAlertAction *destructive = [UIAlertAction actionWithTitle:@"破坏按钮" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"你点击了QQ的微博按钮!");
    }];
    
    [sheetControl addAction:destructive];
    [sheetControl addAction:qq];
    [sheetControl addAction:weibo];
    [sheetControl addAction:cancel];
    
    
    [self presentViewController:sheetControl animated:YES completion:^{
        NSLog(@"即将弹出操作表！");
    }];
}






@end
