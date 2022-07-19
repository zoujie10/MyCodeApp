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
@property (nonatomic,strong)UIButton *chooseButton;
@end

@implementation ZJ_ButtonCustomVC

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"Button";
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
	
	[self.view addSubview:self.attTitleButton];
	[self.attTitleButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.mas_equalTo(self.view);
		make.top.mas_equalTo(self.circleButton.mas_bottom).offset(15);
		make.size.mas_equalTo(CGSizeMake(100, 35));
	}];
	
	[self.view addSubview:self.chooseButton];
	[self.chooseButton mas_makeConstraints:^(MASConstraintMaker *make) {
		make.centerX.mas_equalTo(self.view);
		make.top.mas_equalTo(self.attTitleButton.mas_bottom).offset(15);
		make.size.mas_equalTo(CGSizeMake(20, 20));
	}];
	
}
-(void)didTappedCommitButton:(UIButton *)sender{
	
}
-(void)attTextButton:(UIButton *)sender{
	
}
-(void)choose:(UIButton *)sender{
	_chooseButton.selected = !sender.selected;
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
		[_attTitleButton setTitle:@"" forState:UIControlStateNormal];
		_attTitleButton.backgroundColor = UIColor.whiteColor;
		[_attTitleButton setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
		_attTitleButton.titleLabel.font = ZJFONTNORMAL(15);
		
		NSAttributedString *s = [[NSAttributedString alloc]initWithString:@" 图文"];
		NSAttributedString *str = [NSMutableAttributedString set_attributeText:s withPic:@"ww_bd_mine_recommend_info_cell_price_up_arrow_icon" withAttchRect:CGRectMake(10, 0, 12, 12)];
		[_attTitleButton setAttributedTitle:str forState:UIControlStateNormal];

		_attTitleButton.layer.borderColor = ZJRgbColorA(227, 229, 233, 1).CGColor;
		_attTitleButton.layer.borderWidth = 1;
		_attTitleButton.layer.cornerRadius = 16;
	}
	return _attTitleButton;
}
- (UIButton *)chooseButton{
	if (!_chooseButton) {
		_chooseButton = [[UIButton alloc] init];
//		_chooseButton.backgroundColor = ZJRgbColorA(252, 85, 108, 1);
		_chooseButton.clipsToBounds = YES;
		[_chooseButton setBackgroundImage:[UIImage imageNamed:@"button_selected"]forState:UIControlStateSelected];
		[_chooseButton setBackgroundImage:[UIImage imageNamed:@"button_unSelected"]
								 forState:UIControlStateNormal];
		[_chooseButton addTarget:self
						  action:@selector(choose:)
				forControlEvents:UIControlEventTouchUpInside];

	}
	return _chooseButton;
}
@end
