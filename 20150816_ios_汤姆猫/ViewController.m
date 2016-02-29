//
//  ViewController.m
//  20150816_ios_汤姆猫
//
//  Created by YueWen on 15/8/16.
//  Copyright (c) 2015年 YueWen. All rights reserved.
//

#import "ViewController.h"
#define EAT 40       //吃东西的图片的个数
#define FART 28      //放P的图片的个数
#define DRINK 81     //喝牛奶的图片的个数
#define ARGRY 26     //生气的图片的个数
#define CYMBAL 13    //敲锣的图片的个数
#define PIE 24       //扔东西的图片的个数
#define SCRATCH 56   //挠人的图片的个数
#define KNOCKOUT 81  //敲晕的图片的个数
#define FOOTLEFT 30  //左脚被点的图片个数
#define FOOTRIGHT 30 //右键被点的图片的个数
#define ANGRY 26     //生气时候的图片的个数

#define RATE 0.12    //每张图片显示的时间

@interface ViewController ()

@property(nonatomic,strong)UIButton * eatButton;//吃东西的按钮
@property(nonatomic,strong)UIButton * fartButton;//放P的按钮
@property(nonatomic,strong)UIButton * drinkButton;//喝东西的按钮
@property(nonatomic,strong)UIButton * scratchButton;//挠人的按钮
@property(nonatomic,strong)UIButton * pieButton;//扔东西的按钮
@property(nonatomic,strong)UIButton * cymbalButton;//敲锣的按钮

@property(nonatomic,strong)UIButton * knockoutButton;//被敲晕的按钮
@property(nonatomic,strong)UIButton * footleftButton;//左脚被点的按钮
@property(nonatomic,strong)UIButton * footrightButton;//右脚被点的按钮
@property(nonatomic,strong)UIButton * angryButton;//生气的按钮



@property(nonatomic,strong)UIImageView * mainView;

//按钮的动作回调监听
-(void)clickButton:(id) sender;

//开启动画的方法打包
-(void)play:(NSString *)picName Count:(int)count;

//自定义初始化按钮的方法
-(UIButton *)allocButtonpicName:(NSString *)picName
          myCGRect:(CGRect)rect
             myTag:(NSInteger)tag;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //初始化主页面
    self.mainView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].applicationFrame];
    UIImage * mainImage = [UIImage imageNamed:@"angry_00.jpg"];
    self.mainView.image = mainImage;
    
   //初始化吃东西按钮

    self.eatButton = [self allocButtonpicName:@"eat.png"
                                     myCGRect:CGRectMake(10, 400, 60, 60)
                                        myTag:1];
    
    //初始化放P按钮
    self.fartButton = [self allocButtonpicName:@"fart.png"
                                     myCGRect:CGRectMake(10, 470, 60, 60)
                                        myTag:2];
    
    //初始化喝牛奶按钮
    self.drinkButton = [self allocButtonpicName:@"drink.png"
                                       myCGRect:CGRectMake(10, 540, 60, 60)
                                          myTag:3];

    //初始化挠人按钮
    self.scratchButton = [self allocButtonpicName:@"scratch.png"
                                         myCGRect:CGRectMake(305, 400, 60, 60)
                                            myTag:4];
    
    
    //初始化扔东西按钮
    self.pieButton = [self allocButtonpicName:@"pie.png"
                                     myCGRect:CGRectMake(305, 470, 60, 60)
                                        myTag:5];
    
    //初始化敲锣的按钮
    self.cymbalButton = [self allocButtonpicName:@"cymbal.png"
                                        myCGRect:CGRectMake(305, 540, 60, 60)
                                           myTag:6];
    
    
    //初始化被敲晕的按钮
    self.knockoutButton = [self allocButtonpicName:nil
                                          myCGRect:CGRectMake(70, 120, 230, 230)
                                             myTag:7];
    
    //初始化左脚的按钮
    self.footleftButton = [self allocButtonpicName:nil
                                          myCGRect:CGRectMake(135, 605, 40, 40)
                                             myTag:8];
    //初始化右脚的按钮
    self.footrightButton = [self allocButtonpicName:nil
                                          myCGRect:CGRectMake(195, 605, 40, 40)
                                             myTag:9];
    
    //初始化生气的按钮
    self.angryButton = [self allocButtonpicName:nil
                                       myCGRect:CGRectMake(250, 520, 40, 80)
                                          myTag:10];
    
    //主面板添加汤姆猫主页面
    [self.view addSubview:self.mainView];
    [self.view addSubview:self.eatButton];
    [self.view addSubview:self.fartButton];
    [self.view addSubview:self.drinkButton];
    [self.view addSubview:self.scratchButton];
    [self.view addSubview:self.pieButton];
    [self.view addSubview:self.cymbalButton];
    
    [self.view addSubview:self.footleftButton];
    [self.view addSubview:self.footrightButton];
    [self.view addSubview:self.knockoutButton];
    [self.view addSubview:self.angryButton];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 按钮监听(按钮的回调方法)
 */
-(void)clickButton:(id)sender
{
    UIButton * button = sender;
    
    //说明是吃东西的按钮被点击
    if (button.tag == 1)
    {
        [self play:@"eat" Count:EAT];
    }
    
    //说明是放P的按钮被点击
    else if (button.tag == 2)
    {
        [self play:@"fart" Count:FART];
    }
    
    //说明是喝牛奶的按钮被点击
    else if (button.tag == 3)
    {
        [self play:@"drink" Count:DRINK];
    }
    
    //说明是挠人的按钮被点击
    else if (button.tag == 4)
    {
        [self play:@"scratch" Count:SCRATCH];
    }
    
    //说明是扔东西的按钮被点击
    else if(button.tag == 5)
    {
        [self play:@"pie" Count:PIE];
    }
    
    //说明是敲锣的按钮被点击
    else if(button.tag == 6)
    {
        [self play:@"cymbal" Count:CYMBAL];
    }
    
    //说明是被敲脑袋的按钮被点击
    else if(button.tag == 7)
    {
        [self play:@"knockout" Count:KNOCKOUT];
    }
    
    //说明是被点了左脚(按照人的左右)
    else if(button.tag == 8)
    {
        [self play:@"footRight" Count:FOOTRIGHT];
    }
    
    //说明被点了右脚(按照人的左右)
    else if(button.tag == 9)
    {
        [self play:@"footLeft" Count:FOOTLEFT];
    }
    
    //被点了尾巴，生气
    else if(button.tag == 10)
    {
        [self play:@"angry" Count:ANGRY];
    }
}

/**
 动画开始播放
 */
-(void)play:(NSString *)picName Count:(int)count
{
    
    //如果正在执行动画
    if ([self.mainView isAnimating])
    {
        return ;//啥也不做
    }
    
    //初始化图片数组
    NSMutableArray * picArray = [[NSMutableArray alloc]initWithCapacity:2];
    
    for (int i = 0; i < count; i++)
    {
        //初始化图片名称
        NSString * picname = [NSString stringWithFormat:@"%@_%02d.jpg",picName,i];
        
        //初始化路径
        NSString * path = [[NSBundle mainBundle] pathForResource:picname ofType:nil];
        
        /*加载图片的另一种方式,这种方式的缺点是将图片读到内存，只有当程序关闭的时候才会释放，这样就会造成很多资源的浪费，消耗内存太大，以至于被苹果out
        UIImage * image1 = [UIImage imageNamed:@picName];
         */
        
        //加载图片
        UIImage * imageTemp = [UIImage imageWithContentsOfFile:path];
        
        //添加到数组
        [picArray addObject:imageTemp];
    }

    self.mainView.animationImages = picArray;
    
    //设置持续时间
    self.mainView.animationDuration = count * RATE;
    
    //重复播放次数
    self.mainView.animationRepeatCount = 1;
    
    //开启动画
    [self.mainView startAnimating];

    //延迟清空
    [self.mainView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:count * RATE];
    
}

/**
 初始化按钮的方法
 */
-(UIButton *)allocButtonpicName:(NSString *)picName
          myCGRect:(CGRect)rect
             myTag:(NSInteger)tag
{
    
    //初始化按钮
    UIButton * button = [[UIButton alloc] initWithFrame:rect];//初始化范围

    UIImage * Image = [UIImage imageNamed:picName];//初始化背景图片
    
    button.tag = tag;//初始化tag值
    
    [button setImage:Image forState:UIControlStateNormal];//设置背景图片
    
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];//添加回调
    return button;
}


@end
