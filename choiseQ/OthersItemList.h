//
//  OthersItemList.h
//  choiseQ
//
//  Created by Ken Yagura on 13/07/22.
//  Copyright (c) 2013年 Ken Yagura. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OthersItem.h"

@interface OthersItemList : NSObject{
    NSMutableArray *OthersList;
    int listCount;
               }
/*               @property (weak, nonatomic) NSMutableArray *OthersList;
               @property (
*/
- (void) initOthersList;
- (NSMutableArray *) getOthersList;
- (int) count;

@end

