//
//  BoardViewController.h
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

@import Foundation;
@import UIKit;

#import "Deck.h"
#import "UIColorFromRGB.h"

@interface BoardViewController : UIViewController

- (Deck *) createDeck; // abstract

@end

// TODO:
// - Design Patterns and ObjC syntax brush up;
// - Apple Music Application;
// - Learn Cocoa in Objc book to read;
// - Unit tests in ObjC to add for the Apple Music App;
// - Master Complex Architecture design patterns and GoF Design patterns

