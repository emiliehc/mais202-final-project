//
//  ViewController.m
//  FoodClassifier
//
//  Created by Hongjun Chen on 2021-02-26.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)getImage {
    @autoreleasepool {
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        picker.delegate = self;
        picker.allowsEditing = NO;
        [self presentViewController:picker animated:YES completion:^{
            NSLog(@"Finished loading image chooser");
        }];
    }
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info {
    UIImage *chosenImage = info[UIImagePickerControllerOriginalImage];
    UIImageView* view = (UIImageView*)[self.view viewWithTag:192];
    view.image = chosenImage;
    
    [self dismissViewControllerAnimated:YES completion:^{
        NSLog(@"Image chooser closed");
    }];
    
    NSLog(@"Image picked");
}


- (IBAction)onUploadButtonPress:(id)sender {
    [self getImage];
}


@end
