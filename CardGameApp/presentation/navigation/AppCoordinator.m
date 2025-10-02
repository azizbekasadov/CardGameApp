//
//  AppCoordinator.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

#import <Foundation/Foundation.h>
#import "AppCoordinator.h"
#import "Coordinator.h"
#import "BoardSceneBuilder.h"

@interface AppCoordinator(Coordinator)

@end

@implementation AppCoordinator

- (instancetype)initWithWindow: (UIWindow *) window {
    NSParameterAssert(window);
    
    self = [super init];
 
    if (self) {
        _window = window;
        _navigationController = [[UINavigationController alloc] init];
        _navigationController.navigationBar.prefersLargeTitles = YES;
        _window.rootViewController = _navigationController;
        [_window makeKeyAndVisible];
    }
    
    return self;
}

- (void) start {
//    [self setRoot:(hasSession ? AppDestinationBoard : AppDestinationSplash) animated:NO];
    [self setRoot:AppDestinationBoard animated:NO];
}

- (void)popAnimated:(BOOL)animated {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController popViewControllerAnimated:animated];
    });
}

- (void)push:(AppDestination)destination animated:(BOOL) animated {
    UIViewController *destinationViewController = [self buildViewControllerForDestination:destination];
    
    if (!destinationViewController) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController pushViewController:destinationViewController animated:animated];
    });
}

- (void)setRoot:(AppDestination)destination animated:(BOOL) animated {
    UIViewController *destinationViewController = [self buildViewControllerForDestination:destination];
    if (!destinationViewController) {
        return;
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.navigationController setViewControllers:@[destinationViewController] animated:animated];
    });
}

- (nullable UIViewController *)buildViewControllerForDestination:(AppDestination)destination {
    switch (destination) {
        case AppDestinationBoard: {
            UIViewController *viewController = [[[BoardSceneBuilder alloc] init] build];
            return viewController;
        }
        default: {
            UIViewController *viewController = [UIViewController new];
            return viewController;
        }
    }
}

@end
