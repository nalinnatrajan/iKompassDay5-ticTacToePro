//
//  GameEngine.m
//  ticTacToePro
//
//  Created by Nalin Natrajan on 8/3/15.
//  Copyright (c) 2015 Nalin Natrajan. All rights reserved.
//

#import "GameEngine.h"

@implementation GameEngine

@synthesize ticTurn;

-(id)init{
    self = [super init];
    if (self) {
        ticTurn = true;
    }
    return self;
}

-(int) whoIsTheWinner:(NSArray *)imageValues{
    
    int result;
    
    result = [self compareImageViews:0 secondCell:1 thirdCell:2 imageViews:imageValues];
    if(result == 0 || result == 1){
        return result;
    }
    
    result = [self compareImageViews:3 secondCell:4 thirdCell:5 imageViews:imageValues];
    if(result == 0 || result == 1){
        return result;
    }
    
    result = [self compareImageViews:6 secondCell:7 thirdCell:8 imageViews:imageValues];
    if(result == 0 || result == 1){
        return result;
    }
    
    result = [self compareImageViews:0 secondCell:3 thirdCell:6 imageViews:imageValues];
    if(result == 0 || result == 1){
        return result;
    }
    
    result = [self compareImageViews:1 secondCell:4 thirdCell:7 imageViews:imageValues];
    if(result == 0 || result == 1){
        return result;
    }
    
    result = [self compareImageViews:2 secondCell:5 thirdCell:8 imageViews:imageValues];
    if(result == 0 || result == 1){
        return result;
    }
    
    result = [self compareImageViews:0 secondCell:4 thirdCell:8 imageViews:imageValues];
    if(result == 0 || result == 1){
        return result;
    }
    
    result = [self compareImageViews:2 secondCell:4 thirdCell:6 imageViews:imageValues];
    if(result == 0 || result == 1){
        return result;
    }
    
    for(UIImageView *imageView in imageValues){
        if(!imageView.image){
            NSLog(@"The game is not over yet.");
            return -1; }
    }
    
    return result;
}

-(int)compareImageViews:(int)firstCell secondCell:(int)secondCell thirdCell:(int)thirdCell imageViews:(NSArray *)imageValues{
    NSData *img1 = UIImagePNGRepresentation([UIImage imageNamed:@"o"]);
    NSData *img2 = UIImagePNGRepresentation([UIImage imageNamed:@"x"]);
    NSData *leftImageData = UIImagePNGRepresentation([((UIImageView *)[imageValues objectAtIndex: firstCell]) image]);
    NSData *middleImageData = UIImagePNGRepresentation([((UIImageView *)[imageValues objectAtIndex: secondCell]) image]);
    NSData *rightImageData = UIImagePNGRepresentation([((UIImageView *)[imageValues objectAtIndex: thirdCell]) image]);
    
    if (([leftImageData isEqualToData:middleImageData]) && ([middleImageData isEqualToData:rightImageData]) && leftImageData != nil) {
        if ([leftImageData isEqualToData:img1]) {
            return 0;
        } else if ([leftImageData isEqualToData:img2]){
            return 1;
        }
    }
    return 2;
}

@end
