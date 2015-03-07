//
//  TodayViewController.m
//  Widget
//
//  Created by 麻生 拓弥 on 2015/03/07.
//  Copyright (c) 2015年 麻生 拓弥. All rights reserved.
//

#import "TodayViewController.h"
#import <NotificationCenter/NotificationCenter.h>

@interface TodayViewController () <NCWidgetProviding>

@end

@implementation TodayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 用意する画面サイズ(横は固定らしい，縦を長くしすぎるのはNG，スクロールも使用不可)
    self.preferredContentSize = CGSizeMake(320, 300);
    
    // Label表示用
    _label1.text = @"Numero uno";
    _label2.text = @"Numero due";
    _label3.text = @"Numero tre";
    
    // 画像表示用
    _image1.image = [UIImage imageNamed:@"image1.png"];
    _image2.image = [UIImage imageNamed:@"image2.png"];
    _image3.image = [UIImage imageNamed:@"image3.png"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)widgetPerformUpdateWithCompletionHandler:(void (^)(NCUpdateResult))completionHandler {
    // Perform any setup necessary in order to update the view.
    
    // If an error is encountered, use NCUpdateResultFailed
    // If there's no update required, use NCUpdateResultNoData
    // If there's an update, use NCUpdateResultNewData

    completionHandler(NCUpdateResultNewData);
}

// 余白設定(上の余白，横(左)の余白，横(右)の余白，下の余白です)
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
{
    UIEdgeInsets insets = UIEdgeInsetsMake(0, defaultMarginInsets.left, 30, 10);
    return insets;
}

/*
// 余白 0 の設定はこっち
- (UIEdgeInsets)widgetMarginInsetsForProposedMarginInsets:(UIEdgeInsets)defaultMarginInsets
{
    return UIEdgeInsetsZero;
}
*/

// ボタンを押したらアプリに誘導
- (IBAction)action:(id)sender {
    
    // 作成した URL スキームを指定
    NSURL *myURL = [NSURL URLWithString:@"test1://"];
    // にとばす
    [self.extensionContext openURL:myURL completionHandler:nil];
}

@end
