//
//  ViewController.h
//  CakeList
//
//  Created by RAjeev Singh on 20/02/2018.
//  Copyright © 2018 RAjeev Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

