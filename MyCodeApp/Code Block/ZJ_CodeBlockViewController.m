//
//  ZJ_CodeBlockViewController.m
//  MyCodeApp
//
//  Created by Zoujie on 2022/6/12.
//

#import "ZJ_CodeBlockViewController.h"

@interface ZJ_CodeBlockViewController ()
@property (nonatomic,strong)UIButton *Btn;
@property (nonatomic,strong)UILabel *Lbl;
@property (nonatomic,strong)UIImageView *imageView;
@property (nonatomic,strong)UITableView *mainTabelView;
@property (nonatomic,strong)UICollectionView *mainCollecView;
@end

@implementation ZJ_CodeBlockViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.title = @"常用代码块";
	self.view.backgroundColor = UIColor.whiteColor;
}



@end
