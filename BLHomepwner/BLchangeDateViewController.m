//
//  BLchangeDateViewController.m
//  BLHomepwner
//
//  Created by Diego Sebastián Monteagudo Díaz on 12/2/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "BLchangeDateViewController.h"

@interface BLchangeDateViewController ()
@end


@implementation BLchangeDateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
 
    
    
}

-(void)viewWillAppear:(BOOL)animated{
    [self.datePicker setDate:self.item.dateCreated];
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    // Clear first responder
    [self.view endEditing:YES];
    // "Save" changes to item
    BLItem *item = self.item;
    item.dateCreated = [self.datePicker date];
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
