//
//  CardMatchingGame.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 04.10.2025.
//

#import "CardMatchingGame.h"

@interface CardMatchingGame()

@property (nonatomic, readwrite) NSInteger score; // readwrite only when we redefine readonly in private scope
@property (nonatomic, strong) NSMutableArray<Card *>* cards;

@end

@implementation CardMatchingGame

// lazy instantiation

- (NSMutableArray<Card*>*) cards {
    if (!_cards) {
        _cards = [[NSMutableArray alloc] init];
    }
    
    return _cards;
}

- (instancetype) initWithCardCount: (NSUInteger) count
                         usingDeck:(Deck *)deck
{
    self = [super init];
    
    if (self) {
        
    }
    
    return self;
}

- (void)chooseCardAtIndex: (NSUInteger) index {
    
}

@end
