//
//  LDClassifyViewController.m
//  Aidapei
//
//  Created by Mr.Mac on 16/8/4.
//  Copyright © 2016年 com.Aidapei.www. All rights reserved.
//

#import "LDClassifyViewController.h"

@interface LDClassifyViewController (){
    
    CGFloat _screenWidth;
    
}

@end

@implementation LDClassifyViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor redColor];
}

-(UIView *)classifyView{
    
    CGFloat imageHeight=250;
    
    _screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, _screenWidth, self.view.frame.size.height - 64 - 60 - 1 - 49)];
    
    UIScrollView *scrollView = [[UIScrollView alloc]initWithFrame:view.frame];
    
    scrollView.contentSize = CGSizeMake(self.view.frame.size.width,imageHeight*10+60*2);
    
    scrollView.bounces = NO;
    
    UIImageView *style = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _screenWidth, 60)];
    style.image = [UIImage imageNamed:@"fengge_tip"];
    
    [scrollView addSubview:style];
    
    
    UIImageView *one = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(style.frame), _screenWidth, imageHeight)];
    one.image = [UIImage imageNamed:@"style_01"];
    
    [scrollView addSubview:one];
    
    UIButton *oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //1
    oneButton.frame = CGRectMake(10, CGRectGetMaxY(style.frame), 174, 134);
    [oneButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:oneButton];
    //2
   UIButton * twoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    twoButton.frame = CGRectMake(194, CGRectGetMaxY(style.frame), 174, 272);
    [twoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:twoButton];
    //3
    UIButton *threeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    threeButton.frame = CGRectMake(10, CGRectGetMaxY(oneButton.frame)+10, 174, 134);
    [threeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:threeButton];
    
    
    UIImageView *two = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(one.frame), _screenWidth, imageHeight)];
    two.image = [UIImage imageNamed:@"style_02"];
    
    [scrollView addSubview:two];
    
    oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //1
    oneButton.frame = CGRectMake(194, CGRectGetMaxY(one.frame)+5, 174, 134);
    [oneButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:oneButton];
    //2
    twoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    twoButton.frame = CGRectMake(10, CGRectGetMaxY(one.frame)+5, 174, 272);
    [twoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:twoButton];
    //3
    threeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    threeButton.frame = CGRectMake(194, CGRectGetMaxY(oneButton.frame)+10, 174, 134);
    [threeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:threeButton];
    
    
    UIImageView *three = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(two.frame), _screenWidth, imageHeight)];
    three.image = [UIImage imageNamed:@"style_03"];
    
    [scrollView addSubview:three];
    
    oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //1
    oneButton.frame = CGRectMake(10, CGRectGetMaxY(two.frame)+5, 174, 134);
    [oneButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:oneButton];
    //2
    twoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    twoButton.frame = CGRectMake(194, CGRectGetMaxY(two.frame)+5, 174, 272);
    [twoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:twoButton];
    //3
    threeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    threeButton.frame = CGRectMake(10, CGRectGetMaxY(oneButton.frame)+10, 174, 134);
    [threeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:threeButton];
    
    UIImageView *four = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(three.frame), _screenWidth, imageHeight)];
    four.image = [UIImage imageNamed:@"style_04"];
    
    [scrollView addSubview:four];
    
    oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //1
    oneButton.frame = CGRectMake(194, CGRectGetMaxY(three.frame)+5, 174, 134);
    [oneButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:oneButton];
    //2
    twoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    twoButton.frame = CGRectMake(10, CGRectGetMaxY(three.frame)+5, 174, 272);
    [twoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:twoButton];
    //3
    threeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    threeButton.frame = CGRectMake(194, CGRectGetMaxY(oneButton.frame)+10, 174, 134);
    [threeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:threeButton];
    
    
    
    UIImageView *five = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(four.frame), _screenWidth, imageHeight)];
    five.image = [UIImage imageNamed:@"style_05"];
    
    [scrollView addSubview:five];
    
    oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //1
    oneButton.frame = CGRectMake(10, CGRectGetMaxY(four.frame)+5, 174, 134);
    [oneButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:oneButton];
    //2
    twoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    twoButton.frame = CGRectMake(194, CGRectGetMaxY(four.frame)+5, 174, 272);
    [twoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:twoButton];
    //3
    threeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    threeButton.frame = CGRectMake(10, CGRectGetMaxY(oneButton.frame)+10, 174, 134);
    [threeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:threeButton];
    
    
    
    UIImageView *six = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(five.frame), _screenWidth, imageHeight)];
    six.image = [UIImage imageNamed:@"style_06"];
    
    [scrollView addSubview:six];
    
    oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //1
    oneButton.frame = CGRectMake(194, CGRectGetMaxY(five.frame)+5, 174, 134);
    [oneButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:oneButton];
    //2
    twoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    twoButton.frame = CGRectMake(10, CGRectGetMaxY(five.frame)+5, 174, 272);
    [twoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:twoButton];
    //3
    threeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    threeButton.frame = CGRectMake(194, CGRectGetMaxY(oneButton.frame)+10, 174, 134);
    [threeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:threeButton];

    
    
    UIImageView *seven = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(six.frame), _screenWidth, imageHeight)];
    seven.image = [UIImage imageNamed:@"style_07"];
    
    [scrollView addSubview:seven];
    
    oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //1
    oneButton.frame = CGRectMake(10, CGRectGetMaxY(six.frame)+5, 174, 134);
    [oneButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:oneButton];
    //2
    twoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    twoButton.frame = CGRectMake(194, CGRectGetMaxY(six.frame)+5, 174, 134);
    [twoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:twoButton];
    //3
    threeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    threeButton.frame = CGRectMake(10, CGRectGetMaxY(oneButton.frame)+10, 174, 134);
    [threeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:threeButton];

    UIButton *fourButton = [UIButton buttonWithType:UIButtonTypeCustom];
    fourButton.frame = CGRectMake(194, CGRectGetMaxY(twoButton.frame) + 10, 174, 134);
    [twoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:twoButton];
    
    UIImageView *figure= [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(seven.frame), _screenWidth, 60)];
    figure.image = [UIImage imageNamed:@"shenxing_tip"];
    
    [scrollView addSubview:figure];
    
    
    
    UIImageView *eight = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(figure.frame), _screenWidth, imageHeight)];
    eight.image = [UIImage imageNamed:@"figure_01"];
    
    [scrollView addSubview:eight];
    
    oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //1
    oneButton.frame = CGRectMake(194, CGRectGetMaxY(figure.frame), 174, 134);
    [oneButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:oneButton];
    //2
    twoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    twoButton.frame = CGRectMake(10, CGRectGetMaxY(figure.frame), 174, 272);
    [twoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:twoButton];
    //3
    threeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    threeButton.frame = CGRectMake(194, CGRectGetMaxY(oneButton.frame)+10, 174, 134);
    [threeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:threeButton];

    
    
    UIImageView *nine = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(eight.frame), _screenWidth, imageHeight)];
    nine.image = [UIImage imageNamed:@"figure_02"];
    
    [scrollView addSubview:nine];
    
    oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //1
    oneButton.frame = CGRectMake(10, CGRectGetMaxY(eight.frame)+5, 174, 134);
    [oneButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:oneButton];
    //2
    twoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    twoButton.frame = CGRectMake(194, CGRectGetMaxY(eight.frame)+5, 174, 272);
    [twoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:twoButton];
    //3
    threeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    threeButton.frame = CGRectMake(10, CGRectGetMaxY(oneButton.frame)+10, 174, 134);
    [threeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:threeButton];

    
    UIImageView *ten = [[UIImageView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(nine.frame), _screenWidth, imageHeight)];
    ten.image = [UIImage imageNamed:@"figure_03"];
    
    [scrollView addSubview:ten];
    
    oneButton = [UIButton buttonWithType:UIButtonTypeCustom];
    //1
    oneButton.frame = CGRectMake(194, CGRectGetMaxY(nine.frame)+5, 174, 134);
    [oneButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:oneButton];
    //2
    twoButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    twoButton.frame = CGRectMake(10, CGRectGetMaxY(nine.frame)+5, 174, 272);
    [twoButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:twoButton];
    //3
    threeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    threeButton.frame = CGRectMake(194, CGRectGetMaxY(oneButton.frame)+10, 174, 134);
    [threeButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [scrollView addSubview:threeButton];

    [view addSubview:scrollView];
    
    return view;
}

-(void)buttonClick:(UIButton *)button{
 
    
}


@end
