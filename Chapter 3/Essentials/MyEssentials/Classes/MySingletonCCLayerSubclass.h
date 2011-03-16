//
//  MySingletonCCLayerSubclass.h
//  MyEssentials
//
//  Created by Jose Olmos on 3/11/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "cocos2d.h"

@interface MySingletonCCLayerSubclass : CCLayer {

	NSNumber *synthVar;	 
	
}

@property (retain, nonatomic) NSNumber *synthVar;

+ (MySingletonCCLayerSubclass*)sharedSingleton;
- (void)setVar:(int)value;
- (int)getVar;

@end
