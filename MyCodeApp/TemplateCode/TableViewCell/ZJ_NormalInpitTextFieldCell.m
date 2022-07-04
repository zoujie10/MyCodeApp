//
//  ZJ_NormalInpitTextFieldCell.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/7/2.
//

#import "ZJ_NormalInpitTextFieldCell.h"
@interface ZJ_NormalInpitTextFieldCell()<UITextViewDelegate>
@property (nonatomic,strong)UILabel *placeHolderLabel;
@end
@implementation ZJ_NormalInpitTextFieldCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		[self configContentView];
	}
	return self;
}
-(void)configContentView{
	[self.contentView addSubview:self.inputTextField];
	[self.inputTextField mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.insets(UIEdgeInsetsMake(0, 22, 10, 80));
	}];
	
	[self.contentView addSubview:self.rightLabel];
	[self.rightLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.equalTo(self.inputTextField.mas_right);
		make.top.bottom.equalTo(self.inputTextField);
		make.right.equalTo(self.contentView).offset(-15);
	}];
	UIView *lineView = [[UIView alloc]init];
//	lineView.backgroundColor = WWRgbColor(243, 245, 248);
	[self.contentView addSubview:lineView];
	[lineView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(self.contentView).offset(25);
		make.right.mas_equalTo(self.contentView).offset(-15);
		make.height.mas_equalTo(1);
		make.top.mas_equalTo(self.inputTextField.mas_bottom).offset(1);
	}];
}

- (UITextView *)inputTextField{
	if(!_inputTextField){
		_inputTextField = [[UITextView alloc]init];
		_inputTextField.delegate = self;
//		_inputTextField.font = WWFONTNORMAL(14);
//		_inputTextField.textColor = WWRgbColor(52, 52, 52);
	}
	return _inputTextField;
}

- (UILabel *)rightLabel{
	if(!_rightLabel){
		_rightLabel = [[UILabel alloc]init];
		_rightLabel.numberOfLines = 1;
		_rightLabel.backgroundColor = [UIColor whiteColor];
//		_rightLabel.textColor = WWRgbColor(252, 85, 108);
//		_rightLabel.font = WWFONTNORMAL(13);
		_rightLabel.hidden = YES;
		_rightLabel.textAlignment = NSTextAlignmentRight;
	}
	return _rightLabel;
}
- (UILabel *)placeHolderLabel{
	if(!_placeHolderLabel){
		_placeHolderLabel = [[UILabel alloc] init];
		_placeHolderLabel.numberOfLines = 0;
//		_placeHolderLabel.textColor = WWRgbColor(153, 153, 153);
		_placeHolderLabel.font = self.inputTextField.font;
		[_placeHolderLabel sizeToFit];
		[self.inputTextField addSubview:_placeHolderLabel];
		[self.inputTextField setValue:_placeHolderLabel forKey:@"_placeholderLabel"];
	}
	return _placeHolderLabel;
}
#pragma mark textfield delegate
- (void)textViewDidEndEditing:(UITextView *)textView{
	if(self.input_done_block){
		self.input_done_block(self.textField_type,textView.text);
	}
}
- (void)setTextField_type:(Select_TextField_Type)textField_type{
	_textField_type = textField_type;
	switch (textField_type) {
		case Select_TextField_Type_First:
			self.placeHolderLabel.text = @"请填写营业执照名称";
			break;
		case Select_TextField_Type_Second:
			self.placeHolderLabel.text = @"请输入快递单号";
			break;
		case Select_TextField_Type_Third:
			self.placeHolderLabel.text = @"请输入具体街道号";
			break;
		default:
			break;
	}
	self.rightLabel.hidden = textField_type == Select_TextField_Type_Third ? NO : YES;
}


@end
