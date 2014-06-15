//  MyNavigationController.m
//  movie_memo

#import "MyNavigationController.h"

@implementation MyNavigationController
- (UIStoryboardSegue *)segueForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier
{
    // MARK: 実際の戻り先ChildViewControllerに処理を任せる
    if ([toViewController conformsToProtocol:@protocol(MyNavigationControllerDelegate)]) {
        id <MyNavigationControllerDelegate> destinationViewController = (id <MyNavigationControllerDelegate>)toViewController;
        UIStoryboardSegue *segue = [destinationViewController segueInNavigationControllerForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:identifier];
        if (segue) {
            return segue;
        }
    }
    
    return [super segueForUnwindingToViewController:toViewController fromViewController:fromViewController identifier:identifier];
}
@end
