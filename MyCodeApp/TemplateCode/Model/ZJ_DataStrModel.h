//
//  ZJ_DataStrModel.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJ_DataStrItem : NSObject
@property (nonatomic, copy) NSString *alsoOptionalGiftAmount;
@property (nonatomic, copy) NSString *cartAmount;
@property (nonatomic, copy) NSString *giftAmount;
@property (nonatomic, copy) NSString *giftAmountSelected;
@property (nonatomic, copy) NSString *thresholdAmount;
@property (nonatomic, copy) NSString *isThreshold;
@end

@interface ZJ_DataStrModel : NSObject
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) ZJ_DataStrItem *data;
@end

NS_ASSUME_NONNULL_END
/**
 {
	 "code": 0,
	 "data": {
		 "alsoOptionalGiftAmount": 0, 还可选赠品总金额
		 "cartAmount": 0, 购物车商品总金额
		 "giftAmount": 0,
		 "giftAmountSelected": 0
	 },
	 "lastModifiedTime": "",
	 "message": "",
	 "msg": "",
	 "requestId": ""
 }
 */
