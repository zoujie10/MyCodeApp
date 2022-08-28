//
//  ZJ_MakePhotoVC.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/23.
//

#import "ZJ_MakePhotoVC.h"
#import <Photos/Photos.h>
#import <CoreServices/CoreServices.h>
#import "ZJ_TakePictureManager.h"
#import "Watermarker.h"
@interface ZJ_MakePhotoVC ()
@property (nonatomic,strong)UIImageView *photoImageView;
@end

@implementation ZJ_MakePhotoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	self.view.backgroundColor = UIColor.whiteColor;
	[self.view addSubview:self.photoImageView];
	[self.photoImageView shakeAnimation];
	[self.photoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.center.equalTo(self.view);
		make.size.mas_equalTo(CGSizeMake(120, 120));
	}];
}
-(void)makePhoto{
	AVAuthorizationStatus authStatus = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
	if (authStatus == AVAuthorizationStatusRestricted || authStatus == AVAuthorizationStatusDenied) {
		// 无相机权限 做一个友好的提示
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"无法使用相机" message:@"请在iPhone的""设置-隐私-相机""中允许访问相机" preferredStyle:UIAlertControllerStyleAlert];
		UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {}];
		UIAlertAction *actionSet = [UIAlertAction actionWithTitle:@"设置" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
			[[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:^(BOOL success) {
			}];
		}];
		[alert addAction:action];
		[alert addAction:actionSet];
		[self.navigationController presentViewController:alert animated:YES completion:^{}];
	} else if (authStatus == AVAuthorizationStatusNotDetermined) {
		// fix issue 466, 防止用户首次拍照拒绝授权时相机页黑屏
		[AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
			if (granted) {
				dispatch_async(dispatch_get_main_queue(), ^{
//					[self takePhoto];
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
		[self.navigationController presentViewController:alert animated:YES completion:^{}];
	} else if ([PHPhotoLibrary authorizationStatus] == 0) { // 未请求过相册权限
		WeakSelf;
		[ZJ_TakePictureManager manager].currentViewController = self;
		[[ZJ_TakePictureManager manager] takePhotoComplete:^(UIImage * _Nonnull image) {
			NSData *upImage = [Watermarker waterImageLocationAndUserInformationWithImage:image isNeedDistance:NO];
			weakSelf.photoImageView.image = [UIImage imageWithData:upImage];
		}];
		
	}else {
		WeakSelf;
		[ZJ_TakePictureManager manager].currentViewController = self;
		[[ZJ_TakePictureManager manager] takePhotoComplete:^(UIImage * _Nonnull image) {
			weakSelf.photoImageView.image = image;
		}];
		
	}
}
- (UIImageView *)photoImageView{
	if(!_photoImageView){
		_photoImageView = [[UIImageView alloc]init];
		_photoImageView.userInteractionEnabled = YES;
		_photoImageView.contentMode = UIViewContentModeScaleAspectFit;
		_photoImageView.backgroundColor = UIColor.orangeColor;
		UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]init];
		[tap addTarget:self action:@selector(makePhoto)];
		[_photoImageView addGestureRecognizer:tap];
	}
	return _photoImageView;
}

@end
