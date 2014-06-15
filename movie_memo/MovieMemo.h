//  MovieMemo.m
//  movie_memo

#import <Foundation/Foundation.h>

@interface MovieMemo : NSObject

// タイトル
@property (nonatomic, copy) NSString *title;
// 鑑賞方法
@property (nonatomic, copy) NSString *howto;
// 鑑賞日
@property (nonatomic, strong) NSDate *date;
// 点数
@property (nonatomic, assign) NSNumber *grade;
// 感想
@property (nonatomic, copy) NSString *report;

// 初期化
-(id)initWithName:(NSString *)title howto:(NSString *)howto date:(NSDate *)date grade:(NSNumber *)grade report:(NSString *)report;

@end
