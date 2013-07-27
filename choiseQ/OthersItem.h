//
//  OthersItem.h
//  choiseQ
//
//  Created by Ken Yagura on 13/07/21.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OthersItem : NSObject
// 番号
@property (nonatomic) int number;
// 番号下に表示するキャプション
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *caption;
//紹介ページ用の画像ファイル名
@property (strong, nonatomic) NSString * imgString;
//紹介ページのCell背景のファイル名
@property (strong, nonatomic) NSString *backImgString;
//紹介先のページURL
@property (strong, nonatomic) NSString *url;

@end

