//
//  DataModel.m
//  choiseQ
//
//  Created by Toshiaki Hidekuma on 6/5/13.
//  Copyright (c) 2013 Ken Yagura. All rights reserved.
//

#import "DataModel.h"
#import "FMDatabase.h"
#import "FMResultSet.h"

// テーブルの情報の定義
#define DB_FILE_NAME  @"choiseQ.sqlite"
#define DB_TABLE_COLUMN_ANSWER      @"answer"
#define DB_TABLE_COLUMN_CHOISEA     @"choisea"
#define DB_TABLE_COLUMN_CHOISEB     @"choiseb"
#define DB_TABLE_COLUMN_CHOISEC     @"choisec"
#define DB_TABLE_COLUMN_CHOISED     @"choised"
#define DB_TABLE_COLUMN_QUESTION    @"question"
#define DB_TABLE_COLUMN_DESCRIPTION @"description"

// 実行するSQL文の定義
#define SQL_SELECT       @"select * from qalist;"
#define SQL_SELECT_ID    @"select * from qalist where id = ?;"
#define SQL_SELECT_COUNT @"select count(*) as count from qalist;"


@implementation DataModel

+ (NSString *)getDbPath
{
    NSArray*    paths  = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES );
    NSString*   dir    = [paths objectAtIndex:0];
    NSString*   dbpath = [dir stringByAppendingPathComponent:DB_FILE_NAME];

    //NSLog(@"%@", dbpath);
    
    // もしシミュレーターのDocumentsフォルダにDBが無ければ、.appフォルダからコピー
    NSFileManager *fm = [NSFileManager defaultManager];
    NSError *error;
    //if(![fm fileExistsAtPath:dbpath]){
        NSString *defaultDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:DB_FILE_NAME];
        [fm copyItemAtPath:defaultDBPath toPath:dbpath error:&error];
    //}

    return dbpath;
}

+ (NSMutableArray *)selectColumns :(NSMutableArray *)array dbOlumnName:(NSString *) columnName
{
    FMDatabase* db     = [FMDatabase databaseWithPath:self.getDbPath];
    
	[db open];
    
    FMResultSet *rs = [db executeQuery:SQL_SELECT];
    //NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    
    NSString *string;
    
    while ( [rs next] ) {
        string = [rs stringForColumn:columnName];
        //NSLog(@"%@", string);
        [array addObject:string];
    }
	
    [rs close];
	[db close];
	
	return array;
}

+ (NSString *)selectColumn : (NSNumber *) selectId dbOlumnName:(NSString *) columnName
{
    FMDatabase* db     = [FMDatabase databaseWithPath:self.getDbPath];
    
	[db open];
    
    FMResultSet *rs = [db executeQuery:SQL_SELECT_ID, selectId];
    //NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    
    NSString *string;
    
    while ( [rs next] ) {
        string = [rs stringForColumn:columnName];
        //NSLog(@"%@", string);
    }
	
    [rs close];
	[db close];
	
	return string;
}

+ (int)getQuestionCount
{
    FMDatabase* db     = [FMDatabase databaseWithPath:self.getDbPath];
    
	[db open];
    
    FMResultSet *rs = [db executeQuery:SQL_SELECT_COUNT];
    //NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    
    int count;
    
    while ( [rs next] ) {
        count = [rs intForColumn:@"count"];
        //NSLog(@"%@", string);
    }
	
    [rs close];
	[db close];
	
	return count;
}

+ (NSMutableArray *)getQuestions : (NSMutableArray *) array
{
    return [self selectColumns:array dbOlumnName:DB_TABLE_COLUMN_QUESTION];
}

+ (NSMutableArray *)getAnswers : (NSMutableArray *) array
{
    return [self selectColumns:array dbOlumnName:DB_TABLE_COLUMN_ANSWER];
}

+ (NSString *)getDescription: (NSNumber *) selectId
{
    return [self selectColumn:selectId dbOlumnName:DB_TABLE_COLUMN_DESCRIPTION];
}

+ (NSString *)getQuestion : (NSNumber *) selectId
{
    return [self selectColumn:selectId dbOlumnName:DB_TABLE_COLUMN_QUESTION];
}

+ (NSString *)getChoiseA : (NSNumber *) selectId
{
    return [self selectColumn:selectId dbOlumnName:DB_TABLE_COLUMN_CHOISEA];
}

+ (NSString *)getChoiseB : (NSNumber *) selectId
{
    return [self selectColumn:selectId dbOlumnName:DB_TABLE_COLUMN_CHOISEB];
}

+ (NSString *)getChoiseC : (NSNumber *) selectId
{
    return [self selectColumn:selectId dbOlumnName:DB_TABLE_COLUMN_CHOISEC];
}

+ (NSString *)getChoiseD : (NSNumber *) selectId
{
    return [self selectColumn:selectId dbOlumnName:DB_TABLE_COLUMN_CHOISED];
}

+ (NSString *)getAnswer : (NSNumber *) selectId
{
    return [self selectColumn:selectId dbOlumnName:DB_TABLE_COLUMN_ANSWER];
}

@end
