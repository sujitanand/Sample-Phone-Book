//
//  CustomCell.m
//  Sample
//
//  Created by Sujit Anand on 1/24/14.
//  Copyright (c) 2014 Sujit Anand. All rights reserved.
//

#import "CustomCell.h"

@implementation CustomCell
@synthesize nameLabel,locationLabel,phoneLabel;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 7, 165, 30)];
        nameLabel.font = [UIFont systemFontOfSize:20.0];
        nameLabel.backgroundColor = [UIColor clearColor];
        nameLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:nameLabel];
        
        locationLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 38, 165, 30)];
        locationLabel.font = [UIFont boldSystemFontOfSize:18];
        locationLabel.textColor = [UIColor blackColor];
        [self.contentView addSubview:locationLabel];
        
        phoneLabel = [[UILabel alloc]initWithFrame:CGRectMake(175, 7, 120, 30)];
        phoneLabel.font = [UIFont systemFontOfSize:16];
        phoneLabel.textColor = [UIColor blueColor];
        [self.contentView addSubview:phoneLabel];

    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
