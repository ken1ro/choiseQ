//
//  OthersItemList.m
//  choiseQ
//
//  Created by Ken Yagura on 13/07/22.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import "OthersItemList.h"

@implementation OthersItemList


- (id)init
{
    if (self = [super init]) {
        // ここで初期処理
        //リストのメンバー数
        listCount = 3;
        OthersList = [NSMutableArray arrayWithCapacity:listCount];
        [self initOthersList];

    }
    return self;
}

- (int) count{
    return OthersList.count;
}

- (void)initOthersList{
    
    /****************************************************************
     * ここからOthersListの要素を直書きしていく
     *　要素数は上記initで指定しているため、その個数分要素を記入していく必要がある。
     ****************************************************************/
    /*** 以下フォーマット **********************************************
    item = [[OthersItem alloc] init];
    item.number = 1;
    item.title = @"作者のアプリ開発ブログ";
    item.caption = @"アプリ作成者のアプリ開発ブログです。本アプリの開発や、アプリ開発のメモなど気ままなブログですのでお気軽にご確認ください。";
    item.imgString = @"kok_logo_90x90.png";
    item.backImgString = @"green_table.png";
    item.url = @"http://ameblo.jp/kok-support/";
    [OthersList addObject:item];
     ***  ここまでフォーマット ******************************************/
    
    /*** １個目の要素 ***/
    OthersItem *item = [[OthersItem alloc] init];
    item.number = 1;
    item.title = @"作者のアプリ開発ブログ";
    item.caption = @"アプリ作成者のアプリ開発ブログです。本アプリの開発や、アプリ開発のメモなど気ままなブログですのでお気軽にご確認ください。";
    item.imgString = @"kok_logo_90x90.png";
    item.backImgString = @"green_table.png";
    item.url = @"http://ameblo.jp/kok-support/";
    
    [OthersList addObject:item];
    
    /*** 2個目の要素 ***/
    item = [[OthersItem alloc] init];
    item.number = 2;
    item.title = @"作者のアプリ開発ブログ";
    item.caption = [NSString stringWithFormat:@"caption%d", item.number];
    item.imgString = @"kok_logo_90x90.png";
    item.backImgString = @"yellow_table.png";
    item.url = @"http://ameblo.jp/kok-support/";
    [OthersList addObject:item];
    
    /*** 3個目の要素 ***/
    item = [[OthersItem alloc] init];
    item.number = 3;
    item.title = @"作者のアプリ開発ブログ";
    item.caption = [NSString stringWithFormat:@"caption%d", item.number];
    item.imgString = @"kok_logo_90x90.png";
    item.backImgString = @"blue_table.png";
    item.url = @"http://ameblo.jp/kok-support/";
    [OthersList addObject:item];

    /*** 4個目の要素 ***/
    item = [[OthersItem alloc] init];
    item.number = 4;
    item.title = @"作者のアプリ開発ブログ";
    item.caption = [NSString stringWithFormat:@"caption%d", item.number];
    item.imgString = @"kok_logo_90x90.png";
    item.backImgString = @"green_table.png";
    item.url = @"http://ameblo.jp/kok-support/";
    [OthersList addObject:item];

    /*** 5個目の要素 ***/
    item = [[OthersItem alloc] init];
    item.number = 5;
    item.title = @"作者のアプリ開発ブログ";
    item.caption = [NSString stringWithFormat:@"caption%d", item.number];
    item.imgString = @"kok_logo_90x90.png";
    item.backImgString = @"yellow_table.png";
    item.url = @"http://ameblo.jp/kok-support/";
    [OthersList addObject:item];

}

- (NSMutableArray *) getOthersList{
    
    return OthersList;
}
@end
