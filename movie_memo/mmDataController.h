//  mmDataController.m
//  movie_memo

#import <Foundation/Foundation.h>

@class MovieMemo;

@interface mmDataController : NSObject

// MovieMemo モデルをいれた配列
@property (nonatomic, copy) NSMutableArray *masterList;

// データーを数える
- (NSUInteger)countOfList;

// 指定のデーターを返す
- (MovieMemo *)objectInListAtIndex:(NSUInteger)theIndex;

// 追加
- (void)addMovieMemo:(MovieMemo *)movieMemo;

// 更新
- (void)updateMovieMemo:(MovieMemo *)movieMemo targetIndex:(NSUInteger)targetIndex;

// 並び替え

// 削除

@end
