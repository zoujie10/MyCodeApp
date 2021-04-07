//
//  NSArray+Extension.h
//  MyCodeApp
//
//  Created by 邹杰 on 4/7/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSArray<ObjectType> (Extension)
/**
 将多个对象合并成一个数组，如果参数类型是数组则会将数组内的元素拆解出来加到 return 内（只会拆解一层，所以多维数组不处理）

 @param object 要合并的多个数组
 @return 合并完的结果
 */
+ (instancetype)qmui_arrayWithObjects:(id)object, ...;

/**
 *  将多维数组打平成一维数组再遍历所有子元素
 */
- (void)qmui_enumerateNestedArrayWithBlock:(void (^)(id obj, BOOL *stop))block;

/**
 *  将多维数组递归转换成 mutable 多维数组
 */
- (NSMutableArray *)qmui_mutableCopyNestedArray;

/**
 *  过滤数组元素，将 block 返回 YES 的 item 重新组装成一个数组返回
 */
- (NSArray<ObjectType> *)qmui_filterWithBlock:(BOOL (^)(ObjectType item))block;
@end

NS_ASSUME_NONNULL_END
