//  mmMasterViewController.m
//  movie_memo

#import "mmMasterViewController.h"
#import "mmDetailViewController.h"
#import "AddViewController.h"
#import "mmDataController.h"
#import "MovieMemo.h"


@implementation mmMasterViewController

// キャンセル
- (IBAction)addCancel:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"CancelInput"]) {
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

// 保存
- (IBAction)addDone:(UIStoryboardSegue *)segue
{
    if ([[segue identifier] isEqualToString:@"ReturnInput"]) {
        AddViewController *addViewController = [segue sourceViewController];
        if(addViewController.moviememo)
        {
            [self.dataController addMovieMemo:addViewController.moviememo];
            [[self tableView] reloadData];
        }
        [self dismissViewControllerAnimated:YES completion:NULL];
    }
}

// ------------------------------------------------------------
// ------------------------------------------------------------

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.dataController = [[mmDataController alloc] init];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

//
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dataController countOfList];
}

//
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"MMCell";
    // 日付
    static NSDateFormatter *formatter = nil;
    if (formatter == nil) {
        formatter = [[NSDateFormatter alloc] init];
        [formatter setDateStyle:NSDateFormatterMediumStyle];
    }
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm"];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    MovieMemo *mmemo = [self.dataController objectInListAtIndex:indexPath.row];

    [[cell textLabel] setText:mmemo.title];
    [[cell detailTextLabel] setText:[formatter stringFromDate:(NSDate *)mmemo.date]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"])
    {
        mmDetailViewController *detailViewController = [segue destinationViewController];
        detailViewController.moviememo = [self.dataController objectInListAtIndex:[self.tableView indexPathForSelectedRow].row];

    }
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}
@end
