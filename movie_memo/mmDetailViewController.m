//  mmDetailViewController.m
//  movie_memo

#import "mmDetailViewController.h"
#import "EditViewController.h"
#import "MovieMemo.h"


@interface mmDetailViewController ()
- (void)configureView;
//- (void)editViewControllerFinsh:(EditViewController *)controller
@end

@implementation mmDetailViewController

//
-(void)editViewControllerFinsh:(EditViewController *)controller
{
    NSLog(@"---------------");
    NSLog(@"どんな順番？");
    NSLog(@"---------------");
}

// キャンセル
- (IBAction)editCancel:(UIStoryboardSegue *)segue
{
    NSLog(@"---------------");
    NSLog(@"編集のキャンセル");
    NSLog(@"---------------");
    
    if ([[segue identifier] isEqualToString:@"CancelEdit"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

// 保存
- (IBAction)editDone:(UIStoryboardSegue *)segue
{
    NSLog(@"---------------");
    NSLog(@"編集の保存");
    NSLog(@"---------------");
    
    if ([[segue identifier] isEqualToString:@"ReturnEdit"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

//
// 送る
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"---------------");
    if ([[segue identifier] isEqualToString:@"pushEditView"]) {
        NSLog(@"送る");
        /*
         UINavigationController が呼び出されている
         そのため、setMoviememo メソッドがない、と言われる
         http://qiita.com/roothybrid7/items/532b63175da30fa9a2b1
         */
        //[[segue destinationViewController] setDelegate:self];
        [[segue destinationViewController] setMoviememo:self.moviememo];
        
        /*
         http://midorina.net/green/2013/08/storyboard%E3%81%A7%E9%80%94%E4%B8%AD%E3%81%AEview%E3%81%8B%E3%82%89navigationcontroller%E3%82%92%E4%BD%BF%E3%81%84%E3%81%9F%E3%81%84%E5%A0%B4%E5%90%88.html
         */
        //UINavigationController *navigationController = segue.destinationViewController;
        //EditViewController *editViewController =[[navigationController viewControllers] objectAtIndex:0];
        //editViewController.delegate=self;
        
        //[editViewController setDelegate:self];
        //[editViewController setMoviememo:_moviememo];
        
    }else{
    NSLog(@"送れない");
    }
    NSLog(@"---------------");
}

#pragma mark - Managing the detail item

// セッター
- (void)setMoviememo:(MovieMemo *)newMovieMemo
{
    if(_moviememo != newMovieMemo)
    {
        _moviememo = newMovieMemo;
        [self configureView];
    }
}

- (void)configureView
{
    //
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
