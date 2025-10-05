//
//  Deck.h
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

@import Foundation;

@class Card;

NS_ASSUME_NONNULL_BEGIN

@interface Deck : NSObject

- (void) addCard: (Card*) card atTop: (BOOL) atTop;
- (void) addCard: (Card*) card;

- (Card*) drawRandomCard DEPRECATED_MSG_ATTRIBUTE("Use -playWithError: instead.") ;

@end

NS_ASSUME_NONNULL_END
