//
//  PlayingCard.h
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

#import <Foundation/Foundation.h>
#import "Card.h"

NS_ASSUME_NONNULL_BEGIN

@interface PlayingCard : Card;

@property (strong, nonatomic) NSString *suit;
@property (nonatomic) NSUInteger rank;

+ (NSArray *) validSuits;
+ (NSArray *) rankStrings;
+ (NSUInteger) maxRank;

@end

NS_ASSUME_NONNULL_END
