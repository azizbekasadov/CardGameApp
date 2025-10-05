//
//  Deck.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

#import "Deck.h"
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Deck()

@property (strong, nonatomic) NSMutableArray *cards; // for private vars, add setters and getters

@end

@implementation Deck

- (NSMutableArray *) cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (void) addCard:(Card *) card {
    [self addCard:card atTop:NO];
}

- (void) addCard:(Card *) card atTop: (BOOL) atTop {
    if (atTop) {
        [self.cards insertObject:card atIndex:0];
    } else {
        [self.cards addObject:card];
    }
}


- (Card *) drawRandomCard DEPRECATED_MSG_ATTRIBUTE("Use -playWithError: instead.") {
    Card *randomCard = nil;
    
    if ([self.cards count]) {
        unsigned index = arc4random() % [self.cards count];
        randomCard = self.cards[index];
        [self.cards removeObject:randomCard];
    }
    
    return randomCard;
}

@end

NS_ASSUME_NONNULL_END
