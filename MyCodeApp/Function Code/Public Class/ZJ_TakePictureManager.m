//
//  ZJ_TakePictureManager.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/23.
//

#import "ZJ_TakePictureManager.h"
#import <AVFoundation/AVCaptureDevice.h>
#import <Photos/PHPhotoLibrary.h>
#import <CoreServices/CoreServices.h>

@interface ZJ_TakePictureManager()<UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic, strong) UIImagePickerController *picker;
@property (nonatomic, copy) void(^complete)(UIImage *image);
@end
@implementation ZJ_TakePictureManager
+ (ZJ_TakePictureManager *)manager {
	static ZJ_TakePictureManager *_manager;
	static dispatch_once_t onceToken;
	dispatch_once(&onceToken, ^{
		_manager = [[ZJ_TakePictureManager alloc] init];
	});
	return _manager;
}
- (instancetype)init {
	if (self = [super init]) {
		
	}
	return self;
}
- (void)setDelegate:(id<WWTWWTakePictureManagerPortocol>)delegate {
	_delegate = delegate;
	if (self.delegate && [self.delegate respondsToSelector:@selector(pickerViewController)]) {
		_picker = [self.delegate pickerViewController];
	}else {
		_picker = [[UIImagePickerController alloc] init];
	}
	_picker.delegate = self;
}
- (UIImagePickerController *)picker {
	if (!_picker) {
		_picker = [[UIImagePickerController alloc] init];
		_picker.delegate = self;
		_picker.allowsEditing = false;
	}
	return _picker;
}
-  (void)check:(void(^)(void))complete {
	AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
	if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
		// 无相机权限 做一个友好的提示
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
		UIAlertAction *actionSet = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString]];
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
			}];
		}];
		[alert addAction:action];
		[alert addAction:actionSet];
		[[self currentViewController] presentViewController:alert animated:YES completion:^{}];
	} else if (authStatus == AVAuthorizationStatusNotDetermined) {
		// fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
		[AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
			if (granted) {
				dispatch_async(dispatch_get_main_queue(), ^{
					[self.picker dismissViewControllerAnimated:true completion:nil];
				});
			}
		}];
		// 拍照之前还需要检查相册权限
	} else if ([PHPhotoLibrary authorizationStatus] == 2) { // 已被拒绝，没有相册权限，将无法保存拍的照片
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"无法访问相册" message:@"请在iPhone的""设置-隐私-相册""中允许访问相册" preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
		UIAlertAction *actionSet = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
			}];
		}];
		[alert addAction:action];
		[alert addAction:actionSet];
		[[self currentViewController] presentViewController:alert animated:true completion:^{}];
	} else {
		if (complete) {
			complete();
		}
	}
}
- (void)takePhotoComplete:(void(^)(UIImage *image))complete {
	_complete = complete;
	WeakSelf;
	[self check:^{
		[weakSelf pushImagePickerController];
	}];
}
- (void)choosePhotoComplete:(void (^)(UIImage * _Nonnull))complete {
	_complete = complete;
	if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypePhotoLibrary]) {
		self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
		NSMutableArray *mediaTypes = [NSMutableArray array];
		[mediaTypes addObject:(NSString *)kUTTypeImage];
		if (mediaTypes.count) {
			self.picker.mediaTypes = mediaTypes;
		}
		WeakSelf;
		[self check:^{
			[[weakSelf currentViewController] presentViewController:weakSelf.picker animated:false completion:nil];
		}];
	}
}
- (void)pushImagePickerController {
	UIImagePickerControllerSourceType sourceType = UIImagePickerControllerSourceTypeCamera;
	if ([UIImagePickerController isSourceTypeAvailable: UIImagePickerControllerSourceTypeCamera]) {
		self.picker.sourceType = sourceType;
		NSMutableArray *mediaTypes = [NSMutableArray array];
		
		[mediaTypes addObject:(NSString *)kUTTypeImage];
		
		if (mediaTypes.count) {
			_picker.mediaTypes = mediaTypes;
		}
		[[self currentViewController] presentViewController:_picker animated:false completion:nil];
	} else {
		NSLog(@"模拟器中无法打开照相机,请在真机中使用");
	}
}
- (void)takePhotoAction {
	[self.picker takePicture];
}
- (UIViewController *)currentViewController {
	return _currentViewController;
}
#pragma mark -- mark UINavigationControllerDelegate, UIImagePickerControllerDelegate
- (void)imagePickerController:(UIImagePickerController*)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
	[picker dismissViewControllerAnimated:YES completion:nil];
	NSString *type = [info objectForKey:UIImagePickerControllerMediaType];
	
	if ([type isEqualToString:@"public.image"]) {
		UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
		if (self.complete) {
			self.complete(image);
		}
	} else if ([type isEqualToString:@"public.movie"]) {
//        NSURL *videoUrl = [info objectForKey:UIImagePickerControllerMediaURL];
		// 视频链接
		
	}else {}
}
@end
