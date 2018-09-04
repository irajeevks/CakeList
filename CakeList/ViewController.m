//
//  ViewController.m
//  CakeList
//
//  Created by RAjeev Singh on 20/02/2018.
//  Copyright © 2018 RAjeev Singh. All rights reserved.
//

#import "ViewController.h"
#import "CakeCell.h"

@interface ViewController ()
@property (strong, nonatomic) NSArray *objects;
@end

static NSString *cellIdentifier = @"cellIdentifier";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     self.title = @"CakeList"; // set the title here
    
    // initialized the table cell here
    [self.tableView registerNib:[UINib nibWithNibName:@"CakeCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self getData];// calling the API for getting the Json data
}

- (void)getData{
    NSURL *url = [NSURL URLWithString:@"https://gist.githubusercontent.com/hart88/198f29ec5114a3ec3460/raw/8dd19a88f9b8d24c23d9960f3300d0c917a4f07c/cake.json"];
    NSData *data = [NSData dataWithContentsOfURL:url];
    NSError *jsonError;
    id responseData = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions
                       error:&jsonError];
    if (!jsonError){
        self.objects = responseData;
        [self.tableView reloadData];
    } else {
    }
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return  self.objects.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 65;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CakeCell *cell = (CakeCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    NSDictionary *dict=[self.objects objectAtIndex:(indexPath.row)];
    [cell setData:dict];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
