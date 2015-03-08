//
//  ViewController.h
//  ticTacToePro
//
//  Created by Nalin Natrajan on 8/3/15.
//  Copyright (c) 2015 Nalin Natrajan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameEngine.h"


@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *topLeftImageView;

@property (weak, nonatomic) IBOutlet UIImageView *topMiddleImageView;

@property (weak, nonatomic) IBOutlet UIImageView *topRightImageView;

@property (weak, nonatomic) IBOutlet UIImageView *midLeftImageView;

@property (weak, nonatomic) IBOutlet UIImageView *midMiddleImageView;

@property (weak, nonatomic) IBOutlet UIImageView *midRightImageView;

@property (weak, nonatomic) IBOutlet UIImageView *bottomLeftImageView;

@property (weak, nonatomic) IBOutlet UIImageView *bottomMiddleImageView;

@property (weak, nonatomic) IBOutlet UIImageView *bottomRightImageView;

@property (weak, nonatomic) IBOutlet UIImageView *roundImageView;

- (IBAction)onResetButtonPressed:(id)sender;

- (IBAction)onDrag:(UIPanGestureRecognizer *)sender;

@property CGPoint roundImageOriginalPosition;

@property GameEngine *gameEngine;

@property NSArray *imageViews;

-(void)setRoundImage;
-(UIImageView *) findImageViewUsingPoint:(CGPoint) point;
-(void)resetGame;

@end

