//
//  MediaViewController.m
//  VitamioDemo
//
//  Created by pactera on 17/2/23.
//  Copyright © 2017年 pactera. All rights reserved.
//

#import "MediaViewController.h"
#import "PlayerView.h"
@interface MediaViewController ()

@property (nonatomic,strong) NSString *videoPath;

@property(nonatomic, strong) UIButton *startbutton;

@property(nonatomic, strong) UIButton *pasebutton;

@property(nonatomic,strong) UIButton *topButton;

@property (nonatomic, strong)UIButton *backButton;

@property (nonatomic, strong) PlayerView *pleyerView;
@end

@implementation MediaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initUI];
}
- (void)initUI{
    _pleyerView = [[PlayerView alloc]initWithFrame:CGRectMake(0, 150, self.view.frame.size.width,self.view.frame.size.width-50 )];
    _pleyerView.urlString = self.urlString;
    _pleyerView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_pleyerView];
    
    
    _topButton = [[UIButton alloc]initWithFrame:CGRectMake(10, 74, self.view.frame.size.width -20, 60)];
    //    button.titleLabel.text = @"开始";
    _topButton.userInteractionEnabled = YES;
    
    _topButton.layer.cornerRadius = 5;
    [_topButton setTitle:@"开始" forState:UIControlStateNormal];
    _topButton.backgroundColor = [UIColor redColor];
    [_topButton addTarget:self action:@selector(parevoidaction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: _topButton];
    
    _startbutton =[[UIButton alloc]initWithFrame:CGRectMake(10, self.view.frame.size.height - 220, self.view.frame.size.width - 20, 60)];
    //    _startbutton.titleLabel.text = @"播放";
    [_startbutton setTitle:@"播放" forState:UIControlStateNormal];
    _startbutton.backgroundColor = [UIColor orangeColor];
    _startbutton.layer.cornerRadius = 5;
    _startbutton.userInteractionEnabled = NO;
    [_startbutton addTarget:self action:@selector(startbuttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: _startbutton];
    
    _pasebutton =[[UIButton alloc]initWithFrame:CGRectMake(10, self.view.frame.size.height - 150, self.view.frame.size.width - 20, 60)];
    //    _pasebutton.titleLabel.text = @"暂停";
    [_pasebutton setTitle:@"暂停" forState:UIControlStateNormal];
    _pasebutton.userInteractionEnabled = NO;
    _pasebutton.layer.cornerRadius = 5;
    _pasebutton.backgroundColor = [UIColor greenColor];
    [_pasebutton addTarget:self action:@selector(pasebuttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: _pasebutton];
    
  
    
    _backButton =[[UIButton alloc]initWithFrame:CGRectMake(10, self.view.frame.size.height - 70, self.view.frame.size.width - 20, 60)];
    //    _pasebutton.titleLabel.text = @"暂停";
    [_backButton setTitle:@"返回" forState:UIControlStateNormal];
    _backButton.userInteractionEnabled = YES;
    _backButton.layer.cornerRadius = 5;
    _backButton.backgroundColor = [UIColor greenColor];
    [_backButton addTarget:self action:@selector(backbutton) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview: _backButton];
    
}
- (void)backbutton{
    [_pleyerView moviestop];
    
//    [_pleyerView removeFromSuperview];
    [self dismissViewControllerAnimated:NO completion:^{
//        [_pleyerView moviestop];
    }];
}
- (void)startbuttonAction{
    
    [_pleyerView goonPlay];
    _pasebutton.backgroundColor = [UIColor redColor];
    _startbutton.backgroundColor = [UIColor grayColor];
    _startbutton.userInteractionEnabled = NO;
    _pasebutton.userInteractionEnabled = YES;
}
- (void)pasebuttonAction{
    //    [self prepareVideo];
    [_pleyerView moviepause];
    _pasebutton.backgroundColor = [UIColor grayColor];
    _startbutton.backgroundColor = [UIColor redColor];
    _pasebutton.userInteractionEnabled = NO;
    _startbutton.userInteractionEnabled = YES;
}
- (void)parevoidaction{
    [_pleyerView moviestart];
    _pasebutton.backgroundColor = [UIColor redColor];
    _startbutton.backgroundColor = [UIColor grayColor];
    _startbutton.userInteractionEnabled = NO;
    _pasebutton.userInteractionEnabled = YES;
    _topButton.userInteractionEnabled = NO;
    _topButton.backgroundColor = [UIColor grayColor];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [_pleyerView moviestop];
    [_pleyerView.vMediplayer reset];
    //    [_pleyerView removeFromSuperview];
    
}

-(void)dealloc{
    [_pleyerView.vMediplayer reset];
    
    [[NSURLCache sharedURLCache] removeAllCachedResponses];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
