//  EditViewController.m
//  movie_memo

#import "EditViewController.h"
#import "MovieMemo.h"

@interface EditViewController ()
@end

@implementation EditViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    NSLog(@"------------");
    NSLog(@"EditView -> initWithStyle");
    NSLog(@"------------");

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

- (void)setMoviememo:(MovieMemo *)newmoviememo
{
    NSLog(@"値を受け取る");

    if(_moviememo != newmoviememo)
    {
        _moviememo = newmoviememo;
    }
}

- (void)configureView
{
    NSLog(@"------------");
    NSLog(@"editcontroller -> configureView");
    NSLog(@"------------");
    
    MovieMemo *theMovieMemo = self.moviememo;
    
    self.titleEdit.text = theMovieMemo.title;
    self.howtoEdit.text = theMovieMemo.howto;
}
@end
