//
//  BoardSceneBuilder.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 03.10.2025.
//

#import "BoardSceneBuilder.h"
#import "SceneBuilder.h"
#import "BoardViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface BoardSceneBuilder(SceneBuilder)

@end

@implementation BoardSceneBuilder

- (UIViewController *) build {
    BoardViewController * viewController = [[BoardViewController alloc] init];
    return viewController;
}

@end

NS_ASSUME_NONNULL_END
