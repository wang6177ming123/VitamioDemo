//
//  PlayerView.m
//  VitamioDemo
//
//  Created by pactera on 17/2/23.
//  Copyright © 2017年 pactera. All rights reserved.
//

#import "PlayerView.h"
@interface PlayerView()<VMediaPlayerDelegate>
@end
@implementation PlayerView
{
    BOOL didPrepard;
}
-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self initUI];
    }
    return self;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        [self initUI];
    }
    return self;
}
-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    [self setSubFrame];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self setSubFrame];
}
- (void)setSubFrame{
    CGFloat height = self.frame.size.height;
    CGFloat width = self.frame.size.width;
    _preview.frame = CGRectMake(0, 0, width, height);
}
- (void)initUI{
    _preview = [[UIView alloc]init];
    [self addSubview:_preview];
   // [self initPlayer];
}
-(void)initPlayer
{
    if (!_vMediplayer) {
        _vMediplayer = [VMediaPlayer sharedInstance];
        [_vMediplayer setupPlayerWithCarrierView:self.preview withDelegate:self];
    }
}
-(void)prepareVideo
{
    if (!_vMediplayer) {
        _vMediplayer = [VMediaPlayer sharedInstance];
        [_vMediplayer setupPlayerWithCarrierView:self.preview withDelegate:self];
    }
    [UIApplication sharedApplication].idleTimerDisabled = YES;
    NSLog(@"12345");
    
    if(_urlString)
    {
        //播放时不要锁屏
        
        NSString *encodedValue = [_urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL* videoURL = [NSURL fileURLWithPath:encodedValue];
        NSLog(@"videoURL==%@",videoURL);
        [_vMediplayer setDataSource:videoURL];
        [_vMediplayer prepareAsync];
    }
}

- (void)mediaPlayer:(VMediaPlayer *)player didPrepared:(id)arg
{
    didPrepard = YES;
    [player start];
}
- (void)mediaPlayer:(VMediaPlayer *)player playbackComplete:(id)arg
{
    //此处为一个是视频源播放完成之后对其调用的操作；
    [player reset];
    didPrepard = NO;
    NSLog(@"reset");
}
- (void)mediaPlayer:(VMediaPlayer *)player error:(id)arg
{
    NSLog(@"VMediaPlayer Error: %@", arg);
}
- (void)moviestart{
    [self prepareVideo];
}
- (void)moviepause{
    [_vMediplayer pause];
}
- (void)moviestop{
    [_vMediplayer pause];
    [_vMediplayer reset];
    [_vMediplayer unSetupPlayer];
}
- (void)goonPlay{
    [_vMediplayer start];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
