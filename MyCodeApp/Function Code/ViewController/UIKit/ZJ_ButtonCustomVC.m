//
//  ZJ_ButtonCustomVC.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/16.
//

#import "ZJ_ButtonCustomVC.h"

@interface ZJ_ButtonCustomVC ()
@property (nonatomic,strong)UIButton *circleButton;
@property (nonatomic,strong)UIButton *attTitleButton;
@end

@implementation ZJ_ButtonCustomVC

- (void)viewDidLoad {
    [super viewDidLoad];
	self.view.backgroundColor = UIColor.whiteColor;
	[self configUILayout];
}
-(void)configUILayout{
	[self.view addSubview:self.circleButton];
	[self.circleButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.mas_equalTo(self.view);
		make.top.mas_offset(100);
		make.size.mas_equalTo(CGSizeMake(100, 35));
	}];
	
	
	
}
-(void)didTappedCommitButton:(UIButton *)sender{
	
}
-(void)attTextButton:(UIButton *)sender{
	
}
- (UIButton *)circleButton{
	if (!_circleButton) {
		_circleButton = [[UIButton alloc] init];
		_circleButton.backgroundColor = ZJRgbColorA(252, 85, 108, 1);
		_circleButton.titleLabel.font = ZJFONTBOLD(15);
		_circleButton.layer.cornerRadius = 16;
		_circleButton.clipsToBounds = YES;
		[_circleButton setTitleColor:[UIColor whiteColor]
							forState:UIControlStateNormal];
		[_circleButton setTitleColor:[UIColor whiteColor]
							forState:UIControlStateDisabled];
//		[_circleButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexStringMethod:@"#DCDEE0"]]
//								 forState:UIControlStateDisabled];
		[_circleButton setBackgroundColor:ZJRgbColorA(252, 85, 108, 1)];
//		[_circleButton setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexStringMethod:@"#FC556C"]]
//								 forState:UIControlStateNormal];
		[_circleButton addTarget:self
						  action:@selector(didTappedCommitButton:)
				forControlEvents:UIControlEventTouchUpInside];
		[_circleButton setTitle:@"  确认  "
					   forState:UIControlStateNormal];
 
	}
	return _circleButton;
}
- (UIButton *)attTitleButton{
	if(!_attTitleButton){
		_attTitleButton = [[UIButton alloc]init];
		[_attTitleButton addTarget:self action:@selector(attTextButton:) forControlEvents: UIControlEventTouchUpInside];
		[_attTitleButton setTitle:@"取消" forState:UIControlStateNormal];
		_attTitleButton.backgroundColor = UIColor.whiteColor;
		[_attTitleButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
		_attTitleButton.titleLabel.font = ZJFONTNORMAL(15);
		_attTitleButton.layer.borderColor = ZJRgbColorA(227, 229, 233, 1).CGColor;
		_attTitleButton.layer.borderWidth = 1;
		_attTitleButton.layer.cornerRadius = 16;
	}
	return _attTitleButton;
}

@end
