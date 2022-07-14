//
//  ZJ_DataDicModel.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/12.
//

#import "ZJ_DataDicModel.h"
@implementation ZJ_DataDicItem

@end
@implementation ZJ_DataDicData
+ (NSDictionary *)mj_objectClassInArray {
	return @{@"list" : ZJ_DataDicItem.class};
}
@end
@implementation ZJ_DataDicModel

@end
