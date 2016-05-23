//
//  HomeTableViewCell.m
//  MVVM
//
//  Created by LIUYONG on 16/5/23.
//  Copyright © 2016年 WanJianTechnology. All rights reserved.
//

#import "HomeTableViewCell.h"
#import "UIView+Frame.h"
#import "Define.h"
#import "UIImageView+WebCache.h"
#import "HomeListModel.h"
@interface HomeTableViewCell ()

@property (nonatomic,strong) UIImageView *newsImageView;//图片
@property (nonatomic,strong) UILabel *newsTitleLabel;//标题
@property (nonatomic,strong) UILabel *newsSourceLabel;//来源
@property (nonatomic,strong) UILabel *newsTypeLabel;//类型
@end

@implementation HomeTableViewCell
#pragma mark - Overwrite
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        //布局View
        [self setUpView];
    }
    return self;
}
#pragma mark - UI
- (void)setUpView {
    //图片
    [self.contentView addSubview:self.newsImageView];
    //标题
    [self.contentView addSubview:self.newsTitleLabel];
    //来源
    [self.contentView addSubview:self.newsSourceLabel];
    //类型
    [self.contentView addSubview:self.newsTypeLabel];
}

#pragma mark - Setter And Getter
- (UIImageView *)newsImageView{
    if (!_newsImageView) {
        _newsImageView=[[UIImageView alloc]init];
        [_newsImageView setFrame:CGRectMake(10.0, 10.0, 85.0, 60.0)];
    }
    return _newsImageView;
}

- (UILabel *)newsTitleLabel{
    if (!_newsTitleLabel) {
        _newsTitleLabel=[[UILabel alloc]init];
        [_newsTitleLabel setFrame:CGRectMake(self.newsImageView.x+self.newsImageView.width+10.0, self.newsImageView.y, kScreenWidth-self.newsImageView.x+self.newsImageView.width-20.0, 40.0)];
        [_newsTitleLabel setFont:UIFont_size(15.0)];
        [_newsTitleLabel setTextColor:kAppDarkGrayColor];
        [_newsTitleLabel setTextAlignment:NSTextAlignmentLeft];
        [_newsTitleLabel setNumberOfLines:0];
    }
    return _newsTitleLabel;
}

- (UILabel *)newsSourceLabel{
    if (!_newsSourceLabel) {
        _newsSourceLabel=[[UILabel alloc]init];
        [_newsSourceLabel setFrame:CGRectMake(self.newsTitleLabel.x, 55.0, self.newsTitleLabel.width/2, 15.0)];
        [_newsSourceLabel setTextAlignment:NSTextAlignmentLeft];
        [_newsSourceLabel setTextColor:kAppGrayColor];
        [_newsSourceLabel setFont:UIFont_size(12.0)];
    }
    return _newsSourceLabel;
}

- (UILabel *)newsTypeLabel{
    if (!_newsTypeLabel) {
        _newsTypeLabel=[[UILabel alloc]init];
        [_newsTypeLabel setFrame:CGRectMake(self.newsImageView.x+self.newsImageView.width+self.newsTitleLabel.width/2+10.0, self.newsSourceLabel.y, self.newsSourceLabel.width, self.newsSourceLabel.height)];
        [_newsTypeLabel setTextAlignment:NSTextAlignmentRight];
        [_newsTypeLabel setTextColor:kAppGrayColor];
        [_newsTypeLabel setFont:UIFont_size(12.0)];
    }
    return _newsTypeLabel;
}

- (void)setData:(HomeListModel *)data {
    if (data) {
        _data = data;
        [self loadViewData];
    }
}

- (void)loadViewData{
    //图片
    [self.newsImageView sd_setImageWithURL:[NSURL URLWithString:_data.newsImage] placeholderImage:[UIImage imageNamed:@"tu_empty"]];
    //标题
    [self.newsTitleLabel setText:_data.newsTitle];
    //来源
    [self.newsSourceLabel setText:_data.newsSource];
    //类型
    [self.newsTypeLabel setText:_data.newsTypeName];
}

@end
