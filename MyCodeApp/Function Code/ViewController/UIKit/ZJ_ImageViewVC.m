//
//  ZJ_ImageViewVC.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/17.
//

#import "ZJ_ImageViewVC.h"

@interface ZJ_ImageViewVC ()
@property (nonatomic,strong)UIImageView *fillImageView;
@end

@implementation ZJ_ImageViewVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
	[self configUILayout];
}
-(void)configUILayout{
//	self.fillImageView 
}
- (UIImageView *)fillImageView{
	if(!_fillImageView){
		_fillImageView = [[UIImageView alloc]init];
		_fillImageView.contentMode = UIViewContentModeScaleToFill;
	}
	return _fillImageView;
}
@end
