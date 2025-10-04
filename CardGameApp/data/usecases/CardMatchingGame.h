//
//  CardMatchingGame.h
//  CardGameApp
//
//  Created by Azizbek Asadov on 04.10.2025.
//

#import <Foundation/Foundation.h>

@class Deck;
@class Card;

@interface CardMatchingGame : NSObject

- (instancetype) init NS_UNAVAILABLE;
+ (instancetype) new NS_UNAVAILABLE;

- (instancetype) initWithCardCount: (NSUInteger) count usingDeck: (Deck *) deck;

- (void) chooseCardAtIndex: (NSUInteger) index;
- (Card *) cardAtIndex: (NSUInteger) index;

@property (nonatomic, readonly) NSInteger score;

@end
