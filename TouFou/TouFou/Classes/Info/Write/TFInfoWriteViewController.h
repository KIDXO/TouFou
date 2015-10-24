//
//  TFInfoWriteViewController.h
//  TouFou
//
//  Created by KID on 15/10/13.
//  Copyright © 2015年 KID. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TFInfoWriteViewController : UIBaseViewController

@property (nonatomic, weak)   IBOutlet UIView                   *viewAgree;

@property (nonatomic, weak)   IBOutlet UITextField              *textTitle;
@property (nonatomic, weak)   IBOutlet UITextView               *textContent;

@property (nonatomic, weak)   IBOutlet UISegmentedControl       *controlSegment1;
@property (nonatomic, weak)   IBOutlet UISegmentedControl       *controlSegment2;
@property (nonatomic, weak)   IBOutlet UISegmentedControl       *controlSegment3;

@end
