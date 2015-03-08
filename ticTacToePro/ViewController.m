//
//  ViewController.m
//  ticTacToePro
//
//  Created by Nalin Natrajan on 8/3/15.
//  Copyright (c) 2015 Nalin Natrajan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize gameEngine, topLeftImageView, topMiddleImageView, topRightImageView, midLeftImageView, midMiddleImageView, midRightImageView, bottomLeftImageView, bottomMiddleImageView, bottomRightImageView, roundImageView, roundImageOriginalPosition, imageViews;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    gameEngine = [[GameEngine alloc] init];
    self.roundImageOriginalPosition = self.roundImageView.center;
    self.imageViews = [NSArray arrayWithObjects:self.topLeftImageView, self.topMiddleImageView, self.topRightImageView, self.midLeftImageView, self.midMiddleImageView, self.midRightImageView, self.bottomLeftImageView, self.bottomMiddleImageView, self.bottomRightImageView, nil];
    [self setRoundImage];
}

-(void)setRoundImage{
    if(gameEngine.ticTurn){
        roundImageView.image = [UIImage imageNamed:@"X"];
    } else {
        roundImageView.image = [UIImage imageNamed:@"O"];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onResetButtonPressed:(id)sender {
    [self resetGame];
}

-(UIImageView *) findImageViewUsingPoint:(CGPoint) point{
    UIImageView *pointOnImageView = nil;
    for (UIImageView *eachImageView in imageViews){
        if(CGRectContainsPoint(eachImageView.frame, point)){
            pointOnImageView = eachImageView;
            break;
        }
    }
    return pointOnImageView;
}

- (IBAction)onDrag:(UIPanGestureRecognizer *)sender {
    CGPoint currentPoint = [sender locationInView:self.view];
    if([sender state] == UIGestureRecognizerStateEnded){
        NSLog(@"%f, %f", roundImageOriginalPosition.x, roundImageOriginalPosition.y);
        roundImageView.center = roundImageOriginalPosition;
        NSLog(@"%f, %f", roundImageView.center.x, roundImageView.center.y);
        UIImageView *targetImageView = [self findImageViewUsingPoint: currentPoint];
        if(targetImageView && targetImageView.image == nil){
            targetImageView.image = roundImageView.image;
            gameEngine.ticTurn = !gameEngine.ticTurn;
            [self setRoundImage];
        }
        int winner = [gameEngine whoIsTheWinner:imageViews];
        if (winner != -1){
            NSString *msg;
            if(winner == 0){
                msg = @"The winner is Toe.";
            }else if(winner == 1){
                msg = @"The winner is Tic Tac.";
            }else{
                msg =@"There is no winner.";
            }
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Game Over !" message:msg preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *action = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:action];
            [self presentViewController:alertController animated:true completion:nil];
            [self resetGame];
        }
    } else {
        roundImageView.center = currentPoint;
    }
}

-(void)resetGame{
    for(UIImageView *imageView in imageViews){
        imageView.image = nil;
    }
    gameEngine.ticTurn = true;
    [self setRoundImage];
}

@end
