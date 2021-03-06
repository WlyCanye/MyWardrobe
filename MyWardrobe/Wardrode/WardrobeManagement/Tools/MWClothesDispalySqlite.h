//
//  MWClothesDispalySqlite.h
//  MyWardrobe
//
//  Created by Libo on 17/5/18.
//  Copyright © 2017年 残夜孤鸥. All rights reserved.
//  数据库

#import <UIKit/UIKit.h>

@interface MWClothesDispalySqlite : NSObject

+ (void)creatTableName:(NSString *)tableName;

// 保存
+ (void)saveImage:(UIImage *)image toTable:(NSString *)tableName;

// 查询
+ (NSArray *)queryImageFromTable:(NSString *)tableName;

// 删除
+ (void)deleteImage:(UIImage *)image fromTable:(NSString *)tableName;

// 表格是否存在
+ (BOOL)isExistTable:(NSString *)tableName;

@end
