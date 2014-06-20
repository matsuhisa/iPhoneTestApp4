//  mmDetailViewController.m
//  movie_memo

#import "mmDetailViewController.h"
#import "mmDataController.h"
#import "EditViewController.h"
#import "MovieMemo.h"

@interface mmDetailViewController ()
//- (void)configureView;
- (void)editViewControllerFinsh:(EditViewController *)controller;
@end

@implementation mmDetailViewController

//
-(void)editViewControllerFinsh:(EditViewController *)controller
{
}

// ------------
// segue
// ------------

// 編集のキャンセル
- (IBAction)editCancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelEdit"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

// 編集の保存
- (IBAction)editDone:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnEdit"]) {
        EditViewController *editController = [segue sourceViewController];

        //NSLog(@"%@", self.moviememo.title);

        MovieMemo *theMovieMemo = self.moviememo;
        
        theMovieMemo.title = editController.titleEdit.text;
        theMovieMemo.howto = editController.howtoEdit.text;
        
        self.moviememo = theMovieMemo;
        
        [self.dataController updateMovieMemo:theMovieMemo targetIndex:self.moviewMemoIndex.unsignedIntegerValue];
        [self configureView];
    }
}

// 編集画面への遷移
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"pushEditView"]) {
        [[segue destinationViewController] setMoviememo:self.moviememo];
    }
}

#pragma mark - Managing the detail item

// ------------
// setter
// ------------
- (void)setMoviememo:(MovieMemo *)newMovieMemo
{
    if(_moviememo != newMovieMemo)
    {
        _moviememo = newMovieMemo;
        [self configureView];
    }
}

- (void)setMoviewMemoIndex:(NSNumber *)newMoviewMemoIndex
{
    if(_moviewMemoIndex != newMoviewMemoIndex)
    {
        _moviewMemoIndex = newMoviewMemoIndex;
        [self configureView];
    }
}

- (void)setDataController:(mmDataController *)newDataController
{
    if(_dataController != newDataController)
    {
        _dataController = newDataController;
        [self configureView];
    }
}

// ------------
// 表示処理
// ------------
- (void)configureView
{
    MovieMemo *theMovieMemo = self.moviememo;

    // 日付
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];

    // 
    if(theMovieMemo)
    {
        self.title = theMovieMemo.title;
        
        self.titleLabel.text  = theMovieMemo.title;
        self.howtoLabel.text  = theMovieMemo.howto;
        self.dateLabel.text   = [formatter stringFromDate:(NSDate *)theMovieMemo.date];
        self.gradeLabel.text  = [theMovieMemo.grade stringValue];
        self.reportLabel.text = theMovieMemo.report;
    }
}

- (void)awakeFromNib
{
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
