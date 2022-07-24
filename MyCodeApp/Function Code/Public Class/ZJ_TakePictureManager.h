//
//  ZJ_TakePictureManager.h
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@protocol WWTWWTakePictureManagerPortocol <NSObject>

- (UIImagePickerController *)pickerViewController;

@end
@interface ZJ_TakePictureManager : NSObject
+ (ZJ_TakePictureManager *)manager;
@property (nonatomic, weak) id <WWTWWTakePictureManagerPortocol> delegate;
@property (nonatomic, weak) UIViewController *currentViewController;
- (void)takePhotoAction;
- (void)takePhotoComplete:(void(^)(UIImage *image))complete;
- (void)choosePhotoComplete:(void(^)(UIImage *image))complete;

@end

NS_ASSUME_NONNULL_END
