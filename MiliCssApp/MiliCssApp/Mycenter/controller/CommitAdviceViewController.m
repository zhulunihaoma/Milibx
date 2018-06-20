//
//  CommitAdviceViewController.m
//  MiliCssApp
//
//  Created by 朱璐 on 2018/5/31.
//  Copyright © 2018年 zhu. All rights reserved.
//

#import "CommitAdviceViewController.h"
#import "HLSPhotoView.h"
#import "CollectActionSheet.h"
#import "MLMyRequest.h"
#import "HLSSelectImageTool.h"
//详情颜色
#define MLHolderColor HLSColor(193, 193, 193)

@interface CommitAdviceViewController ()<UITextViewDelegate,HLSPhotoViewDelegate,UIActionSheetDelegate>
{
    HLSPhotoView *AddPhotoView;
}
@property(nonatomic,strong)UITextView *adViceView;
@property (nonatomic,strong) NSMutableArray *photoArr;
@property (nonatomic,assign) NSInteger currentTag;
@end

@implementation CommitAdviceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title = @"意见反馈";
    self.navigationView.hidden = YES;
    [self SetupSubViews];
}
-(void)SetupSubViews{
    UIImageView *bgimg = [[UIImageView alloc]init];
    NSString *SourceName;
    
    if (NaviHeight == 64) {
        SourceName  = @"bj_feedback";
    }else{
        SourceName  = @"x_bj_feedback";
        
    }
    
    
    bgimg.image = [UIImage imageNamed:SourceName];
    [self.view addSubview:bgimg];
    bgimg.userInteractionEnabled = YES;
    [bgimg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    // 名称
    UILabel *TittleLab = [HLSLable LabelWithFont:17 WithTextalignment:NSTextAlignmentCenter WithTextColor:[UIColor whiteColor] WithFatherView:bgimg];
    TittleLab.sd_layout
    .heightIs(17)
    .topSpaceToView(bgimg, StatueBarHeight+12)
    .centerXEqualToView(bgimg);
    [TittleLab setSingleLineAutoResizeWithMaxWidth:(200)];
    
    TittleLab.text = @"意见反馈";
    
//    返回按钮
    
    UIButton *leftBtn = [[UIButton alloc]init];
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateHighlighted];
    leftBtn.y = StatueBarHeight;
    leftBtn.width = NaviHeight - StatueBarHeight;
    leftBtn.height = NaviHeight - StatueBarHeight;
    leftBtn.x = NaviLeftPadding;
    leftBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    leftBtn.contentMode = UIViewContentModeCenter;
    [leftBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];

    [bgimg addSubview:leftBtn];
    
// 意见反馈输入框
    //创建textfield
    UITextView *adViceView = [[UITextView alloc]init];
    _adViceView = adViceView;
    adViceView.delegate = self;
    
    [bgimg addSubview:adViceView];
//    [adViceView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(@30);
//        make.top.mas_equalTo(@(25+NaviHeight));
//        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH-60, 137));
//    }];
    adViceView.frame = CGRectMake(30, 47+NaviHeight, SCREEN_WIDTH-60, 137);
    adViceView.text = @"请简明扼要的描述你的问题，我们会详细为你做出解答。";
    adViceView.textColor = MLHolderColor;
    adViceView.font = [UIFont systemFontOfSize:15];
    adViceView.textAlignment = NSTextAlignmentLeft;
    
    
    adViceView.layer.borderColor = MLNaviColor.CGColor;
    adViceView.layer.borderWidth = 0.5;
    
    
    HLSPhotoView *photoView = [[HLSPhotoView alloc]init];
//            photoView.backgroundColor = MLBGColor;
    photoView.delegate = self;
    photoView.x = 30;
    photoView.y = 195+NaviHeight;
    photoView.width = SCREEN_WIDTH-20;
    photoView.height = 90+20;
    photoView.lable.text = @"最多添加三张图片";
//    photoView.lable.textColor = HLSColor(102, 102, 102);
    //        photoView.lable.backgroundColor = HLSGreenColor;
    photoView.lable.font = [UIFont systemFontOfSize:12.5];
    [bgimg addSubview:AddPhotoView = photoView];
    self.photoArr = [NSMutableArray array];
    
    UIButton *CommitBtn = [[UIButton alloc]init];

    [bgimg addSubview:CommitBtn];
    [CommitBtn setBackgroundImage:[UIImage imageNamed:@"btn_login"] forState:UIControlStateNormal];
    [CommitBtn setTitle:@"提交" forState:UIControlStateNormal];
    [CommitBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [CommitBtn sizeToFit];
    
    CommitBtn.centerX = SCREEN_WIDTH/2;
//    CommitBtn.y = photoView.bottom + 12;
        CommitBtn.y = photoView.bottom + 30;

    
}
- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(BOOL)textViewShouldBeginEditing:(UITextView *)textView

{
    if ([self.adViceView.text isEqualToString:@"请简明扼要的描述你的问题，我们会详细为你做出解答。"]) {
        self.adViceView.text=@"";
        
        self.adViceView.textColor = [UIColor blackColor];
    }
    
    
    return YES;
    
}

//结束编辑弹下键盘
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
    if ([self.adViceView.text length]==0) {
        self.adViceView.text = @"尽量详细描述您的信息，我们会努力为您解决问题，谢谢您的宝贵意见";
        self.adViceView.textColor = MLHolderColor;
        
    }
    
}


/**
 *  通知
 */
- (void)textViewEditChanged:(NSNotification *)notification {
    UITextView *textField = (UITextView *)notification.object;
    
    NSInteger length = 200;
    NSString *toBeString = textField.text;
    NSArray *currentar = [UITextInputMode activeInputModes];
    UITextInputMode *current = [currentar firstObject]; // 键盘输入模式
    if ([current.primaryLanguage isEqualToString:@"zh-Hans"]) { // 简体中文输入，包括简体拼音，健体五笔，简体手写
        UITextRange *selectedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:selectedRange.start offset:0];
        // 没有高亮选择的字，则对已输入的文字进行字数统计和限制
        if (!position) {
            if (toBeString.length > length) {
                [HLSLable lableWithText:@"最多不超过200个字"];
                
                textField.text = [toBeString substringToIndex:length];
            }
        }
        // 有高亮选择的字符串，则暂不对文字进行统计和限制
        else{
            
        }
    }
    // 中文输入法以外的直接对其统计限制即可，不考虑其他语种情况
    else{
        if (toBeString.length > length) {
            textField.text = [toBeString substringToIndex:length];
            [HLSLable lableWithText:@"最多不超过200个字"];
        }
    }
    
    
}
#pragma mark - HLSPhotoViewDelegate
- (void)photoView:(HLSPhotoView *)photoView clickIndex:(NSInteger)index {
    NSArray *titlesArr = nil;
    self.currentTag = index;
    if (index == 0) {
        titlesArr = @[@"从手机相册中选择",@"拍照"];
    }else {
        titlesArr = @[@"从手机相册中选择",@"拍照"];
        
    }
    CollectActionSheet *actionSheet = [[CollectActionSheet alloc]initWithTitle:nil cancelTitle:@"取消"otherTitles:titlesArr];
    actionSheet.delegate = self;
    //    [self.view addSubview:actionSheet];
    [actionSheet showInView:self.view];
    
    
}

-(void)Deletephoto:(HLSPhotoView *)photoView clickIndex:(NSInteger)index{
    [self.photoArr removeObjectAtIndex:index - 1];
    AddPhotoView.photoArr = self.photoArr;
    
}
#pragma mark - UIActionSheetDelegate
- (void)collectActionSheet:(CollectActionSheet *)collectActionSheet selectedIndex:(NSInteger)index {
    UIImagePickerController *ipc=[[UIImagePickerController alloc]init];
    ipc.delegate=self;
    ipc.allowsEditing = YES;
    if (index == 1) {//从手机相册中选则
        self.photoArr = AddPhotoView.photoArr;
        [ipc setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
        [self presentViewController:ipc animated:YES completion:nil];
    }else if (index == 2){//拍照
        [ipc setSourceType:UIImagePickerControllerSourceTypeCamera];
        self.photoArr = AddPhotoView.photoArr;
        
        [self presentViewController:ipc animated:YES completion:nil];
    }else if (index == 3) {//删除
        [self.photoArr removeObjectAtIndex:self.currentTag - 1];
        AddPhotoView.photoArr = self.photoArr;
    }
}
#pragma mark - UIImagePickerControllerDelegate
//选完图片后调用
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
    UIImage *image= [info objectForKey:@"UIImagePickerControllerEditedImage"];
    NSData *imageData = [HLSSelectImageTool selectImageWithImage:image];
    
    [self showMLhud];
    
    [MLMyRequest PostUploadPictureWithfile:imageData Success:^(NSDictionary *dic) {
        [self.HUD hideAnimated:YES];
        HLSLog(@"---上传图片:%@",dic);
        if ([[dic xyValueForKey:@"code"] integerValue] == 10318888) {
            
                        NSString *Currentimg = [[dic xyValueForKey:@"result"] xyValueForKey:@"imgUrl"];
            HLSLog(@"---上传图片成功:%@",Currentimg);

            
                        NSString *url = Currentimg;
                        if (self.currentTag == 0) {
                            [self.photoArr addObject:url];
                        }else {
                            [self.photoArr removeObjectAtIndex:self.currentTag-1 ];
                            [self.photoArr insertObject:url atIndex:self.currentTag -1];
                        }
            
                        AddPhotoView.photoArr = self.photoArr;
            
            
        }else{
            [HLSLable lableWithText:[dic xyValueForKey:@"message"]];
        }
    } failure:^(NSError *error) {
        
    }];
    
    
    
    
    
//    [HLSPCTHttpTools PostUploadPictureWithfile:imageData WithimgBelong:@"others" Success:^(NSDictionary *dic) {
//        self.HUD.hidden = YES;
//        if ([[dic xyValueForKey:@"ok"] boolValue]) {
//
//
//            NSString *url = [dic xyValueForKey:@"res"];
//            if (self.currentTag == 0) {
//                [self.photoArr addObject:url];
//            }else {
//                [self.photoArr removeObjectAtIndex:self.currentTag-1 ];
//                [self.photoArr insertObject:url atIndex:self.currentTag -1];
//            }
//
//            AddPhotoView.photoArr = self.photoArr;
//        }else{
//            [HLSLable lableWithText:[dic xyValueForKey:@"message"] inView:self.view];
//
//        }
//    } failure:^(NSError *error) {
//        [self.HUD hide:YES];
//    }];
    
    //
    //    [HLSPostRequest postUploadimgforgoodsWithFile:imageData success:^(NSDictionary *dict) {
    //           } failure:^(NSError *error) {
    //
    //    }];
    
    
    [self dismissViewControllerAnimated:YES completion:Nil];
}

-(void)dealloc{
    
    [[NSNotificationCenter defaultCenter]removeObserver:self
                                                   name:UITextViewTextDidChangeNotification
                                                 object:nil];
    
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
