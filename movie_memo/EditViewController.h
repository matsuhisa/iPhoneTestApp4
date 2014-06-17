//  EditViewController.h
//  movie_memo

#import <UIKit/UIKit.h>

@class MovieMemo;
@class EditViewController;

// プロトコルとデリゲートメソッドの宣言
@protocol EditViewDelegate
-(void)editViewControllerFinsh:(EditViewController *)controller;
@end

@interface EditViewController : UITableViewController
<UITextFieldDelegate,EditViewDelegate>

    // 値を受け取る
    -(void)setMoviememo:(MovieMemo *)moviememo;

    @property (weak, nonatomic) id <EditViewDelegate> delegate;

    @property (strong,nonatomic) MovieMemo *moviememo;

    @property (weak, nonatomic) IBOutlet UITextField *titleEdit;
    @property (weak, nonatomic) IBOutlet UITextField *howtoEdit;
    @property (weak, nonatomic) IBOutlet UITextField *rangeEdit;

    - (IBAction)editDone:(UIStoryboardSegue *)segue;
@end
