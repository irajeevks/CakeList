//
//  CakeCell.h
//  CakeList
//
//  Created by RAjeev Singh on 20/02/2018.
//  Copyright © 2018 RAjeev Singh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CakeCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *cakeImage;
@property (weak, nonatomic) IBOutlet UILabel *cakeName;
@property (weak, nonatomic) IBOutlet UILabel *cakeDesc;

- (void)setData:(NSDictionary *)dict;

@end
