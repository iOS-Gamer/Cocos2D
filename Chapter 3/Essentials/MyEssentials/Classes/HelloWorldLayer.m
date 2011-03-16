//
//  HelloWorldLayer.m
//  MyEssentials
//
//  Created by Jose Olmos on 3/11/11.
//  Copyright Home 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello World" fontName:@"Marker Felt" fontSize:64];

		// ask director the the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
		
		label.tag = 1;
		
		self.isTouchEnabled = YES;
		self.isAccelerometerEnabled = YES;
		
		// Log scene creation (for tracking memory)
		
		CCLOG (@"%@, %@", NSStringFromSelector(_cmd), self);
		
		// Add a sprite for fun
		
		CCSprite *sprite = [CCSprite spriteWithFile:@"Icon.png"];
		
		// Following is an ugly hack. NEVER change anchorPoint from center. This makes scaling, rotation
		// physics, etc. much harder!
		
		sprite.anchorPoint = CGPointMake(0, 0);
		
		[self addChild:sprite];
		
	}
	return self;
}

// Following methods pertain to the TargetedDelegat mechanism that only allows for single touches.
// For multitouch, dont resgister with global dispatcher and employ the (NSSet *) methods with plural names
// (i.e. ccTouchesBegan instead of ccTouchBegan). See book for more detailed explianation on pg. 55

- (void) registerWithTouchDispatcher
{
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}

- (BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	CCNode *node = [self getChildByTag:1];
	NSAssert ([node isKindOfClass:[CCLabelTTF class]], @"node is not a CCLabelTTF type!");
	CCLabelTTF *label = (CCLabelTTF*)node;
	
	label.scale = CCRANDOM_0_1();
	
	CCAction *blinkAction = [CCBlink actionWithDuration:1.5 blinks:6];
	
	CCTransitionPageTurn *pageTurn = [CCTransitionPageTurn transitionWithDuration:1.5 scene:[HelloWorldLayer scene] backwards:NO];
	
	[label runAction:blinkAction];
	
	[[CCDirector sharedDirector] replaceScene:pageTurn];
	
	return YES;
}

// iOS Accelerometer Protocol Method (UIAccelerometerDelegate Protocol)

- (void) accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration
{
	CCLOG (@"Acceleration is: x:%f / y:%f / z:%f", acceleration.x, acceleration.y, acceleration.z);
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// Log deallocations for memory tracking
	
	CCLOG (@"%@, %@", NSStringFromSelector(_cmd), self);
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
