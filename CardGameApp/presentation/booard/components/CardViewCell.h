//
//  CardViewCell.h
//  CardGameApp
//
//  Created by Azizbek Asadov on 04.10.2025.
//

@import UIKit;

#import "Card.h"
#import "CoreCollectionViewCell.h"

@interface CardViewCell : CoreCollectionViewCell

- (void) setCardCellData: (Card *) card;

@end
