//
//  Card.m
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface Card()

@end

@implementation Card

- (int) match:(Card *)card {
    int score = 0;
    
    if ([card.contents isEqualToString:self.contents]) {
        score = 1;
    }
    
    return score;
}

- (int) matchCards:(NSArray<Card *> *)otherCards {
    int score = 0;
    
    for (Card* card in otherCards) {
        if ([card.contents isEqualToString:self.contents]) {
            score = 1;
        }
    }
    
    return score;
}

@end

NS_ASSUME_NONNULL_END
