//
//  CardMatchingGame.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 04.10.2025.
//

#import "Deck.h"
#import "Card.h"
#import "CardMatchingGame.h"

//#define MISMATCH_PENALTY 2;

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSUInteger flipCount;
@property (nonatomic, readwrite) NSUInteger cardsCount;
@property (nonatomic, readwrite) NSInteger score; // readwrite only when we redefine readonly in private scope
@property (nonatomic, strong) NSMutableArray* cards;

@end

@implementation CardMatchingGame

// lazy instantiation

- (NSMutableArray*) cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

// consts
// or make it
static const int CARD_MISMATCH_PENALTY = 4;
static const int MATCH_BONUS = 4;
static const int COST_TO_CHOOSE = 2;

- (instancetype) initWithCardCount: (NSUInteger) count
                         usingDeck: (Deck *) deck {
    self = [super init];
    
    if (self) {
        for (int i = 0; i < count; i++) {
            Card *card = [deck drawRandomCard];
            
            if (card) {
                self.cards[i] = card;
            } else {
                self = nil;
                break;
            }
        }
        
        self.cardsCount = count;
        self.flipCount = 0;
    }
    
    return self;
}

- (void)chooseCardAtIndex: (NSUInteger) index {
    Card *card = [self cardAtIndex: index];
    
    if (!card.isMatched) {
        if (card.isChosen) {
            card.chosen = NO;
        } else {
            // match against other card;
            for (Card *otherCard in self.cards) {
                if (otherCard.isChosen && !otherCard.isMatched) {
                    int matchScore = [card matchCards:@[otherCard]];
                    
                    if (matchScore) {
                        self.score += matchScore * MATCH_BONUS;
                        card.matched = YES;
                        otherCard.matched = YES;
                    } else {
                        self.score -= CARD_MISMATCH_PENALTY;
                        otherCard.chosen = NO;
                    }
                    
                    break;
                }
            }
            
            self.score -= COST_TO_CHOOSE;
            card.chosen = YES;
        }
    }
    
    self.flipCount++;
}

- (Card *)cardAtIndex:(NSUInteger) index {
    return (index <= self.cards.count) ? self.cards[index] : nil;
}

@end
