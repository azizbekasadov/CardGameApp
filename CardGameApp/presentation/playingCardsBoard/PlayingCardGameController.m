//
//  PlayingCardGameController.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 06.10.2025.
//

#import "PlayingCardDeck.h"
#import "BoardViewController.h"
#import "PlayingCardGameController.h"

@implementation PlayingCardGameController

- (Deck *)createDeck {
    return [[PlayingCardDeck alloc] init];
}

@end
