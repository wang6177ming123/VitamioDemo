//
//  PlayerView.h
//  VitamioDemo
//
//  Created by pactera on 17/2/23.
//  Copyright © 2017年 pactera. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Vitamio.h"
@interface PlayerView : UIView

@property (nonatomic , strong) NSString *urlString;

@property (nonatomic, strong) UIView *preview;

@property (nonatomic , strong) VMediaPlayer *vMediplayer;

- (void)moviestart;
- (void)moviepause;
- (void)moviestop;
- (void)goonPlay;
@end
