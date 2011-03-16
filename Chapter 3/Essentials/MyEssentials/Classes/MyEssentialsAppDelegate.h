//
//  MyEssentialsAppDelegate.h
//  MyEssentials
//
//  Created by Jose Olmos on 3/11/11.
//  Copyright Home 2011. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MySingletonCCLayerSubclass.h"

@class RootViewController;

@interface MyEssentialsAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
