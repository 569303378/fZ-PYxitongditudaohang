//
//  ViewController.m
//  PYdiaoyongxitongditu2
//
//  Created by Apple on 16/8/20.
//  Copyright © 2016年 Apple. All rights reserved.
//

#import "ViewController.h"
//定位头文件
#import <CoreLocation/CoreLocation.h>
//地图显示头文件
#import <MapKit/MapKit.h>
//#import "RootViewController.h"

@interface ViewController ()
//地理编码对象
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (strong, nonatomic)CLGeocoder *geocoder;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //1. 初始化
    self.geocoder = [[CLGeocoder alloc] init];
    
    //2. 调用方法, 实现定位
//    [self location1String:self.textField.text];
}
- (IBAction)buttonActionDitu:(UIButton *)sender {
    //2. 调用方法, 实现定位
    [self location1String:self.textField.text];
}
#pragma  mark ------ 确定一个城市的位置 -------
- (void)location1String:(NSString *)str{
    
    [self.geocoder geocodeAddressString:str completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        
        //获取第一个地标
        CLPlacemark *placeMark = [placemarks firstObject];
        
        //将定位地标, 转换为地图地标
        MKPlacemark *MKplaceMark = [[MKPlacemark alloc] initWithPlacemark:placeMark];
        
        //字典中放一个地图类型
        NSDictionary *dic = @{MKLaunchOptionsMapTypeKey:@(MKMapTypeStandard)};
        
        //初始化地图组
        MKMapItem *mapItem = [[MKMapItem alloc] initWithPlacemark:MKplaceMark];
        
        
        //打开地图, 根据地图类型
        [mapItem openInMapsWithLaunchOptions:dic];
        
        
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
