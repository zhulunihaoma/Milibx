//
//  CheckIdViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/25.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "CheckIdViewController.h"
#import "MLloginRequest.h"
#import "ModifyPasswordViewController.h"

@interface CheckIdViewController ()
{
    UITextField *Idcard;
    UITextField *PhoneNum;
    UITextField *TestNum;
    UIButton *NextBtn;
    UITextField *selectField;

}
@end

@implementation CheckIdViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"身份验证";
    self.navigationView.backgroundColor = [UIColor whiteColor];
    [self.navigationView.leftBtn setImage:[UIImage imageNamed:@"back-btn"] forState:UIControlStateNormal];
    [self.navigationView.leftBtn setImage:[UIImage imageNamed:@"back-btn"] forState:UIControlStateHighlighted];
    self.navigationView.lineImageView.hidden = YES;
    [self setupviews];

//    back-btn
    // Do any additional setup after loading the view.
}

-(void)setupviews{
    
    //    身份证号码
    Idcard = [[UITextField alloc]init];
    Idcard.placeholder = @"请输入用户名";
    Idcard.clearButtonMode= YES;
    [self.view addSubview:Idcard];
    Idcard.x = 32;
    Idcard.y = NaviHeight +77;
    Idcard.width = SCREEN_WIDTH - 64;
    Idcard.height = 50;
    [self setBorderWithView:Idcard top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [Idcard addTarget:self action:@selector(EditingChanged:) forControlEvents:UIControlEventEditingChanged];

    
    
    //  手机号码
    PhoneNum = [[UITextField alloc]init];
    PhoneNum.placeholder = @"请输入密码";
    [self.view addSubview:PhoneNum];
    
    PhoneNum.x = 32;
    PhoneNum.y = Idcard.bottom+13;
    PhoneNum.width = SCREEN_WIDTH - 64;
    PhoneNum.height = 50;
    PhoneNum.clearButtonMode= YES;
    [self setBorderWithView:PhoneNum top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [PhoneNum addTarget:self action:@selector(EditingChanged:) forControlEvents:UIControlEventEditingChanged];

    
    //  验证码
    TestNum = [[UITextField alloc]init];
    TestNum.placeholder = @"请输入密码";
    [self.view addSubview:TestNum];
    TestNum.x = 32;
    TestNum.y = PhoneNum.bottom+13;
    TestNum.width = SCREEN_WIDTH - 64;
    TestNum.height = 50;
    [self setBorderWithView:TestNum top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [TestNum addTarget:self action:@selector(EditingChanged:) forControlEvents:UIControlEventEditingChanged];

    
    UIButton *TestNumicon = [[UIButton alloc]init];
    
    TestNumicon.backgroundColor = [UIColor clearColor];
    TestNumicon.backgroundColor = MLNaviColor;
    [TestNumicon setTitle:@"发送验证码" forState:UIControlStateNormal];
    TestNumicon.titleLabel.font = TextFontSize(14);

    
    TestNumicon.size = CGSizeMake(85, 35);
    TestNumicon.x = PhoneNum.width - 87;
    TestNumicon.centerY = PhoneNum.height/2;
    [TestNumicon addTarget:self action:@selector(changestatte:) forControlEvents:UIControlEventTouchUpInside];
    
    [TestNum addSubview:TestNumicon];
    
    
    
    
    
    
    NextBtn = [[UIButton alloc]init];
    NextBtn.backgroundColor = MLNaviColor;
    [NextBtn setTitle:@"下一步" forState:UIControlStateNormal];
    [self.view addSubview:NextBtn];
    [NextBtn addTarget:self action:@selector(GoNext) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:NextBtn];
    NextBtn.x = 32;
    NextBtn.y = TestNum.bottom+60;
    NextBtn.width = SCREEN_WIDTH - 64;
    NextBtn.height = 50;
    NextBtn.layer.cornerRadius = 6;
    NextBtn.titleLabel.font = TextFontSize(17);
    [PhoneNum addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [Idcard addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];
    [TestNum addTarget:self action:@selector(EditingDidBegin:) forControlEvents:UIControlEventEditingDidBegin];

  
    
}
- (void)setBorderWithView:(UIView *)view top:(BOOL)top left:(BOOL)left bottom:(BOOL)bottom right:(BOOL)right borderColor:(UIColor *)color borderWidth:(CGFloat)width
{
    if (top) {
        CALayer *layer = [[CALayer alloc]init];
        layer.frame = CGRectMake(0, 0, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (left) {
        CALayer *layer = [[CALayer alloc]init];
        layer.frame = CGRectMake(0, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (bottom) {
        CALayer *layer = [[CALayer alloc]init];
        layer.frame = CGRectMake(0, view.frame.size.height - width, view.frame.size.width, width);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
    if (right) {
        CALayer *layer = [[CALayer alloc]init];
        layer.frame = CGRectMake(view.frame.size.width - width, 0, width, view.frame.size.height);
        layer.backgroundColor = color.CGColor;
        [view.layer addSublayer:layer];
    }
}
-(void)EditingDidBegin:(id)sender{
    
    [self setBorderWithView:selectField top:NO left:NO bottom:YES right:NO borderColor:HLSColor(229, 235, 232) borderWidth:1];
    [self setBorderWithView:sender top:NO left:NO bottom:YES right:NO borderColor:MLNaviColor borderWidth:1];
    selectField = sender;
    
    
}
-(void)changestatte:(UIButton *)sender{
    sender.selected = !sender.selected;
    if (sender.selected) {
        PhoneNum.secureTextEntry = NO;
    }else{
        PhoneNum.secureTextEntry = YES;
        
    }
}
-(void)GoNext{
    ModifyPasswordViewController *mvc = [[ModifyPasswordViewController alloc]init];
    
    [self.navigationController pushViewController:mvc animated:YES];
}
-(void)login{
    
    
    
//    [MLloginRequest PostLoginWithloginName:Idcard.text WithPhoneNum:[MD5Tool md5:PhoneNum.text] token:nil Success:^(NSDictionary *dic) {
//        HLSLog(@"aa:%@",dic);
//        //        [self back];
//        NSMutableDictionary *userdic = [dic xyValueForKey:@"result"];
//        DEF_PERSISTENT_SET_OBJECT(userdic, @"userinfo");
//        userstring = [JSONTool dictionaryToJson:[HLSPersonalInfoTool getUserinfo]];
//        HLSLog(@"--本地%@",userstring);
//        [self initwebview];
//
//        [HLSLable lableWithText:@"登录成功！"];
//
//    } failure:^(NSError *error) {
//
//    }];
}

#pragma mark --EditingChanged
-(void)EditingChanged:(UITextField *)TextField{
    if (TextField == Idcard) {
        if (TextField.text.length >18) {
            TextField.text = [TextField.text substringToIndex:18];
        }
    }
    if (TextField == PhoneNum) {
        if (TextField.text.length >11) {
            TextField.text = [TextField.text substringToIndex:11];
        }
    }
    if (TextField == TestNum) {
        if (TextField.text.length >6) {
            TextField.text = [TextField.text substringToIndex:6];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
