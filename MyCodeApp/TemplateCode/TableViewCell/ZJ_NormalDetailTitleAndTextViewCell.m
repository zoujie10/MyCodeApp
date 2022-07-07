//
//  ZJ_NormalDetailTitleAndTextViewCell.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/25.
//

#import "ZJ_NormalDetailTitleAndTextViewCell.h"
@interface ZJ_NormalDetailTitleAndTextViewCell()<UITextViewDelegate>

@end
@implementation ZJ_NormalDetailTitleAndTextViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
	self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
	if (self) {
		self.backgroundColor = UIColor.clearColor;
		self.selectionStyle = UITableViewCellSelectionStyleNone;
		[self creatUI];
	}
	return self;
}
-(void)creatUI{
	self.bgView = [[UIView alloc]init];
	self.bgView.backgroundColor = UIColor.whiteColor;
	self.bgView.layer.cornerRadius = 8;
	[self.contentView addSubview:self.bgView];
	[self.bgView addSubview:self.topLabel];
	[self.bgView addSubview:self.contentTextView];
	[self.bgView addSubview:self.memoTextCountLabel];
	
	[self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.edges.mas_equalTo(UIEdgeInsetsMake(10, 0, 10, 0));
	}];
	
	[self.topLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(self.contentView.mas_left).offset(15);
		make.top.mas_equalTo(self.contentView.mas_top).offset(20);
		make.width.mas_equalTo(145);
	}];
	
	[self.contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
		make.left.mas_equalTo(self.topLabel.mas_left);
		make.right.mas_equalTo(self.mas_right).offset(-12);
		make.bottom.mas_equalTo(self.bgView).offset(-15);
		make.top.mas_equalTo(self.topLabel.mas_bottom).offset(10);
	}];
	
	[self.memoTextCountLabel mas_makeConstraints:^(MASConstraintMaker *make) {
		make.height.mas_equalTo(15);
		make.right.mas_equalTo(self.contentTextView).offset(-10);
		make.bottom.mas_equalTo(self.contentTextView.mas_bottom).offset(-10);
	}];
}
#pragma mark - UITextViewDelegate
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
	if ([text isEqualToString:@""] && range.length > 0){
		return YES;
	
	}else{
		NSString *str = [NSString stringWithFormat:@"%@%@", textView.text, text];
		if (str.length > 200){
			textView.text = [str substringToIndex:200];
			self.memoTextCountLabel.text = [NSString stringWithFormat:@"%ld/200",textView.text.length];
			return NO;
		}else{
			return YES;
		}
	}
}
- (void)textViewDidChange:(UITextView *)textView{
	if (textView.text.length > 200){
		textView.text = [textView.text substringToIndex:200];
	}
	self.memoTextCountLabel.text = [NSString stringWithFormat:@"%ld/200",textView.text.length];
	if(self.textView_block){
		self.textView_block(textView.text);
	}
}
- (UITextView *)contentTextView{
	if (!_contentTextView) {
		_contentTextView = [[UITextView alloc] init];
//		_contentTextView.backgroundColor = [UIColor rw_viewBgGrayColor];
		_contentTextView.textColor = [UIColor blackColor];
		_contentTextView.delegate = self;
		_contentTextView.showsHorizontalScrollIndicator = NO;
//		_contentTextView.font = WWFONTBOLD(14);
//		[_contentTextView setRadius:4];
//		[_contentTextView setPlaceholder:@"请填写申诉原因（必填）" placeholdColor:[UIColor grayColor]];
		
	}
	return _contentTextView;
}
- (UILabel *)memoTextCountLabel{
	if(!_memoTextCountLabel){
		_memoTextCountLabel = [[UILabel alloc]init];
//		_memoTextCountLabel.textColor = WWRgbColor(153, 153, 153);
		_memoTextCountLabel.text = @"0/200";
		_memoTextCountLabel.backgroundColor = UIColor.clearColor;
	}
	return _memoTextCountLabel;
}
- (UILabel *)topLabel{
	if(!_topLabel){
		_topLabel = [[UILabel alloc]init];
		_topLabel.textAlignment = NSTextAlignmentLeft;
		_topLabel.backgroundColor = UIColor.clearColor;
//		_topLabel.textColor = WWRgbColor(52, 52, 52);
		_topLabel.text = @"";
		_topLabel.lineBreakMode = NSLineBreakByWordWrapping;
		_topLabel.numberOfLines = 0;
//		_topLabel.font = WWFONTBOLD(14);
//		NSAttributedString *str = [[NSAttributedString alloc]initWithString:@"申诉原因 :" attributes:@{NSFontAttributeName:WWFONTBOLD(14),NSForegroundColorAttributeName:WWRgbColor(52, 52, 52)}];
//		NSMutableAttributedString *symal = [[NSMutableAttributedString alloc]initWithString:@"* " attributes:@{NSFontAttributeName:WWFONTBOLD(13),NSForegroundColorAttributeName:WWRgbColor(252, 68, 84)}];
//		[symal appendAttributedString:str];
//		_topLabel.attributedText = symal;
	}
	return _topLabel;
}
@end
