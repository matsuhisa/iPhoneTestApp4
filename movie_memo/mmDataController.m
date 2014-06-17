//  mmDataController.m
//  movie_memo

#import "mmDataController.h"
#import "MovieMemo.h"

// クラスの拡張
@interface mmDataController ()
- (void)initializeDefaultDataList;
@end

@implementation mmDataController

// 初期化の実行
- (id)init {
    if (self = [super init]) {
        [self initializeDefaultDataList];
        return self;
    }
    return nil;
}

// 初期（デフォルトの）データーを用意
- (void)initializeDefaultDataList
{
    NSMutableArray *tmpList = [[NSMutableArray alloc] init];
    self.masterList = tmpList;

    NSDate *today = [NSDate date];
    NSNumber *grade=@1800;

    MovieMemo *movie;
    movie = [[MovieMemo alloc]initWithName:@"題名" howto:@"鑑賞方法" date:today grade:grade report:@"感想です"];
    [self addMovieMemo:movie];
}

//
- (void)setMasterList:(NSMutableArray *)newList {
    if (_masterList != newList) {
        _masterList = [newList mutableCopy];
    }
}

// 更新処理
- (void)updateMovieMemo:(MovieMemo *)movieMemo targetIndex:(NSUInteger)targetIndex{
    [self.masterList replaceObjectAtIndex:targetIndex withObject:movieMemo];
}

// 追加処理
- (void)addMovieMemo:(MovieMemo *)movie {
    [self.masterList addObject:movie];
}

// データーを数える
- (NSUInteger)countOfList {
    return [self.masterList count];
}

// 指定のデーターを返す
- (MovieMemo *)objectInListAtIndex:(NSUInteger)theIndex {
    return [self.masterList objectAtIndex:theIndex];
}

@end
