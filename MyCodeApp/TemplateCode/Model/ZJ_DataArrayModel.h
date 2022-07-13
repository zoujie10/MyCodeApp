//
//  ZJ_DataArrayModel.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZJ_DataArrayItem : NSObject
@property (nonatomic, copy) NSString *flavor;
@property (nonatomic, copy) NSString *lastMonthSaleNum;
@property (nonatomic, copy) NSString *sku;
@property (nonatomic, copy) NSString *skuImages;
@property (nonatomic, copy) NSString *skuName;
@property (nonatomic, copy) NSString *skuTemplateName;
@property (nonatomic, copy) NSString *thirdOrderPrice;
@end


@interface ZJ_DataArrayModel : NSObject
@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *msg;
@property (nonatomic, strong) NSArray <ZJ_DataArrayItem*> *data;
@end
/**
 {
	 "code": 0,
	 "data": [
		 {
			 "flavor": "",
			 "lastMonthSaleNum": 0,
			 "sku": "",
			 "skuImages": "",
			 "skuName": "",
			 "skuTemplateName": "",
			 "thirdOrderPrice": 0
		 }
	 ],
	 "lastModifiedTime": "",
	 "msg": "",
	 "requestId": ""
 }
 */
NS_ASSUME_NONNULL_END
