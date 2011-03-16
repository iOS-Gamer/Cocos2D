//
//  MySingletonCCLayerSubclass.m
//  MyEssentials
//
//  Created by Jose Olmos on 3/11/11.
//  Copyright 2011 Home. All rights reserved.
//

#import "MySingletonCCLayerSubclass.h"



@implementation MySingletonCCLayerSubclass

@synthesize synthVar;
static int singletonVar;

static MySingletonCCLayerSubclass *sharedSingleton = nil;

+ (MySingletonCCLayerSubclass*)sharedSingleton {

	singletonVar = 1;
	
	if (!sharedSingleton) 
	{
		sharedSingleton = [[MySingletonCCLayerSubclass alloc]init];
		CCLOG (@"Singleton allocated an initialized! ");
		CCLOG (@"Initial singletonVar value is %i", singletonVar);
	}

	return sharedSingleton;

}

- (void)setVar:(int)value
{
	singletonVar = value;
}

- (int)getVar
{
	return singletonVar;
}

@end
