//
//  Card.h
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

@import Foundation;

NS_ASSUME_NONNULL_BEGIN

@interface Card : NSObject

@property (strong, nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int) match:(Card*) card;
- (int) matchCards:(NSArray<Card*>*) otherCards;

@end

NS_ASSUME_NONNULL_END
