//
//  PlayingCard.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

#import "Card.h"
#import "PlayingCard.h"

NS_ASSUME_NONNULL_BEGIN

@implementation PlayingCard

@synthesize suit = _suit; // declare only if setter and getters are custom;

+ (NSArray *) validSuits { // static
    return @[@"♥︎", @"♣︎", @"♦︎", @"♠︎"];
}

+ (NSArray *) rankStrings {
    return @[@"?", @"A", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
}

+ (NSUInteger) maxRank {
    return [[self rankStrings] count] - 1;
}

- (NSString *)contents {
    return [PlayingCard.rankStrings[self.rank] stringByAppendingString:self.suit];
}

- (void) setSuit: (NSString *)suit {
    if ([PlayingCard.validSuits containsObject: suit]) {
        _suit = suit;
    }
}

- (NSString *)suit {
    return _suit ? _suit : @"?";
}

- (void) setRank: (NSUInteger) rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}

@end

NS_ASSUME_NONNULL_END
