//  mmMasterViewController.h
//  movie_memo

#import <UIKit/UIKit.h>

@class mmDataController;

@interface mmMasterViewController : UITableViewController
@property (strong, nonatomic) mmDataController *dataController;

// 巻き戻し
- (IBAction)addDone:(UIStoryboardSegue *)segue;
- (IBAction)addCancel:(UIStoryboardSegue *)segue;
@end
