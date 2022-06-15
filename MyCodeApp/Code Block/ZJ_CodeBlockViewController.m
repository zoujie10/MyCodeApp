//
//  ZJ_CodeBlockViewController.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/12.
//

#import "ZJ_CodeBlockViewController.h"

@interface ZJ_CodeBlockViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>
@property (nonatomic,strong)UIButton *Btn;
@property (nonatomic,strong)UILabel *Lbl;
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UITableView *mainTableView;
@property (nonatomic,strong)UICollectionView *mainCollectionView;
@end

@implementation ZJ_CodeBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"常用代码块";
	self.view.backgroundColor = UIColor.whiteColor;
}

- (UIButton *)Btn{
	if(!_Btn){
		_Btn = [[UIButton alloc]init];
		[_Btn setTitle:@"" forState:UIControlStateNormal];
		[_Btn setBackgroundColor:UIColor.clearColor];
		[_Btn setTitleColor:UIColor.whiteColor forState:UIControlStateSelected];
		[_Btn setTitleColor:UIColor.blackColor forState:UIControlStateNormal];
//		[_Btn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#FC556C" alpha:1]] forState:UIControlStateSelected];
//		[_Btn setBackgroundImage:[UIImage imageWithColor:[UIColor colorWithHexString:@"#FC556C" alpha:0.2]] forState:UIControlStateNormal];
//		_Btn.clipsToBounds = YES;
//		[_Btn addTarget:self action:@selector(clickMethod:) forControlEvents:UIControlEventTouchUpInside];
//		_Btn.titleLabel.font = WWFONTBOLD(13);
//		_Btn.layer.borderColor = ;
//		_Btn.layer.cornerRadius = ;
//		_Btn.tag = ;
	}
	return _Btn;
}
- (UILabel *)Lbl{
	if(!_Lbl){
		_Lbl = [[UILabel alloc]init];
		_Lbl.backgroundColor = UIColor.whiteColor;
		_Lbl.textColor = UIColor.blackColor;
		_Lbl.text = @"  ";
//		_Lbl.font = WWFONTBOLD(16);
//		_Lbl.numberOfLines = 0;
//		_Lbl.textAlignment = NSTextAlignmentCenter;
//		_Lbl.layer.cornerRadius = 4;
//		_Lbl.layer.borderColor = UIColor.redColor;
//		_Lbl.layer.borderWidth = 1;
	}
	return _Lbl;
}
- (UIImageView *)imageView{
	if(!_imageView){
		_imageView = [[UIImageView alloc] init];
		_imageView.backgroundColor = UIColor.whiteColor;
		_imageView.clipsToBounds = YES;
//		_imageView.image = WW_PRODUCT_IMG_LITTLE_PLACE_HOLDER;
		_imageView.layer.borderWidth = 0.7;
		_imageView.layer.borderColor = [UIColor colorWithRed:229/255.0 green:229/255.0 blue:229/255.0 alpha:1.0].CGColor;
		_imageView.layer.cornerRadius = 4;
		_imageView.contentMode = UIViewContentModeScaleAspectFit;
	}
	return _imageView;
}
#pragma mark UITableView
/**
 1. UITableViewStyleGrouped
 注意：去掉头部和中间间隔
 正确的理解方法
 1.设置标头的高度为特小值 （不能为零 为零的话苹果会取默认值就无法消除头部间距了）
 UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 0.001)];
 view.backgroundColor = [UIColor redColor];
 self.tableView.tableHeaderView = view;
 2.写代理方法（中间的留白其实是段尾的高度 代理的作用设置段尾的高度 返回值也不能为0）
 -(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
 {
 return 0.001;
 }

 特殊的处理方法也能实现该效果
 1.    self.tableView.contentInset = UIEdgeInsetsMake(-44, 0, 0, 0);

 2.重写UITableViewHeaderFooterView的
 -(void)setFrame:(CGRect)frame{
 frame.size.height+=10;
 [super setFrame:frame];
 }
 */
/**
 2. UITableViewStylePlain
 1.有多段时 段头停留（自带效果）
 2.没有中间的间距和头部间距（要想有的重写UITableViewCell \UITableViewHeaderFooterView里面的setFrame方法）
 扩展：让段头不停留（取消粘性效果）
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
	CGFloat sectionHeaderHeight = 30;
	if (scrollView.contentOffset.y<=sectionHeaderHeight&&scrollView.contentOffset.y>=0) {
		scrollView.contentInset = UIEdgeInsetsMake(-scrollView.contentOffset.y, 0, 0, 0);
	} else if (scrollView.contentOffset.y>=sectionHeaderHeight) {
		scrollView.contentInset = UIEdgeInsetsMake(-sectionHeaderHeight, 0, 0, 0);
	}
}
- (UITableView *)_mainTableView{
	if(!_mainTableView){
		_mainTableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
		_mainTableView.contentInset = UIEdgeInsetsMake(15, 0, 0, 0);
		_mainTableView.delegate = self;
		_mainTableView.dataSource = self;
		_mainTableView.showsVerticalScrollIndicator = NO;
		_mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
		_mainTableView.backgroundColor = WWRgbColor(247, 247, 247);
	}
	return _mainTableView;
}
-(void)registerCell{
//	ShowCell = @[WWBDCustomerApplyAuthLetterTitleLabelCell.class,
//							WWBDCustomerApplyAuthLetterTextFieldCell.class,
//							WWBDCustomerApplyAuthLetterTitleLabelCell.class,
//							WWBDCustomerApplyAuthLetterLabelAndAlertCell.class,
//							WWBDCustomerApplyAuthLetterTextFieldCell.class];
//	[ShowCell enumerateObjectsUsingBlock:^(UITableViewCell *cell, NSUInteger idx, BOOL * _Nonnull stop) {
//		[self.mainTableView registerClass:cell.class forCellReuseIdentifier:NSStringFromClass(cell.class)];
//	}];
}
#pragma  mark UICollectionView
///UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
- (UICollectionView *)mainCollectionView{
	if(!_mainCollectionView){
		UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
		layout.itemSize = CGSizeMake(70, 70);
		_mainCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
		_mainCollectionView.alwaysBounceVertical = YES;
		
		_mainCollectionView.backgroundColor = WWRgbColor(250, 250, 250);
		_mainCollectionView.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
		_mainCollectionView.dataSource = self;
		_mainCollectionView.delegate = self;
		_mainCollectionView.scrollEnabled = NO;
		_mainCollectionView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
//		[_mainCollectionView registerClass:[WWBDViewImageCollectionCell class] forCellWithReuseIdentifier:@"Cell"];
		_mainCollectionView.layer.cornerRadius = 4;
	}
	return _mainCollectionView;
}
@end
