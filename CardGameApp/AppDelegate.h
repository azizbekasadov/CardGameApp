//
//  AppDelegate.h
//  CardGameApp
//
//  Created by Azizbek Asadov on 02.10.2025.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

