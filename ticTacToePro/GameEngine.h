//
//  GameEngine.h
//  ticTacToePro
//
//  Created by Nalin Natrajan on 8/3/15.
//  Copyright (c) 2015 Nalin Natrajan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GameEngine : NSObject

@property BOOL ticTurn;

-(int) whoIsTheWinner:(NSArray *) imageValues;

-(int) compareImageViews:(int)firstCell secondCell:(int)secondCell thirdCell:(int)thirdCell imageViews:(NSArray *) imageViews;


@end
