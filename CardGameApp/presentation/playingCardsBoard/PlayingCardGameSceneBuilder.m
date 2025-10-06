//
//  PlayingCardGameSceneBuilder.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 06.10.2025.
//


#import "SceneBuilder.h"
#import "PlayingCardGameController.h"
#import "PlayingCardGameSceneBuilder.h"


NS_ASSUME_NONNULL_BEGIN

@implementation PlayingCardGameSceneBuilder

- (UIViewController *) build {
    PlayingCardGameController *playingCardGameViewController = [[PlayingCardGameController alloc] init];
    return playingCardGameViewController;
}

@end

NS_ASSUME_NONNULL_END
