//  EditViewController.m
//  movie_memo

#import "EditViewController.h"

@interface EditViewController ()
@end

@implementation EditViewController

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
    [self configureView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)setMoviememo:(MovieMemo *)moviememo
{
    NSLog(@"------------");
    NSLog(@"値を受け取る");
    self.moviememo = moviememo;
    NSLog(@"------------");
}

- (void)configureView
{
    NSLog(@"------------");
    NSLog(@"editcontroller -> configureView");
    NSLog(@"------------");
    
    MovieMemo *theMovieMemo = self.moviememo;
    
    self.titleEdit.text = @"編集";
}
@end
