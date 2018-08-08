//

#import "LYViewController.h"
#import "LYLoadLocalController.h"
#import "LYLoadRemoteImageController.h"
@interface LYViewController ()

@end

@implementation LYViewController
- (IBAction)loadLocalImageClick:(UIButton *)sender {
    LYLoadLocalController *con = [[LYLoadLocalController alloc]init];
    [self presentViewController:con animated:YES completion:nil];
}
- (IBAction)loadRemoteImageClick:(UIButton *)sender {
    LYLoadRemoteImageController *con = [[LYLoadRemoteImageController alloc]init];
    [self presentViewController:con animated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
