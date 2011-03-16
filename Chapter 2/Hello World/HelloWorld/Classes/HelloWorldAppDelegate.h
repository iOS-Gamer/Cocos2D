//
//  HelloWorldAppDelegate.h
//  HelloWorld
//
//  Created by Jose Olmos on 3/10/11.
//  Copyright Home 2011. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RootViewController;

@interface HelloWorldAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow			*window;
	RootViewController	*viewController;
}

@property (nonatomic, retain) UIWindow *window;

@end
