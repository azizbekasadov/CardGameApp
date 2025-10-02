//
//  AppCoordinator.h
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

@import UIKit;
@import Foundation;

#import "Coordinator.h"
#import "AppDestination.h"


@interface AppCoordinator : NSObject <Coordinator>

@property (nonatomic, strong, readonly) UIWindow *window;
@property (nonatomic, strong, readonly) UINavigationController *navigationController;

- (instancetype)initWithWindow:(UIWindow *)window;

// Hiding any other constructors
- (instancetype) init NS_UNAVAILABLE;
+ (instancetype) new NS_UNAVAILABLE;

- (void)setRoot: (AppDestination) destination animated:(BOOL) animated;
- (void)push: (AppDestination) destination animated:(BOOL) animated;
- (void)popAnimated:(BOOL) animated;

@end
