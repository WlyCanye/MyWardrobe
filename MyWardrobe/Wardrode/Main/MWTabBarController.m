//
//  MWTabBarController.m
//  MyWardrobe
//
//  Created by Libo on 17/5/15.
//  Copyright © 2017年 残夜孤鸥. All rights reserved.
//

#import "MWTabBarController.h"
#import "MWNavigationController.h"
#import "MWHomeViewController.h"
#import "MWShareViewController.h"
#import "MWWardrobeViewController.h"
#import "MWMacro.h"
#import "ColorViewController.h"

@interface MWTabBarController ()

@end

@implementation MWTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 初始化子控制器
    MWHomeViewController *recipesVc = [[MWHomeViewController alloc] init];
    [self addChildController:recipesVc
                       title:@"首页"
                       image:@"Closeth"
               selectedImage:@"Closeth"];
    MWWardrobeViewController *ward = [[MWWardrobeViewController alloc] init];
    [self addChildController:ward
                       title:@"衣橱"
                       image:@"Closeth"
               selectedImage:@"Closeth"];
    ColorViewController *share = [[ColorViewController alloc] init];
    [self addChildController:share
                       title:@"分享"
                       image:@"Closeth"
               selectedImage:@"Closeth"];

}

/**
 *  添加一个子控制器
 *
 */
- (void)addChildController:(UIViewController *)childController title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    // 设置子控制器的文字
    // childController.title = title;            // 同时设置tabbar和navigationBar的文字
    childController.tabBarItem.title = title;     // 设置tabbar的文字
    //  childController.navigationItem.title = title; // 设置navigationBar的文字
    
    // 设置子控制器的图片
    // UIImageRenderingModeAlwaysOriginal保持原始图片，不让其渲染，否则所有的tabBar图片都默认为蓝色
    if (greaterThaniOS(7)) {
        childController.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        childController.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    else {
        childController.tabBarItem.image = [UIImage imageNamed:image];
        childController.tabBarItem.selectedImage = [UIImage imageNamed:selectedImage];
    }
    // 设置文字的样式
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    NSMutableDictionary *selectTextAttrs = [NSMutableDictionary dictionary];
    // 选中状态下的颜色设置为主色调
    selectTextAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    [childController.tabBarItem setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    [childController.tabBarItem setTitleTextAttributes:selectTextAttrs forState:UIControlStateSelected];
    // 先给外面传进来的小控制器 包装 一个导航控制器
    MWNavigationController *nav = [[MWNavigationController alloc] initWithRootViewController:childController];
    
    // 添加为子控制器
    [self addChildViewController:nav];
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
