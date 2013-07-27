//
//  OthersItem.m
//  choiseQ
//
//  Created by Ken Yagura on 13/07/21.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import "OthersItem.h"

@implementation OthersItem
@synthesize caption;
@synthesize imgString;
@synthesize backImgString;
@synthesize url;

- (id)init
{
    if (self = [super init]) {
        // ここで初期処理
        self.title = @"";
        self.caption = @"";
        self.imgString = @"";
        self.backImgString = @"";
        self.url = @"";
    }
    return self;
}
@end
