//  AddViewController.m
//  movie_memo

#import "AddViewController.h"
#import "MovieMemo.h"

@interface AddViewController ()
@end

@implementation AddViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

// マスターに送信する
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        // 入力状況を判別する
        if (
            [self.titleInput.text length] ||
            [self.howtoInput.text length] ||
            [self.gradeInput.text length]
        ){
            MovieMemo *moviememo;
            // 評点
            int i = [self.gradeInput.text intValue];
            NSNumber *grade = [NSNumber numberWithInt:i];
 
            // 日付
            NSDate *today = [NSDate date];
            
            // 初期化
            moviememo = [
            [MovieMemo alloc]initWithName:self.titleInput.text howto:self.howtoInput.text date:today grade:grade report:@"感想です"
            ];
            self.moviememo = moviememo;
        }
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
