//  EditViewController.m
//  movie_memo

#import "EditViewController.h"
#import "MovieMemo.h"

@interface EditViewController ()
@end

@implementation EditViewController

- (IBAction)editDone:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnEdit"]) {
        [self.delegate editViewControllerFinsh:self];
    }
}

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

- (void)setMoviememo:(MovieMemo *)newmoviememo
{
    if(_moviememo != newmoviememo)
    {
        _moviememo = newmoviememo;
    }
}

- (void)configureView
{
    MovieMemo *theMovieMemo = self.moviememo;
    
    self.titleEdit.text = theMovieMemo.title;
    self.howtoEdit.text = theMovieMemo.howto;
}
@end
