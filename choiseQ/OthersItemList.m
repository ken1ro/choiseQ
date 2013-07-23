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
    
    /*** １個目の要素 ***/
    OthersItem *item = [[OthersItem alloc] init];
    item.number = 1;
    item.caption = [NSString stringWithFormat:@"caption%d", item.number];
    item.img.image = [UIImage imageNamed:@"icon_kamera_190x190.png"];
    item.backImg.image = [UIImage imageNamed:@"green_table.png"];
    item.backImgString = @"green_table.png";
    
    [OthersList addObject:item];
    
    /*** 2個目の要素 ***/
    item = [[OthersItem alloc] init];
    item.number = 2;
    item.caption = [NSString stringWithFormat:@"caption%d", item.number];
    item.img.image = [UIImage imageNamed:@"yellow_table.png"];
    item.backImg.image = [UIImage imageNamed:@"yellow_table.png"];
    item.backImgString = @"yellow_table.png";
    
    
    /*** 3個目の要素 ***/
    [OthersList addObject:item];
    item = [[OthersItem alloc] init];
    item.number = 3;
    item.caption = [NSString stringWithFormat:@"caption%d", item.number];
    item.img.image = [UIImage imageNamed:@"blue_table.png"];
    item.backImg.image = [UIImage imageNamed:@"blue_table.png"];
    item.backImgString = @"blue_table.png";
    [OthersList addObject:item];

    
}

- (NSMutableArray *) getOthersList{
    
    return OthersList;
}
@end
