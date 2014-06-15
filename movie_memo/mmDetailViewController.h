//  mmDetailViewController.h
//  movie_memo

#import <UIKit/UIKit.h>
#import "EditViewController.h"

@class MovieMemo;

//@interface mmDetailViewController : UITableViewController <EditViewDelegate>
@interface mmDetailViewController : UITableViewController

// 
@property (strong, nonatomic) MovieMemo *moviememo;

// タイトル
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

// 鑑賞方法
@property (weak, nonatomic) IBOutlet UILabel *howtoLabel;

// 鑑賞日
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

// 点数
@property (weak, nonatomic) IBOutlet UILabel *gradeLabel;

// 感想
@property (weak, nonatomic) IBOutlet UILabel *reportLabel;

// 巻き戻し
- (IBAction)editDone:(UIStoryboardSegue *)segue;
- (IBAction)editCancel:(UIStoryboardSegue *)segue;

@end
