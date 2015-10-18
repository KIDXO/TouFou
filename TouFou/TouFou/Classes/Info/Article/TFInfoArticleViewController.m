//
//  TFInfoArticleViewController.m
//  TouFou
//
//  Created by KID on 15/10/14.
//  Copyright © 2015年 KID. All rights reserved.
//

#import "TFInfoArticleViewController.h"
#import "TFInfoArticleHeadCell.h"
#import "TFInfoArticleContentCell.h"
#import "TFInfoArticleAuthorCell.h"

static NSString *strIdentifier0 = @"TFInfoArticleHeadCell";
static NSString *strIdentifier1 = @"TFInfoArticleContentCell";
static NSString *strIdentifier2 = @"TFInfoArticleAuthorCell";

@interface TFInfoArticleViewController ()

@end

@implementation TFInfoArticleViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"点评文章"];
    [self setTitleCustom:@"点评文章"];
    [self createReturnButton];
    [self createCustomButton];
    
    [self initView];
    [self initData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)initView
{
    if (_imgHead) {

    }
    else {
        _imgHead = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, TFWidth, 150)];
        _imgHead.backgroundColor = [UIColor redColor];
        
        _btnFavorite = [[UIButton alloc] initWithFrame:CGRectMake(_imgHead.width - 60, _imgHead.height - 60, 60, 60)];
        [_btnFavorite setImage:[UIImage imageNamed:@"TFArticleLove"] forState:UIControlStateNormal];
        [_btnFavorite addTarget:self action:@selector(actionFavorite:) forControlEvents:UIControlEventTouchUpInside];
        
        [_imgHead addSubview:_btnFavorite];
        [_tableView addSubview:self.imgHead];
    }
    
    [self.tableView registerNib:[UINib nibWithNibName:@"TFInfoArticleHeadCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier0];
    [self.tableView registerNib:[UINib nibWithNibName:@"TFInfoArticleContentCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier1];
    [self.tableView registerNib:[UINib nibWithNibName:@"TFInfoArticleAuthorCell" bundle:nil]
         forCellReuseIdentifier:strIdentifier2];
}

- (void)initData
{
    TFInfoArticleContentInfo *info = [[TFInfoArticleContentInfo alloc] init];
    info.content = @"项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。";
    info.title = @"项目太水，团队不行，脑子也不行，哪里都不行，总之什么都不行。";
    info.name = @"哈利路亚";
    info.time = @"2015-01-01 08:40:10";
    CGFloat height = [info.content heightWithFont:[UIFont systemFontOfSize:13]
                               constrainedToWidth:TFWidth - 27];
    info.contentSize = CGSizeMake(TFWidth - 27, height);
    self.info = info;
}

- (void)createCustomButton
{
    CGRect frame = CGRectZero;
    UIImage *image = [UIImage imageNamed:@"UINavFavorite"];
    frame.size = image.size;
    
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn1 setFrame:frame];
    [btn1 setImage:image forState:UIControlStateNormal];
    [btn1 setImage:[UIImage imageNamed:@"UINavFavorited"] forState:UIControlStateSelected];
    [btn1 addTarget:self action:@selector(actionFavorite:) forControlEvents:UIControlEventTouchUpInside];
    
    image = [UIImage imageNamed:@"UINavShare"];
    frame.size = image.size;
    
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setFrame:frame];
    [btn2 setImage:image forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(actionShare:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithCustomView:btn1];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    item2.width = 10;
    UIBarButtonItem *item3 = [[UIBarButtonItem alloc] initWithCustomView:btn2];
    self.navigationItem.rightBarButtonItems = @[item3,item2,item1];
}

- (void)actionFavorite:(UIButton *)sender
{
    
}

- (void)actionShare:(UIButton *)sender
{
    
}

- (IBAction)actionTop:(UIButton *)sender
{
    [_tableView setContentOffset:CGPointMake(0, 0) animated:YES];
}

#pragma mark -
#pragma mark TableView
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 44;
    }
    else if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            return 90 + _info.contentSize.height;
        }
        else {
            return 101;
        }
    }
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 150;
    }
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return TFHeightSeparator;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else if (section == 1) {
        return 2;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        TFInfoArticleHeadCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier0];
        return cell;
    }
    else {
        if (indexPath.row == 0) {
            TFInfoArticleContentCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier1];
            cell.info = _info;
            return cell;
        }
        else {
            TFInfoArticleAuthorCell *cell = [tableView dequeueReusableCellWithIdentifier:strIdentifier2];
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -
#pragma mark ScrollView
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == _tableView) {
        CGRect frame = _imgHead.frame;
        if (scrollView.contentOffset.y < 0) {
            frame.origin.y = scrollView.contentOffset.y;
            frame.size.height = 150 - frame.origin.y;
        }
        else {
            frame.origin.y = 0;
            frame.size.height = 150;
        }
        _imgHead.frame = frame;
        _btnFavorite.origin = CGPointMake(_btnFavorite.origin.x, _imgHead.height - _btnFavorite.height);
        
        if (scrollView.contentOffset.y > TFHeight / 2 && _btnTop.hidden) {
            _btnTop.hidden = NO;
            [UIView animateWithDuration:TFAnimate animations:^{
                _btnTop.alpha = 1;
            }];
        }
        else if (scrollView.contentOffset.y <= TFHeight / 2 && !_btnTop.hidden) {
            [UIView animateWithDuration:TFAnimate animations:^{
                _btnTop.alpha = 0;
            } completion:^(BOOL finished) {
                _btnTop.hidden = YES;
            }];
        }
    }
}

@end
