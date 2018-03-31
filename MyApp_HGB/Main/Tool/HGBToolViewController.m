//
//  HGBToolViewController.m
//  MyApp_HGB
//
//  Created by huangguangbao on 2017/9/12.
//  Copyright © 2017年 agree.com.cn. All rights reserved.
//

#import "HGBToolViewController.h"
#import "HGBCommonSelectCell.h"
#import "HGBJSONViewController.h"
#import "HGBXMLViewController.h"
#import "HGBJSViewController.h"
#import "HGBFileManage.h"
#import "HGBFileCompressViewController.h"
#import "HGBOUTViewController.h"
#import "HGBQuickLookViewController.h"
#import "HGBAPPCheckViewController.h"
#import "HGBExceptionViewController.h"
#import "HGBThreadViewController.h"
#import "HGBPredicateViewController.h"
#import "HGBCommunicationViewController.h"
#import "HGBURLViewController.h"
#import "HGBTouchViewController.h"
#import "HGBLocationViewController.h"
#import "HGBMediaViewController.h"
#import "HGBAPPInfoViewController.h"
#import "HGBDeviceViewController.h"
#import "HGBSandBoxViewController.h"
#import "HGBDataBaseViewController.h"
#import "HGBFileViewController.h"
#import "HGBClearViewController.h"
#import "HGBDefaultsViewController.h"
#import "HGBKeychainViewController.h"
#import "HGBTimeToolViewController.h"
#import "HGBStringViewController.h"
#import "HGBCodeViewController.h"
#import "HGBImageViewController.h"
#import "HGBSizeViewController.h"
#import "HGBColorViewController.h"
#import "HGBShotScreenViewController.h"
#import "HGBNetWorkViewController.h"
#import "HGBEncryptViewController.h"
#import "HGBPurchaseViewController.h"
#import "HGBCoordinateViewController.h"
#import "HGBBlockViewController.h"
#import "HGBFontViewController.h"
#import "HGBMacroViewController.h"
#import "HGBBatteryViewController.h"
#import "HGBMailListViewController.h"
#import "HGBImageToPDFViewController.h"
#import "HGBHTMLtoPDFViewController.h"
#import "HGBVersionViewController.h"
#import "HGBURLToolViewController.h"
#import "HGBWIFIViewController.h"
#import "HGBINBluetoothViewController.h"
#import "HGBBluetoothViewController.h"
#import "HGBBlueToothPrintViewController.h"
#import "HGBAirPrintViewController.h"
#import "HGBNetworkInfoViewController.h"
#import "HGBAPPStatusViewController.h"
#import "HGBBackgroundViewController.h"
#import "HGBAccelerometerViewController.h"
#import "HGBLightSensitiveViewController.h"
#import "HGBDistanceViewController.h"
#import "HGBDeviceMotionViewController.h"
#import "HGBGyroscopeViewController.h"
#import "HGBStepViewController.h"
#import "HGBAutoScreenLockViewController.h"
#import "HGBOrientationViewController.h"
#import "HGBReminderEventViewController.h"
#import "HGBCalenderEventViewController.h"
#import "HGBDeviceSetViewController.h"
#import "HGBPasteboardViewController.h"
#import "HGBTorchViewController.h"
#import "HGBScreenBrightnessViewController.h"
#import "HGBAudioViewController.h"
#import "HGBVideoViewController.h"
#import "HGB3DTouchViewController.h"
#import "HGBSystemShareViewController.h"
#import "HGBSafariViewController.h"
#import "HGBFileManageViewController.h"
#import "HGBDownLoadViewController.h"
#import "HGBURLProtocolViewController.h"
#import "HGBNotificationViewController.h"
#import "HGBWaterMarkViewController.h"


#define kWidth [[UIScreen mainScreen] bounds].size.width
#define kHeight [[UIScreen mainScreen] bounds].size.height
#define SYSTEM_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]//系统版本号
//屏幕比例
#define wScale kWidth / 750.0
#define hScale kHeight / 1334.0

#define Identify_Cell @"cell"

@interface HGBToolViewController ()
/**
 数据源
 */
@property(strong,nonatomic)NSDictionary *dataDic;
/**
 数据源
 */
@property(strong,nonatomic)NSArray *keys;
@end

@implementation HGBToolViewController

#pragma mark life
- (void)viewDidLoad {
    [super viewDidLoad];
    [self createNavigationItem];//导航栏
    [self viewSetUp];//UI

}
#pragma mark 导航栏
//导航栏
-(void)createNavigationItem
{
    //导航栏
    self.navigationController.navigationBar.barTintColor=[UIColor colorWithRed:0.0/256 green:191.0/256 blue:256.0/256 alpha:1];
    [[UINavigationBar appearance]setBarTintColor:[UIColor colorWithRed:0.0/256 green:191.0/256 blue:256.0/256 alpha:1]];
    //标题
    UILabel *titleLab=[[UILabel alloc]initWithFrame:CGRectMake(0, 0, 136*wScale, 16)];
    titleLab.font=[UIFont boldSystemFontOfSize:16];
    titleLab.text=@"工具";
    titleLab.textAlignment=NSTextAlignmentCenter;
    titleLab.textColor=[UIColor whiteColor];
    self.navigationItem.titleView=titleLab;


    //右键
    self.navigationItem.rightBarButtonItem=[[UIBarButtonItem alloc]initWithTitle:@"文件管理"  style:UIBarButtonItemStylePlain target:self action:@selector(fileHandle)];
    [self.navigationItem.rightBarButtonItem setImageInsets:UIEdgeInsetsMake(0, -15, 0, 5)];
    [self.navigationItem.rightBarButtonItem setTintColor:[UIColor whiteColor]];

}
//返回
-(void)returnhandler{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)fileHandle{
    [HGBFileManage popFileManageControllerInParent:self];
}
#pragma mark UI
-(void)viewSetUp{
    self.tableView=[[UITableView alloc]initWithFrame:CGRectMake(0,0, kWidth, kHeight-44) style:(UITableViewStylePlain)];
    self.tableView.backgroundColor = [UIColor colorWithRed:220.0/256 green:220.0/256 blue:220.0/256 alpha:1];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.tableView];
    self.dataDic=@{@"常用普通工具类":@[@"JSON工具",@"XML工具",@"JS工具",@"崩溃收集工具",@"常用线程工具",@"APP自检工具",@"加密工具",@"网络工具",@"谓词(正则)工具",@"字符串工具",@"时间工具",@"经纬度工具",@"常用块",@"常用宏",@"版本工具",@"URL工具",@"APP内购",@"网络信息",@"APP状态",@"后台执行工具",@"屏幕方向",@"下载管理",@"URL拦截"],@"文件工具":@[@"数据库工具",@"文件压缩工具",@"html转pdf工具",@"文件工具",@"沙盒工具",@"偏好文件工具",@"钥匙串工具",@"清除缓存工具",@"文件管理工具",@"使用外部app打开文件工具",@"quickLook工具",@"图片转pdf"],@"app信息工具":@[@"应用信息",@"设备信息"],@"硬件工具":@[@"通信工具",@"打开外部链接工具",@"指纹(TouchID)工具",@"原生消息工具",@"定位工具",@"多媒体工具",@"电池",@"通讯录",@"WIFI",@"苹果设备专用蓝牙",@"通用蓝牙",@"普通蓝牙打印机",@"苹果隔空打印机",@"加速度传感器",@"光照强度",@"距离传感器",@"手机运动传感器",@"陀螺仪",@"计步器",@"自动锁屏",@"日历提醒",@"事件提醒",@"设备小功能:屏幕亮度，震动等",@"粘贴板",@"手电筒",@"屏幕亮度",@"音频",@"视频",@"3DTouch",@"系统分享",@"Safari"],@"UI相关工具":@[@"二维码条形码生成识别工具",@"尺寸工具",@"截屏工具",@"图片工具",@"颜色工具",@"字体",@"水印"]};
    self.keys=@[@"常用普通工具类",@"文件工具",@"app信息工具",@"硬件工具",@"UI相关工具"];


    [self.tableView registerClass:[HGBCommonSelectCell class] forCellReuseIdentifier:Identify_Cell];
    [self.tableView reloadData];
}
#pragma mark table view delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.keys.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 72 * hScale;
}
-(NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return @[@"未分类",@"文件",@"硬件",@"其他",@"UI"];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWidth, 72* hScale)];
    headView.backgroundColor = [UIColor colorWithRed:220.0/256 green:220.0/256 blue:220.0/256 alpha:1];
    //信息提示栏
    UILabel *tipMessageLabel = [[UILabel alloc]initWithFrame:CGRectMake(32 * wScale, 0, kWidth - 32 * wScale, CGRectGetHeight(headView.frame))];
    tipMessageLabel.backgroundColor = [UIColor clearColor];
    NSString *key=self.keys[section];
    tipMessageLabel.text = key;
    tipMessageLabel.textColor = [UIColor grayColor];
    tipMessageLabel.textAlignment = NSTextAlignmentLeft;
    tipMessageLabel.font = [UIFont systemFontOfSize:12.0];
    tipMessageLabel.numberOfLines = 0;
    [headView addSubview:tipMessageLabel];
    return headView;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSString *key=self.keys[section];
    NSArray *data=self.dataDic[key];
    return data.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HGBCommonSelectCell *cell=[tableView dequeueReusableCellWithIdentifier:Identify_Cell forIndexPath:indexPath];
    NSString *key=self.keys[indexPath.section];
    NSArray *data=self.dataDic[key];
    NSString *string=[data objectAtIndex:indexPath.row];
    cell.title.text=string;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
    if(indexPath.section==0){
        if(indexPath.row==0){
            [self presentController:[[HGBJSONViewController alloc]init]];
        }else if (indexPath.row==1){
            [self presentController:[[HGBXMLViewController alloc]init]];
        }else if (indexPath.row==2){
            [self presentController:[[HGBJSViewController alloc]init]];
        }else if (indexPath.row==3){
            [self presentController:[[HGBExceptionViewController alloc]init]];
        }else if (indexPath.row==4){
            [self presentController:[[HGBThreadViewController alloc]init]];
        }else if (indexPath.row==5){
            [self presentController:[[HGBAPPCheckViewController alloc]init]];
        }else if (indexPath.row==6){
            [self presentController:[[HGBEncryptViewController alloc]init]];
        }else if (indexPath.row==7){
            [self presentController:[[HGBNetWorkViewController alloc]init]];
        }else if (indexPath.row==8){
            [self presentController:[[HGBPredicateViewController alloc]init]];
        }else if (indexPath.row==9){
            [self presentController:[[HGBStringViewController alloc]init]];
        }else if (indexPath.row==10){
            [self presentController:[[HGBTimeToolViewController alloc]init]];
        }else if (indexPath.row==11){
            [self presentController:[[HGBCoordinateViewController alloc]init]];
        }else if (indexPath.row==12){
            [self presentController:[[HGBBlockViewController alloc]init]];
        }else if (indexPath.row==13){
            [self presentController:[[HGBMacroViewController alloc]init]];
        }else if (indexPath.row==14){
            [self presentController:[[HGBVersionViewController alloc]init]];
        }else if (indexPath.row==15){
            [self presentController:[[HGBURLToolViewController alloc]init]];
        }else if (indexPath.row==16){
            [self presentController:[[HGBPurchaseViewController alloc]init]];
        }else if (indexPath.row==17){
            [self presentController:[[HGBNetworkInfoViewController alloc]init]];
        }else if (indexPath.row==18){
            [self presentController:[[HGBAPPStatusViewController alloc]init]];
        }else if (indexPath.row==19){
            [self presentController:[[HGBBackgroundViewController alloc]init]];
        }else if (indexPath.row==20){
            [self presentController:[[HGBOrientationViewController alloc]init]];
        }else if (indexPath.row==21){
            [self presentController:[[HGBDownLoadViewController alloc]init]];
        }else if (indexPath.row==22){
            [self presentController:[[HGBURLProtocolViewController alloc]init]];
        }

    }else if(indexPath.section==1){
        if(indexPath.row==0){
            [self presentController:[[HGBDataBaseViewController alloc]init]];
        }else if (indexPath.row==1){
            [self presentController:[[HGBFileCompressViewController alloc]init]];
        }else if (indexPath.row==2){
            [self presentController:[[HGBHTMLtoPDFViewController alloc]init]];
        }else if (indexPath.row==3){
            [self presentController:[[HGBFileViewController alloc]init]];
        }else if (indexPath.row==4){
          [self presentController:[[HGBSandBoxViewController alloc]init]];
        }else if (indexPath.row==5){
              [self presentController:[[HGBDefaultsViewController alloc]init]];
        }else if (indexPath.row==6){
            [self presentController:[[HGBKeychainViewController alloc]init]];
        }else if (indexPath.row==7){
         [self presentController:[[HGBClearViewController alloc]init]];
        }else if (indexPath.row==8){
            [self presentController:[[HGBFileManageViewController alloc]init]];
        }else if (indexPath.row==9){
            [self presentController:[[HGBOUTViewController alloc]init]];
        }else if (indexPath.row==10){
            [self presentController:[[HGBQuickLookViewController alloc]init]];
        }else if (indexPath.row==11){
            [self presentController:[[HGBImageToPDFViewController alloc]init]];
        }
    }else if(indexPath.section==2){
        if(indexPath.row==0){
            [self presentController:[[HGBAPPInfoViewController alloc]init]];
        }else if (indexPath.row==1){
            [self presentController:[[HGBDeviceViewController alloc]init]];
        }
    }else if(indexPath.section==3){
        if(indexPath.row==0){
            [self presentController:[[HGBCommunicationViewController alloc]init]];
        }else if (indexPath.row==1){
            [self presentController:[[HGBURLViewController alloc]init]];
        }else if (indexPath.row==2){
            [self presentController:[[HGBTouchViewController alloc]init]];
        }else if (indexPath.row==3){
            [self presentController:[[HGBNotificationViewController alloc]init]];
        }else if (indexPath.row==4){
            [self presentController:[[HGBLocationViewController alloc]init]];
        }else if (indexPath.row==5){
            [self presentController:[[HGBMediaViewController alloc]init]];
        }else if (indexPath.row==6){
            [self presentController:[[HGBBatteryViewController alloc]init]];
        }else if (indexPath.row==7){
            [self presentController:[[HGBMailListViewController alloc]init]];
        }else if (indexPath.row==8){
            [self presentController:[[HGBWIFIViewController alloc]init]];
        }else if (indexPath.row==9){
            [self presentController:[[HGBINBluetoothViewController alloc]init]];
        }else if (indexPath.row==10){
            [self presentController:[[HGBBluetoothViewController alloc]init]];
        }else if (indexPath.row==11){
            [self presentController:[[HGBBlueToothPrintViewController alloc]init]];
        }else if (indexPath.row==12){
            [self presentController:[[HGBAirPrintViewController alloc]init]];
        }else if (indexPath.row==13){
            [self presentController:[[HGBAccelerometerViewController alloc]init]];
        }else if (indexPath.row==14){
            [self presentController:[[HGBLightSensitiveViewController alloc]init]];
        }else if (indexPath.row==15){
            [self presentController:[[HGBDistanceViewController alloc]init]];
        }else if (indexPath.row==16){
            [self presentController:[[HGBDeviceMotionViewController alloc]init]];
        }else if (indexPath.row==17){
            [self presentController:[[HGBGyroscopeViewController alloc]init]];
        }else if (indexPath.row==18){
            [self presentController:[[HGBStepViewController alloc]init]];
        }else if (indexPath.row==19){
            [self presentController:[[HGBAutoScreenLockViewController alloc]init]];
        }else if (indexPath.row==20){
            [self presentController:[[HGBCalenderEventViewController alloc]init]];
        }else if (indexPath.row==21){
            [self presentController:[[HGBReminderEventViewController alloc]init]];
        }else if (indexPath.row==22){
            [self presentController:[[HGBDeviceSetViewController alloc]init]];
        }else if (indexPath.row==23){
            [self presentController:[[HGBPasteboardViewController alloc]init]];
        }else if (indexPath.row==24){
            [self presentController:[[HGBTorchViewController alloc]init]];
        }else if (indexPath.row==25){
            [self presentController:[[HGBScreenBrightnessViewController alloc]init]];
        }else if (indexPath.row==26){
            [self presentController:[[HGBAudioViewController alloc]init]];
        }else if (indexPath.row==27){
            [self presentController:[[HGBVideoViewController alloc]init]];
        }else if (indexPath.row==28){
            [self presentController:[[HGB3DTouchViewController alloc]init]];
        }else if (indexPath.row==29){
            [self presentController:[[HGBSystemShareViewController alloc]init]];
        }else if (indexPath.row==30){
            [self presentController:[[HGBSafariViewController alloc]init]];
        }




    }else if(indexPath.section==4){
        if(indexPath.row==0){
            [self presentController:[[HGBCodeViewController alloc]init]];
        }else if (indexPath.row==1){
            [self presentController:[[HGBSizeViewController alloc]init]];
        }else if (indexPath.row==2){
            [self presentController:[[HGBShotScreenViewController alloc]init]];
        }else if (indexPath.row==3){
            [self presentController:[[HGBImageViewController alloc]init]];
        }else if (indexPath.row==4){
            [self presentController:[[HGBColorViewController alloc]init]];
        }else if (indexPath.row==5){
            [self presentController:[[HGBFontViewController alloc]init]];
        }else if (indexPath.row==6){
            [self presentController:[[HGBWaterMarkViewController alloc]init]];
        }
    }
}
-(void)presentController:(UIViewController*)controller{
    UINavigationController *nav=[[UINavigationController alloc]initWithRootViewController:controller];
    [self.tabBarController presentViewController:nav animated:YES completion:nil];
}
#pragma mark get
-(NSDictionary *)dataDic{
    if(_dataDic==nil){
        _dataDic=[NSDictionary dictionary];
    }
    return _dataDic;
}
-(NSArray *)keys{
    if(_keys==nil){
        _keys=[NSArray array];
    }
    return _keys;
}
@end
