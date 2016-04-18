//
//  ViewController.m
//  SQLITE3Demo
//
//  Created by 刘康 on 16/2/26.
//  Copyright © 2016年 刘康. All rights reserved.
//

#import "ViewController.h"
#import "DataHelper.h"

@interface ViewController ()
@property (strong, nonatomic)DataHelper* dataHelper;
@property (weak, nonatomic) IBOutlet UIView *cornerView;
@property (weak, nonatomic) IBOutlet UIImageView *avatar;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.dataHelper = [DataHelper new];
    //[self.view.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    
//    self.cornerView.layer.cornerRadius = 10.f;
//    self.cornerView.layer.masksToBounds = YES;
    
//    self.avatar.image = [UIImage imageNamed:@"avatar.jpg"];
//    self.avatar.layer.cornerRadius = 10.f;
//    self.avatar.layer.masksToBounds = YES;

    
    self.cornerView.backgroundColor = [UIColor clearColor];
    self.cornerView.layer.backgroundColor = [UIColor cyanColor].CGColor;
    self.cornerView.layer.cornerRadius = 10.f;
    self.cornerView.layer.masksToBounds = NO;
    self.cornerView.layer.shouldRasterize = YES;
    [self.cornerView.layer setRasterizationScale:[UIScreen mainScreen].scale];
    
    
    UIGraphicsBeginImageContextWithOptions(self.avatar.bounds.size, NO, 1.0);
    UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:self.avatar.bounds byRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10.f, 10.f)];
    [path addClip];
    UIImage* image = [UIImage imageNamed:@"avatar.jpg"];
    [image drawInRect:self.avatar.bounds];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    self.avatar.image = newImage;
    
}

- (IBAction)tap:(UIButton *)sender {
    if (sender.tag == 0) {
        [self.dataHelper openDatabase];
    } else if (sender.tag == 1) {
        [self.dataHelper insertData];
    } else {
        [self.dataHelper readData];
    }
}


@end
