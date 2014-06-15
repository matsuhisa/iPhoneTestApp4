//  MovieMemo.m
//  movie_memo

#import "MovieMemo.h"

@implementation MovieMemo

-(id)initWithName:(NSString *)title howto:(NSString *)howto date:(NSDate *)date grade:(NSNumber *)grade report:(NSString *)report
{
    self = [super init];
    if (self) {
        _title  = title;
        _howto  = howto;
        _date   = date;
        _grade  = grade;
        _report = report;
        return self;
    }
    return nil;
}

@end
