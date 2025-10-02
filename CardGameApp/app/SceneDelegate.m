//
//  SceneDelegate.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

#import "SceneDelegate.h"
#import "AppDelegate.h"
#import "AppCoordinator.h"

@interface SceneDelegate ()

@property (strong, nonatomic) AppCoordinator *coordinator;

@end

@implementation SceneDelegate

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions {
    
    UIWindowScene *windowScene = [[UIWindowScene alloc] initWithSession:session connectionOptions:connectionOptions];
    self.window = [[UIWindow alloc] initWithWindowScene:windowScene];
    self.coordinator = [[AppCoordinator alloc] initWithWindow:self.window];
    [self.coordinator start];
}

@end
