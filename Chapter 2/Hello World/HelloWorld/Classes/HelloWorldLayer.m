//
//  HelloWorldLayer.m
//  HelloWorld
//
//  Created by Jose Olmos on 3/10/11.
//  Copyright Home 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"
#import "CCTouchDispatcher.h"

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
		
	}
	return self;
}

// Must register to recieve Touch events

-(void) registerWithTouchDispatcher
{
	// CCLOG is a macro wrapper aroung NSLog that gets stripped out from release builds to improve performance
	
	CCLOG(@"Registered!");
	[[CCTouchDispatcher sharedDispatcher] addTargetedDelegate:self priority:0 swallowsTouches:YES];
}


-(BOOL) ccTouchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
	CCLOG(@"Touches Began !");
	
	// Scale Text with Touch 
	 
	// Defensive Programming. Make sure tagged object is actually a label
	
	CCNode *node = (CCNode*) [self getChildByTag:1];
	
	// Verify correct type with an Assert
	
	NSAssert([node isKindOfClass:[CCLabelTTF class]], @"node is not a CCLabelTTF type");
	
	CCLabelTTF *label = (CCLabelTTF*) node;
	label.scale = CCRANDOM_0_1();
	CCLOG(@"Scale Factor is %f", label.scale);	
	
	/* Non-Defensive Example
	
	CCLabelTTF *label = (CCLabelTTF*) [self getChildByTag:10];
	label.scale = CCRANDOM_0_1();

	*/
	
	return YES;
}

// on "dealloc" you need to release all your retained objects
							  

							  
							  
							  
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end
