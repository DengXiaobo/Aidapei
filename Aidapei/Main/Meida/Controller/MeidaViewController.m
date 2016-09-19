//
//  MeidaViewController.m
//  Aidapei
//
//  Created by Mr.Mac on 16/7/29.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "MeidaViewController.h"
#import "LDCollectionViewLayout.h"
#import "LDSelectCollectionViewCell.h"
#import "LDhttpEngine.h"
#import "LDSelectJson.h"
#import <UIImageView+WebCache.h>
#import <UIColor+Hex.h>
#import "LDMatchViewController.h"
#import "LDClassifyViewController.h"
#import "ZhuantiViewController.h"
@interface MeidaViewController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,LDCollectionViewLayoutDelegate>{
    
    CGFloat _screenWidth;
    
    CGFloat _smallScrollHeight;
    
    CGFloat _secondCellHeight;
    
    UIScrollView *_scrollView;
    
    UIScrollView *_smallScrollView;
    
    UIPageControl *_pageControl;
    
    UIView *_lineView;
    
    NSMutableArray *_buttons;
    
    NSMutableArray *_views;
    
    UITableView *_tableView;
    
    NSTimer *_timer;
    
    NSMutableArray* _selects;
    NSMutableArray*_smalls;
    
    NSMutableArray* _heights;
    
    NSMutableArray *_actions;

    
}

@end

@implementation MeidaViewController


- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.navigationItem.title = @"美搭";
    
    UIBarButtonItem *rightBar = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"message"] style:UIBarButtonItemStylePlain target:self action:@selector(rightButtonClick)];
    
    self.navigationItem.rightBarButtonItem = rightBar;
    
    _selects = [[NSMutableArray alloc] initWithCapacity:0];
    
    _smalls = [[NSMutableArray alloc] initWithCapacity:0];
    _buttons = [[NSMutableArray alloc]initWithCapacity:4];
    
    _views = [[NSMutableArray alloc]initWithCapacity:4];
    
    //屏幕宽度
    _screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    _smallScrollHeight = 120;
    
    _secondCellHeight = 500;
    
    //创建按钮视图
    UIView *tooBar = [[UIView alloc]initWithFrame:CGRectMake(0, 64, _screenWidth, 45)];
    
    NSArray *titles = [NSArray arrayWithObjects:@"精选",@"分类",@"专题",@"活动", nil];
    
    CGFloat buttonWidth = self.view.frame.size.width / 4;
    
    CGFloat buttonHeight = 45;
    
    for (NSInteger i = 0; i < 4; i ++) {
        
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [button setTitle:titles[i] forState:UIControlStateNormal];
        
        button.tag = i + 1;
        
        button.frame = CGRectMake(buttonWidth * i, 0, buttonWidth,buttonHeight);
        
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        
        if (button.tag == 1) {
            
            button.selected = YES;
        }
        
        
        [button addTarget:self action:@selector(toorButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        
        [tooBar addSubview:button];
        
        [_buttons addObject:button];
        
    }
    
    tooBar.backgroundColor = [UIColor colorWithCSS:@"f1f1f1"];
    
    [self.view addSubview:tooBar];
    
    
    
    
    
    //scrollView高度
    CGFloat viewHeight = self.view.frame.size.height - 64 - 49 - 1 - buttonHeight;
    
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 64 + buttonHeight + 1, _screenWidth, viewHeight)];
    _scrollView.tag = 100;
    _scrollView.contentSize = CGSizeMake(_screenWidth * 4, viewHeight);
    
    _scrollView.delegate =self;
    for (NSInteger i = 0; i < 4; i ++) {
        
        //创建scrollView中的view
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(i * _screenWidth, 0, _screenWidth, viewHeight)];
        
        
        [_scrollView addSubview:view];
        
        [_views addObject:view];
        
    }
    
    _scrollView.pagingEnabled = YES;
    
    _scrollView.showsHorizontalScrollIndicator = NO;
    
    _scrollView.bounces = NO;
    
    
    
    [self.view addSubview:_scrollView];
    
    //创建小线条
    _lineView = [[UIView alloc]initWithFrame:CGRectMake(25, CGRectGetMaxY(tooBar.frame), 40, 1)];
    _lineView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:_lineView];
    
 
    UIView *view = _views[0];
        
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, _screenWidth, _secondCellHeight + _smallScrollHeight)];
            
    _tableView.delegate = self;
    _tableView.dataSource = self;
            
    [view addSubview:_tableView];
            
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
            

    [self networkAndSelectJson];
    
    [self networkAndSelectSmallScrollJson];
    
    [self classify];
    
    [self actionJson];
    
    [self showThree];
}

#pragma mark -------分类

-(void)classify{
    
    UIView *view = _views[1];
    
    LDClassifyViewController *vc = [[LDClassifyViewController alloc]init];
    
    [view addSubview:[vc classifyView]];
}

-(void)buttonClick:(UIButton *)button{
    
    
    
    
}

#pragma mark -------解析活动JSON
-(void)actionJson{
    
    [LDhttpEngine requsetActionComplete:^(NSError * _Nullable error, id  _Nullable responseObject) {
        
        _actions = [[NSMutableArray alloc]init];
        
        NSArray *array = responseObject[@"data"];
        
        for (NSDictionary *dict in array) {
            
             LDSelectJson *action = [[LDSelectJson alloc]init];
            
            action.img = dict[@"img"];
            
            action.labelTitle = dict[@"title"];
            
            action.timeoutForIphone = dict[@"timeoutForIphone"];
            
            action.click = dict[@"click"];
            
            action.links = dict[@"link"];
            
            [_actions addObject:action];
        }
        
        UIView *view = _views[3];
        
        LDSelectJson *act = _actions[0];
        
        UIView *backgroundView = [[UIView alloc]initWithFrame:CGRectMake(10, 10, _screenWidth - 20, 250)];
        
        [view addSubview:backgroundView];
        
        backgroundView.backgroundColor = [UIColor whiteColor];
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(1, 1, backgroundView.frame.size.width -1, 200)];
        
        [imageView sd_setImageWithURL:[NSURL URLWithString:act.img]];
        
        [backgroundView addSubview:imageView];
        
        UILabel *leftLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(imageView.frame), 200, 50)];
        
        leftLabel.text = act.labelTitle;
        leftLabel.textColor = [UIColor lightGrayColor];
        [backgroundView addSubview:leftLabel];
        
        UILabel *rightLabel = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(backgroundView.frame) -80, CGRectGetMaxY(imageView.frame), 70, 50)];
        
        rightLabel.text = act.click;
        rightLabel.font = [UIFont systemFontOfSize:15];
        rightLabel.textColor = [UIColor lightGrayColor];
        [backgroundView addSubview:rightLabel];
        
        imageView = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(backgroundView.frame) - 110, 1, 100, 24)];
        
        imageView.image = [UIImage imageNamed:@"shouye_activity_label"];
        
        
        [backgroundView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageView.frame) - 55, 1, 55, 24)];
        
        label.text = act.timeoutForIphone;
        label.font = [UIFont systemFontOfSize:14];
        
        label.textColor = [UIColor whiteColor];
        
        [backgroundView addSubview:label];
        
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, backgroundView.frame.size.width, backgroundView.frame.size.height);
        
        [button addTarget:self action:@selector(actionClick) forControlEvents:UIControlEventTouchUpInside];
        
        [backgroundView addSubview:button];
        view.backgroundColor = [UIColor colorWithCSS:@"f1f1f1"];
    }];
    
}

-(void)actionClick{
    
    LDSelectJson *act = _actions[0];
    
    UIViewController *VC = [UIViewController new];
    
    [self.navigationController pushViewController:VC animated:YES];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:VC.view.frame];
    
    NSURL *url = [NSURL URLWithString:act.links];
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    
    [VC.view addSubview:webView];
    
}


#pragma mark -------信息
-(void)rightButtonClick{
    

    
    
}



#pragma mark -------网络请求解析精选接口的json数据

-(void)networkAndSelectJson{
    
    [LDhttpEngine requsetSelectComplete:^(NSError * _Nullable error, id  _Nullable responseObject) {
        
        if (error) {
            
            NSLog(@"ERROR=====\n%@",error);
            
        }else{
            
            
            CGFloat space = 9.0f;
            
            _heights = [[NSMutableArray alloc] initWithCapacity:2];
            
            [_heights addObject:@(9)];
            [_heights addObject:@(9)];
            
            
            NSArray *selectJson=responseObject;
            
            for (NSDictionary *dict in selectJson) {
                
                
                LDSelectJson *select = [[LDSelectJson alloc]init];
                
                select.item_pic = dict[@"item_pic"];
                
                select.love = [dict[@"love"] integerValue];
                
                select.content_id = dict[@"content_id"];
                
                select.weight = [dict[@"weight"] floatValue] / 2;
                
                select.height = [dict[@"height"] floatValue] / 2;
                
                select.count_num = [dict[@"count_num"] integerValue];
              
                
                [_selects addObject:select];
                
                CGFloat height = [dict[@"height"] floatValue] / 2;
                CGFloat left = [_heights[0] floatValue];
                CGFloat right = [_heights[1] floatValue];
                
                
                if (left > right) {
                    
                    //更新右列的高度。原来的高度＋间距＋新增高度。
                    _heights[1] = @(right + space + height);
                }else {
                    
                    //更新左列的高度。
                    _heights[0] = @(left + space + height);
                }
                
                
                _secondCellHeight = MAX([_heights[0] floatValue], [_heights[1] floatValue]);
             }
            
            [_tableView reloadData];
        }
    }];
 }

#pragma mark -------精选的小ScrollView获取json
-(void)networkAndSelectSmallScrollJson{
    
    
    [LDhttpEngine requsetSelectScrollComplete:^(NSError * _Nullable error, id  _Nullable responseObject) {
        
        if (error) {
            
            NSLog(@"ERROR=====\n%@",error);
            
        }else{
            
            //NSArray *data=responseObject[@"data"];
           // NSLog(@"%ld",data.count);
            
            NSArray *selectJson=responseObject[@"data"];
            
            //NSLog(@"%ld",selectJson.count);
            
            for (NSDictionary *dict in selectJson) {
                
                
                LDSelectJson *select = [[LDSelectJson alloc]init];
            
               
                select.iphoneimg = dict[@"iphoneimg"];
                
                select.link = dict[@"link"];
                
                [_smalls addObject:select];
                
                
            }
            
            [_tableView reloadData];
        }
    }];
    
 }


#pragma mark -------UIScrollViewDelegate协议---结束滑动
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if (scrollView.tag == 100) {
        
        
        NSLog(@"%f",scrollView.contentOffset.x);
        
        //实现线条的偏移
        CGRect frame = _lineView.frame;
        
        frame.origin.x = scrollView.contentOffset.x / _screenWidth * (self.view.frame.size.width / 4) + 25;
        
        _lineView.frame = frame;
        
        //改变button字体颜色和大小
        NSInteger tag = scrollView.contentOffset.x / _screenWidth + 1;
        
        NSLog(@"tag====%ld",tag);
        
        for (UIButton *button in _buttons) {
            
            if (button.tag == tag) {
                
                
                button.titleLabel.font = [UIFont systemFontOfSize:20];
                
                button.selected = YES;
                
            }else{
                
                button.selected = NO;
                
                button.titleLabel.font = [UIFont systemFontOfSize:17];
                
            }
        }

    }else if (scrollView.tag == 200){
        
        
        _pageControl.currentPage = scrollView.contentOffset.x / _screenWidth;
        
        
    }
    
    
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    
    
    _pageControl.currentPage = scrollView.contentOffset.x / _screenWidth;
    
    
    
    
}


#pragma mark -------tooBar上按钮点击方法
-(void)toorButtonClick:(UIButton *)button{
    
    //实现_scrollView的偏移
    _scrollView.contentOffset = CGPointMake((button.tag - 1) * _screenWidth, 0);
    
    
    //实现线条的偏移
    CGRect frame = _lineView.frame;
    
    frame.origin.x = _scrollView.contentOffset.x / _screenWidth * (self.view.frame.size.width / 4) + 25;
    
    _lineView.frame = frame;
    
    [self buttonChanged:button];
    
    
}
#pragma mark -------改变button字体颜色和大小

-(void)buttonChanged:(UIButton *)selectedButton{
    
    for (UIButton *button in _buttons) {
        
        if (button.tag == selectedButton.tag) {
            
            button.selected = YES;
            button.titleLabel.font = [UIFont systemFontOfSize:20];
                
        }else{
            
            button.selected = NO;
            
            button.titleLabel.font = [UIFont systemFontOfSize:17];
            
        }
    }
 
}

#pragma mark -------UITableViewDataSource协议
//设置每个区的个数
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    
    return 1;
}
//设置区的个数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (indexPath.section == 0) {
        
        _smallScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, _screenWidth, _smallScrollHeight)];
        
        _smallScrollView.tag = 200;
        
        _smallScrollView.contentSize = CGSizeMake(_screenWidth * 6, _smallScrollHeight);
        
        for (NSInteger i = 0; i < _smalls.count; i ++) {
            
            if (_smalls.count > 0) {
                
                LDSelectJson *small = _smalls[i];
                
                
                UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(_screenWidth * i, 0, _screenWidth, _smallScrollHeight)];
                
                [imageView sd_setImageWithURL:[NSURL URLWithString:small.iphoneimg]];
                
                [_smallScrollView addSubview:imageView];
                
                
                UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
                
                button.tag = i +50;
                
                button.frame = CGRectMake(_screenWidth * i, 0, _screenWidth, _smallScrollHeight);
                
                [button addTarget:self action:@selector(smallButton:) forControlEvents:UIControlEventTouchUpInside];
                
                [_smallScrollView addSubview:button];
            }
            
        }
        //_scrollView.scrollEnabled = NO;
        
        _smallScrollView.pagingEnabled = YES;
        
        _smallScrollView.bounces = NO;
        
        _smallScrollView.delegate = self;
        
        //scrollView.showsHorizontalScrollIndicator = NO;
        
        [cell.contentView addSubview:_smallScrollView];
        
        
        _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(_screenWidth - 50, _smallScrollHeight - 15, 8, 10)];
        _pageControl.numberOfPages = 6;
        
        _pageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _pageControl.currentPageIndicatorTintColor = [UIColor redColor];
        
        [cell.contentView addSubview:_pageControl];
        
        
    }else{
        
        LDCollectionViewLayout*layout = [[LDCollectionViewLayout alloc]init];
        
        layout.delegate = self;
        
        UICollectionView *collection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, _screenWidth, _secondCellHeight) collectionViewLayout:layout];
        
        collection.delegate = self;
        
        collection.dataSource = self;
        
        collection.scrollEnabled = NO;
        
        collection.backgroundColor = [UIColor colorWithCSS:@"f1f1f1"];
        
        [cell.contentView addSubview:collection];
        
        [collection registerClass:[LDSelectCollectionViewCell class] forCellWithReuseIdentifier:@"cell1"];
        
    }
    
    
    
    return cell;
    
}


-(void)smallButton:(UIButton *)sender{
    
    
    UIViewController *VC = [[UIViewController alloc]init];
    
    [self.navigationController pushViewController:VC animated:YES];
    
    LDSelectJson *small = _smalls[sender.tag - 50];
    
    UIWebView *webView = [[UIWebView alloc]initWithFrame:VC.view.frame];
    
    NSURL *url = [NSURL URLWithString:small.link];
    
    [webView loadRequest:[NSURLRequest requestWithURL:url]];
    [VC.view addSubview:webView];
    
}

//设置单元格高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    CGFloat height = 0;
    
    if (indexPath.section == 0) {
        
        
        height = _smallScrollHeight;
        
        
    }else{
        
        
        height = _secondCellHeight;
        
    }
    
    return height;
    
}

#pragma mark -------UICollectionViewDataSource协议
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    
    return _selects.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    LDSelectCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell1" forIndexPath:indexPath];
    
    LDSelectJson *select = _selects[indexPath.item];
    
    cell.contentView.backgroundColor = [UIColor whiteColor];
    
    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:select.item_pic]];
    
    
    [cell.leftButton setTitle:[NSString stringWithFormat:@"%ld",select.love] forState:UIControlStateNormal];
    
    [cell.rightButton setTitle:[NSString stringWithFormat:@"%ld",select.count_num] forState:UIControlStateNormal];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    LDMatchViewController *matchVC = [[LDMatchViewController alloc]init];
    
    LDSelectJson *select = _selects[indexPath.item];
    
    matchVC.select = select;
    
    matchVC.URLString = [NSString stringWithFormat:@"http://app.api.repaiapp.com/sx/yangshijie/jiekou/zuimei_jingxuan/zuimei_jingxuan_json.php?&content_id=%@",select.content_id];
    
    matchVC.urlstring = @"http://cloud.yijia.com/goto/item.php?app_id=141273368&app_oid=11baea23eedc88f48cf9768919605cbd7bc1831c&app_dtoken=(null)&app_version=3.1.6&app_channel=appstore&sche=aidapei&id=";
    
    [self.navigationController pushViewController:matchVC animated:YES];
    
    self.tabBarController.tabBar.hidden = YES;
    
}

#pragma mark -------LDCollectionViewLayoutDelegate协议
- (CGFloat)heightForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    LDSelectJson *select = _selects[indexPath.item];
    
    CGFloat height = select.height;
    
    return height;
}

-(void)showThree
{
    ZhuantiViewController *zhuanti=[ZhuantiViewController new];
    zhuanti.view.backgroundColor=[UIColor whiteColor];
    UIScrollView *scrollview=[zhuanti getThreeViewInSelect];
    
    UIView *view=_views[2];
    [view addSubview:scrollview];
}


@end
