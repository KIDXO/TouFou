//
//  TFInfoViewController.h
//  TouFou
//
//  Created by KID on 15/10/11.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DZNSegmentedControl.h"
#import "TFInfoIntroTableView.h"
#import "TFInfoScoreTableView.h"
#import "TFInfoAdviceTableView.h"
#import "TFInfoCommentTableView.h"
#import "HPGrowingTextView.h"

@interface TFInfoViewController : UIBaseViewController
<DZNSegmentedControlDelegate,
 HPGrowingTextViewDelegate,
 TFInfoIntroTableViewDelegate,
 TFInfoScoreTableViewDelegate,
 TFInfoAdviceTableViewDelegate,
 TFInfoCommentTableViewDelegate>

@property (nonatomic, weak)   IBOutlet UIImageView              *imgPhoto;
@property (nonatomic, weak)   IBOutlet UILabel                  *labTitle;
@property (nonatomic, weak)   IBOutlet UIButton                 *btnWrite;
@property (nonatomic, weak)   IBOutlet UIView                   *viewLine;

@property (nonatomic, weak)   IBOutlet UIView                   *viewInfo;
@property (nonatomic, weak)   IBOutlet UIView                   *viewDark;
@property (nonatomic, weak)   IBOutlet UIView                   *viewSegment;
@property (nonatomic, weak)   IBOutlet UIView                   *viewComment;

@property (nonatomic, strong)          HPGrowingTextView        *textComment;

@property (nonatomic, weak)   IBOutlet UIScrollView             *scrollView;
@property (nonatomic, weak)   IBOutlet UIScrollView             *scrollViewTable;
@property (nonatomic, weak)   IBOutlet TFInfoIntroTableView     *tableViewIntro;
@property (nonatomic, weak)   IBOutlet TFInfoScoreTableView     *tableViewScore;
@property (nonatomic, weak)   IBOutlet TFInfoAdviceTableView    *tableViewAdvice;
@property (nonatomic, weak)   IBOutlet TFInfoCommentTableView   *tableViewComment;

@property (nonatomic, strong) UIImageView                       *imgCommentNone;

@property (nonatomic, strong) DZNSegmentedControl               *controlSegment;

@end
