//
//  ViewController.m
//  splatAnimation
//
//  Created by C68 on 4/18/17.
//  Copyright © 2017 PayalUmraliya. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/CoreAnimation.h>
@interface ViewController ()
{
    CAEmitterLayer *fireworksEmitter;
    CAEmitterCell* rocket;
    CAEmitterCell* burst;
    CAEmitterCell* spark;
}
@end

@implementation ViewController

- (void) viewDidLoad
{
    [super viewDidLoad];
    
}

-(void)blastNow
{
    fireworksEmitter = [CAEmitterLayer layer];
    CGRect viewBounds = self.view.layer.bounds;
    fireworksEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height);
    fireworksEmitter.emitterSize	= CGSizeMake(viewBounds.size.width/2.0, 0.0);
    fireworksEmitter.emitterMode	= kCAEmitterLayerOutline;
    fireworksEmitter.emitterShape	= kCAEmitterLayerRectangle;
    fireworksEmitter.renderMode		= kCAEmitterLayerAdditive;
    fireworksEmitter.seed = (arc4random()%100)+1;
    
    rocket = [CAEmitterCell emitterCell];
    
    rocket.birthRate		= 1.0;
    rocket.emissionRange	= 0.25 * M_PI;
    rocket.velocity			= 380;
    rocket.velocityRange	= 100;
    rocket.yAcceleration	= 75;
    rocket.lifetime			= 1.02;
    
    rocket.contents			= (id) [[UIImage imageNamed:@"bomb"] CGImage];
    rocket.scale			= 0.2;
    rocket.color			= [[UIColor redColor] CGColor];
    rocket.greenRange		= 1.0;
    rocket.redRange			= 1.0;
    rocket.blueRange		= 1.0;
    rocket.spinRange		= M_PI;
    
    burst = [CAEmitterCell emitterCell];
    
    burst.birthRate			= 1.0;
    burst.velocity			= 0;
    burst.scale				= 3.5;
    burst.redSpeed			=-1.5;
    burst.blueSpeed			=+1.5;
    burst.greenSpeed		=+1.0;
    burst.lifetime			= 0.35;
    
    spark = [CAEmitterCell emitterCell];
    
    spark.birthRate			= 1000;
    spark.velocity			= 50;
    spark.emissionRange		= 2* M_PI;
    spark.yAcceleration		= 20;
    spark.lifetime			= 2;
    
    spark.contents			= (id) [[UIImage imageNamed:@"green3x"] CGImage];
    spark.scaleSpeed		=-0.2;
    spark.greenSpeed		=-0.1;
    spark.redSpeed			= 0.4;
    spark.blueSpeed			=-0.1;
    spark.alphaSpeed		=-0.25;
    spark.spin				= 2* M_PI;
    spark.spinRange			= 2* M_PI;
    
    fireworksEmitter.emitterCells	= [NSArray arrayWithObject:rocket];
    rocket.emitterCells				= [NSArray arrayWithObject:burst];
    burst.emitterCells				= [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:fireworksEmitter];
}

-(void)stopnow
{
    fireworksEmitter.birthRate=0;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


- (IBAction)btnSendClicked:(id)sender
{
    [self blastNow];
   // [self performSelector:@selector(btnStopClicked:) withObject:nil afterDelay:0.1];
}

- (IBAction)btnStopClicked:(id)sender {
    [self stopnow];
}
@end
