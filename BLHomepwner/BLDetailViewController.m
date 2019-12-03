//
//  BLDetailViewController.m
//  BLHomepwner
//
//  Created by Diego Sebastián Monteagudo Díaz on 12/2/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "BLDetailViewController.h"
#import "BLImageStore.h"
@interface BLDetailViewController () <UINavigationControllerDelegate,UIImagePickerControllerDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIToolbar *toolbar;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;


@property (weak, nonatomic) IBOutlet UITextField *valueField;
@property (weak, nonatomic) IBOutlet UITextField *serialField;
@property (weak, nonatomic) IBOutlet UITextField *nameField;


@end

@implementation BLDetailViewController

-(IBAction)clearImageView:(id)sender{
    
    self.imageView.image = nil;
   
    NSString *imageKey = self.item.itemKey;
    // Get the image for its image key from the image store
    [[BLImageStore sharedStore] deleteImageForKey:imageKey];
    // Use that image to put on the screen in the imageView
    self.imageView.image = nil;
    
}
- (IBAction)backgroundTapped:(id)sender
{
    
    [self.view endEditing:YES];
}

- (void)imagePickerController:(UIImagePickerController *)picker
didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // Get picked image from info dictionary
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    [[BLImageStore sharedStore] setImage:image
                                   forKey:self.item.itemKey];
    // Put that image onto the screen in our image view
    self.imageView.image = image;
    // Take image picker off the screen -
    // you must call this dismiss method
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)takePicure:(id)sender {
    
    UIImagePickerController *imagePicker =
    [[UIImagePickerController alloc] init];
    // If the device has a camera, take a picture, otherwise,
    // just pick from photo library
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        CGRect overlayRect = CGRectMake(0, 0,300,     150);
        
        UIView *overlayView = [[UIView alloc] initWithFrame:overlayRect];
        [imagePicker setCameraOverlayView:overlayView];

    } else {
        imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    imagePicker.delegate = self;
    imagePicker.allowsEditing = YES;
    
    [self presentViewController:imagePicker animated:YES completion:nil];
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    BLItem *item = self.item;
    self.nameField.text = item.itemName;
    self.serialField.text = item.serialNumber;
    self.valueField.text = [NSString stringWithFormat:@"%d", item.valueInDollars];
    // You need an NSDateFormatter that will turn a date into a simple date string
    static NSDateFormatter *dateFormatter = nil;
    if (!dateFormatter) {
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateStyle = NSDateFormatterMediumStyle;
        dateFormatter.timeStyle = NSDateFormatterNoStyle;
    }
     self.dateLabel.text = [dateFormatter stringFromDate:item.dateCreated];
    
    NSString *imageKey = self.item.itemKey;
    // Get the image for its image key from the image store
    UIImage *imageToDisplay = [[BLImageStore sharedStore] imageForKey:imageKey];
    // Use that image to put on the screen in the imageView
    self.imageView.image = imageToDisplay;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES; }
-(IBAction)changeDate:(id)sender{
    BLchangeDateViewController *changeDateViewController =
    [[BLchangeDateViewController alloc] init];
    changeDateViewController.item = self.item;
 
    
    // Push it onto the top of the navigation controller's stack
    [self.navigationController pushViewController:changeDateViewController
                                         animated:YES];
}
- (void)addDoneButton {
    UIToolbar* keyboardToolbar = [[UIToolbar alloc] init];
    [keyboardToolbar sizeToFit];
    UIBarButtonItem *flexBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace
                                      target:nil action:nil];
    UIBarButtonItem *doneBarButton = [[UIBarButtonItem alloc]
                                      initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                      target:self.view action:@selector(endEditing:)];
    keyboardToolbar.items = @[flexBarButton, doneBarButton];
    self.valueField.inputAccessoryView = keyboardToolbar;
}
- (void)setItem:(BLItem *)item
{
    _item = item;
    self.navigationItem.title = _item.itemName;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    // Clear first responder
    [self.view endEditing:YES];
    // "Save" changes to item
    BLItem *item = self.item;
    item.itemName = self.nameField.text;
    item.serialNumber = self.serialField.text;
    item.valueInDollars = [self.valueField.text intValue];
}

@end
