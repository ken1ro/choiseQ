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
    _items = [NSMutableArray arrayWithCapacity:10];
    for (int i = 0; i < 10; i++) {
        OthersItem *item = [[OthersItem alloc] init];
        item.number = i+1;
        item.caption = [NSString stringWithFormat:@"caption%d", item.number];
        [_items addObject:item];
    }
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
    NSLog(@"viewDid");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
        NSLog(@"count");
    return _items.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // セルオブジェクトを得る
    OthersCollectionViewCell *cell = [_collectionView dequeueReusableCellWithReuseIdentifier:@"CellId" forIndexPath:indexPath];
    // 指定位置のSTCollectionItemオブジェクトを得る
    OthersItem *item = [_items objectAtIndex:indexPath.row];
    // セルオブジェクトのプロパティを設定する
    cell.captionLabel.text = item.caption;
    
    return cell;
}

//Cell選択時
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    OthersItem *item = [_items objectAtIndex:indexPath.row];
    NSString *message = [NSString stringWithFormat:@"%d\n%@", item.number, item.caption];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:nil
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:nil
                                              otherButtonTitles:@"OK", nil];
    [alertView show];
}

@end
