//
//  ZJ_DataArrayModel.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/12.
//

#import "ZJ_DataArrayModel.h"
@implementation ZJ_DataArrayItem

@end

@implementation ZJ_DataArrayModel
+ (NSDictionary *)mj_objectClassInArray {
	return @{@"data" : ZJ_DataArrayItem.class};
}
@end

