//
//  ViewController.m
//  VitamioDemo
//
//  Created by pactera on 17/2/23.
//  Copyright © 2017年 pactera. All rights reserved.
//

#import "ViewController.h"
#import "MediaViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;

@property (nonatomic, strong) NSMutableArray *menuList;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _menuList = [NSMutableArray arrayWithObjects:@"0.课程简介",@"012112", nil];
    
    [self initUI];
    [self setSubFrame];
    
}

-(void)initUI{
    
    _table = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    _table.backgroundColor = [UIColor clearColor];
    _table.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    
}

-(void)setSubFrame{
    
    CGFloat tableY = 64 + 10;
    CGFloat tableH = self.view.frame.size.height - tableY;
    _table.frame = CGRectMake(0, tableY, self.view.frame.size.width, tableH);
    
    
}



#pragma mark - tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _menuList.count;
}


- (CGFloat) tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.font = [UIFont systemFontOfSize:15];
    cell.textLabel.text = [_menuList objectAtIndex:indexPath.row];
    
    return cell;
    
}





- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    MediaViewController *vc = [[MediaViewController alloc]init];
    
    vc.urlString =  [[NSBundle mainBundle] pathForResource:_menuList[indexPath.row] ofType:@"mp4"];
    NSLog(@"vc.urlString==%@",vc.urlString);
    [self presentViewController:vc animated:NO completion:^{
      
       
       
    }];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
