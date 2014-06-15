//  MyNavigationController.h
//  movie_memo

#import <UIKit/UIKit.h>

// ChildViewControllerで実装
@protocol MyNavigationControllerDelegate <NSObject>
- (UIStoryboardSegue *)segueInNavigationControllerForUnwindingToViewController:(UIViewController *)toViewController fromViewController:(UIViewController *)fromViewController identifier:(NSString *)identifier;
@end

@interface MyNavigationController : UINavigationController
@end
