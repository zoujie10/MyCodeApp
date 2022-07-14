//
//  ZJ_DataDicModel.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJ_DataDicItem : NSObject
@property (nonatomic, copy) NSString *activityDesc;//活动描述
@property (nonatomic, copy) NSString *activityId;//
@property (nonatomic, copy) NSString *activityJumpAddr;//营销页链接(活动跳转标识为2即H5时有值)
@property (nonatomic, copy) NSString *activityJumpFlag;//活动跳转标识 1-专区页 2-H5
@property (nonatomic, copy) NSString *repeatFlag;//是否为叠加活动 1-是 0-否
@property (nonatomic, copy) NSString *way;// 赠送方式（1随机，2自选，3指定）
@property (nonatomic, assign) BOOL showSelectBtn;
@end


@interface ZJ_DataDicData : NSObject
@property (nonatomic,strong)NSArray<ZJ_DataDicItem *>* list;
@end

@interface ZJ_DataDicModel : NSObject
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) ZJ_DataDicData *data;
@end

NS_ASSUME_NONNULL_END
/**
 {
	 "code": 0,
	 "data": {
		 "list": [
			 {
				 "activityDesc": "",
				 "activityId": 0,
				 "activityJumpAddr": "",
				 "activityJumpFlag": 0,
				 "repeatFlag": 0
			 }
		 ]
	 },
	 "lastModifiedTime": "",
	 "msg": "",
	 "requestId": ""
 }
 **/
