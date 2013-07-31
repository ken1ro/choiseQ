//
//  OthersViewController.m
//  choiseQ
//
//  Created by Ken Yagura on 13/07/21.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import "OthersViewController.h"

@interface OthersViewController ()

@end

@implementation OthersViewController
@synthesize _collectionView;
@synthesize items;
@synthesize tmpItem;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
 
    }
    return self;
}

- (void)loadView{
    [super loadView];
    //Othersに入れる要素数
    items = [[OthersItemList alloc] init];
    tmpItem = [[OthersItem alloc]init];
/*    _items = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        OthersItem *item = [[OthersItem alloc] init];
        item.number = i+1;
        item.caption = [NSString stringWithFormat:@"caption%d", item.number];
        [_items addObject:item];
    }
 */
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
    // STCustomCollectionView.xibを指定して（.xibは省略）、UINibオブジェクトを生成
    UINib *nib = [UINib nibWithNibName:@"OthersCollectionViewCell" bundle:nil];
    // UICollectionViewに項目表示に使うセルとして登録
    [_collectionView registerNib:nib forCellWithReuseIdentifier:@"CellId"];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    
    //////////////////////////    広告表示用    //////////////////////////
    ADBannerView *adView = [[ADBannerView alloc] initWithFrame:CGRectZero];
    //最初は画面外に表示
    adView.frame = CGRectOffset(adView.frame, 0.0f, self.view.frame.size.height);
    adView.delegate = self;
    // 縦向き    adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierLandscape;
    // 横向き    adView.currentContentSizeIdentifier = ADBannerContentSizeIdentifierPortrait;
    [self.view addSubview:adView];
    [self viewIAdBox:adView];
    //////////////////////////// ここまで広告　//////////////////////////////
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        NSLog(@"count %d", items.count);
    return items.count;
}

// ここで各CELLの内容を一つずつ格納していく
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // セルオブジェクトを得る
    OthersCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"CellId" forIndexPath:indexPath];
    // 指定位置のSTCollectionItemオブジェクトを得る
    NSLog(@"cell number is : %d",indexPath.row);
    OthersItem *item = [items.getOthersList objectAtIndex:indexPath.row];
    // セルオブジェクトのプロパティを設定する
    cell.titleLabel.text = item.title;
    cell.mainTextView.text = item.caption;
    cell.mainImg.image = [UIImage imageNamed:item.imgString];
    cell.cellBackImg.image = [UIImage imageNamed:item.backImgString];
    
    return cell;
}

//Cell選択時
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    tmpItem = [items.getOthersList objectAtIndex:indexPath.row];
    NSString *message = [NSString stringWithFormat:@"%@\n%@", tmpItem.title, tmpItem.caption];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"safariで開きます。", nil];
    alertView.delegate = self;
    [alertView show];
}
// アラートのボタンが押された時に呼ばれるデリゲート
-(void)alertView:(UIAlertView*)alertView
clickedButtonAtIndex:(NSInteger)buttonIndex {
    NSString *url = @"";
    switch (buttonIndex) {
        case 0:
            //１番目のボタンが押されたときの処理を記述する
            url = self.tmpItem.url;
            NSLog(@"test0 %@",url);
            [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];            break;
            break;

    }
    
}

#pragma mark - iAd Delegate
/*//////////////////////////////////////////////////////////
 広告表示用の諸々の関数
 広告表示する場合はここから下が必要
 *///////////////////////////////////////////////////////////


-(void)viewIAdBox:(ADBannerView *)_adView{
    /*** 広告の配置 ***/
    bannerIsVisible = NO;
    
    
}
// 広告のロード
- (void)bannerViewDidLoadAd:(ADBannerView *)banner
{
    NSLog(@"Info in %@ : loaded adbanner .. ",NSStringFromClass([self class]));
    // 広告が表示されていない場合は表示する
    if (!bannerIsVisible) {
        [UIView beginAnimations:@"animateAdBannerOn" context:NULL];
        banner.frame = CGRectOffset(CGRectZero, 0, self.view.frame.size.height-banner.frame.size.height);
        [UIView commitAnimations];
        bannerIsVisible = YES;
    }
}

// 広告のタップ
- (BOOL)bannerViewActionShouldBegin:(ADBannerView *)banner willLeaveApplication:(BOOL)willLeave
{
    // いつでも広告表示OK
    return YES;
}

// 広告読み込みエラー
- (void)bannerView:(ADBannerView *)banner didFailToReceiveAdWithError:(NSError *)error
{
    NSLog(@"Err in %@ : error in loading adbanner .. ",NSStringFromClass([self class]));
    if (bannerIsVisible == YES) {
        [UIView beginAnimations:@"animateAdBannerOff" context:NULL];
        banner.frame = CGRectOffset(CGRectZero, 0, self.view.frame.size.height+banner.frame.size.height);
        [UIView commitAnimations];
        bannerIsVisible = NO;
    }
}
/*//////////////////////////////////////////////////////////
 広告表示用の諸々の関数
 広告表示する場合はここから上が必要
 *///////////////////////////////////////////////////////////



@end
