//
//  View.m
//  StarWars
//
//  Created by Lisa Jenkins on 11/26/12.
//  Copyright (c) 2012 Lisa Jenkins. All rights reserved.
//

#import "View.h"

@implementation View

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        self.backgroundColor = [UIColor blackColor];
        
        viewWidth = self.bounds.size.width;
        viewHeight = self.bounds.size.height;
        
        NSString *text = @"It is a period of civil war. Rebel spaceships, striking from a hidden base, have won their first victory against the evil Galactic Empire. During the battle, Rebel spies managed to steal secret plans to the Empire’s ultimate weapon, the Death Star, an armored space station with enough power to destroy an entire planet. Pursued by the Empire’s sinister agents, Princess Leia races home aboard her starship, custodian of the stolen plans that can save her peopleand restore freedom to the galaxy.";
        
        textView = [[UITextView alloc] initWithFrame:CGRectMake(0, viewHeight, viewWidth, viewHeight * 5)];
        
        textView.backgroundColor = [UIColor clearColor];
        
        textView.font = [UIFont fontWithName:@"Arial" size: viewWidth/14];
        textView.textColor = [UIColor yellowColor];
        textView.text = text;
        
        [self addSubview:textView];
        
        UIImage *logo = [UIImage imageNamed:@"Star_Wars_Logo.png"];
        
        logoView = [[UIImageView alloc] initWithImage:logo];
        
        if (logo == nil) {
            NSLog(@"could not find the image");
        }
        
        CGPoint point1 = CGPointMake(viewWidth/2, (viewHeight - logo.size.height));
        
        logoView.center = point1;
        [self addSubview:logoView];
        
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{

    CGFloat scaleFactor = 0.50;
    
    CGPoint point2 = CGPointMake(self.bounds.size.width/2,0);
    CGPoint point1 = CGPointMake(viewWidth/2, (viewHeight - logoView.bounds.size.height));
    
    [UIView animateWithDuration:15
                          delay:0
                        options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         logoView.center = CGPointMake(point1.x, point2.y-logoView.bounds.size.height);
                         logoView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
                     }completion:^(BOOL b){
                         [UIView animateWithDuration:20
                                               delay:0
                                             options:UIViewAnimationOptionCurveLinear
                                          animations:^{
                                              textView.center = point2;
                                              textView.transform = CGAffineTransformMakeScale(scaleFactor, scaleFactor);
                                          }completion:NULL
                          ];
                     }
     ];
}


@end
