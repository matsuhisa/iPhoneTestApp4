//  mmDataController.m
//  movie_memo

#import <Foundation/Foundation.h>

@class MovieMemo;

@interface mmDataController : NSObject

// MovieMemo モデルをいれた配列
@property (nonatomic, copy) NSMutableArray *masterList;

// 
- (NSUInteger)countOfList;
- (MovieMemo *)objectInListAtIndex:(NSUInteger)theIndex;
- (void)addMovieMemo:(MovieMemo *)movieMemo;


@end
