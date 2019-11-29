//
//  BLItemsViewController.m
//  BLHomepwner
//
//  Created by Diego Sebastián Monteagudo Díaz on 11/27/19.
//  Copyright © 2019 Diego Sebastián Monteagudo Díaz. All rights reserved.
//

#import "BLItemsViewController.h"
#import "BLItemStore.h"
#import "BLItem.h"

@interface BLItemsViewController ()

@end

@implementation BLItemsViewController
@synthesize headerView = _headerView;
- (void)viewDidLoad {
    [super viewDidLoad];
    
  self.items = [[BLItemStore sharedStore] allItems];
    self.highPrice = [[NSMutableArray alloc]init ];
    self.lowPrice = [[NSMutableArray alloc] init];
    for(int i = 0; i < self.items.count ;i++){
    BLItem *item = self.items[i];
    if(item.valueInDollars > 50){
        [self.highPrice addObject:self.items[i]];
        
    }else{[self.lowPrice addObject:self.items[i]];}
}
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    UIView *header = self.headerView;
    [self.tableView setTableHeaderView:header];
}
- (IBAction)addNewItem:(id)sender
{
    NSInteger lastRow = [self.tableView numberOfRowsInSection:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    // Insert this new row into the table.
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];
}

- (IBAction)toggleEditingMode:(id)sender
{// If you are currently in editing mode...
    if (self.isEditing) {
        // Change text of button to inform user of state
        [sender setTitle:@"Edit" forState:UIControlStateNormal];
        // Turn off editing mode
        [self setEditing:NO animated:YES];
    } else {
        // Change text of button to inform user of state
        [sender setTitle:@"Done" forState:UIControlStateNormal];
        // Enter editing mode
        [self setEditing:YES animated:YES];
    }
}
-(UIView *)headerView{
    
    if (!_headerView){
        [[NSBundle mainBundle]loadNibNamed:@"HeaderView" owner:self options:nil];
    }
    return _headerView;
}
-(instancetype)init{
    self = [super initWithStyle:UITableViewStylePlain];
    if(self){
        for (int i = 0; i < 5; i++){
            [[BLItemStore sharedStore] createItem];
        }}
        
    
    return self;
    }
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCell"];
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    
    
  
    if(indexPath.section == 0){
        BLItem *item = self.highPrice[indexPath.row];
        UIFont *font = [UIFont fontWithName:@"Arial" size:20];
        cell.textLabel.font =font;
        cell.textLabel.text = [item description];}
    else if(indexPath.section == 1){
    BLItem *itemSection2 = self.lowPrice[indexPath.row];
            UIFont *font = [UIFont fontWithName:@"Arial" size:20];
            cell.textLabel.font =font;
            cell.textLabel.text = [itemSection2 description];}
    
    
   
//    for(int i = 0; i < items.count ;i++){
//        BLItem *item = items[i];
//
//        if(item.valueInDollars > 50){
//            item = items[0][indexPath.row];
//            cell.textLabel.text = [item description];}
//        cell.textLabel.text = [item description];
//    }
   return cell;
    }

-(instancetype)initWithStyle:(UITableViewStyle)style{
    return [self init];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 || indexPath.section == 1){
        return 60;
    }
    return 44;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *label = [[UILabel alloc]init ];
    if(section == 0){
        
        UIFont *font = [UIFont fontWithName:@"Arial" size:20];
        [label setFont:font];
        label.text = @"They cost more than 50$";}
    else if(section == 1){
         UIFont *font = [UIFont fontWithName:@"Arial" size:20];
         [label setFont:font];
         label.text = @"they cost less than 50$";}else{
             label.text =@"No more items";}
    return label;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
  
    NSInteger count = 0;
    for(int i = 0; i < self.items.count ;i++){
        BLItem *item = self.items[i];
    if(item.valueInDollars > 50){
        count++;}}
    
    if(section == 0){
      
        return count;
        
    }if(section == 1){
    return self.items.count - count;}
    
    return 0;}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}



@end
