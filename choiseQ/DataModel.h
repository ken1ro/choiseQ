//
//  DataModel.h
//  choiseQ
//
//  Created by Toshiaki Hidekuma on 6/5/13.
//  Copyright (c) 2013 Ken Yagura. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataModel : NSObject

+ (NSMutableArray *)getQuestions :(NSMutableArray *)array;
+ (NSMutableArray *)getAnswers   :(NSMutableArray *)array;
+ (NSString *)getDescription     :(NSNumber *) selectId;
+ (NSString *)getQuestion        :(NSNumber *) selectId;
+ (NSString *)getChoiseA         :(NSNumber *) selectId;
+ (NSString *)getChoiseB         :(NSNumber *) selectId;
+ (NSString *)getChoiseC         :(NSNumber *) selectId;
+ (NSString *)getChoiseD         :(NSNumber *) selectId;
+ (NSString *)getAnswer          :(NSNumber *) selectId;
+ (int)getQuestionCount;

@end
