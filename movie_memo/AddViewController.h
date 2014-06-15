//  AddViewController.h
//  movie_memo

#import <UIKit/UIKit.h>

@class MovieMemo;

@interface AddViewController : UITableViewController
<UITextFieldDelegate>

@property (strong,nonatomic) MovieMemo *moviememo;

// 
@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UITextField *howtoInput;
@property (weak, nonatomic) IBOutlet UITextField *gradeInput;
@property (weak, nonatomic) IBOutlet UIDatePicker *dateInput;

@end
