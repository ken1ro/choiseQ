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
@property (strong, nonatomic) NSString *caption;

@end

