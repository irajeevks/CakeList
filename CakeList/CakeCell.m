//
//  CakeCell.m
//  CakeList
//
//  Created by RAjeev Singh on 20/02/2018.
//  Copyright © 2018 RAjeev Singh. All rights reserved.
//

#import "CakeCell.h"

@implementation CakeCell
int values = 0;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor=[UIColor whiteColor];
    }
    return self;
}

- (void)setData:(NSDictionary *)dict
{
    self.cakeName.text = [dict valueForKey:@"title"];
    self.cakeDesc.text = [dict valueForKey:@"desc"];
    
  //  Anachronous doenloading the image here.
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSURL *aURL = [NSURL URLWithString:[dict valueForKey:@"image"]];
        UIImage * image = [UIImage imageWithData:[NSData dataWithContentsOfURL:aURL]];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.cakeImage.image = image;
        });
    });
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
