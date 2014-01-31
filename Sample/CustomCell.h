//
//  CustomCell.h
//  Sample
//
//  Created by Sujit Anand on 1/24/14.
//  Copyright (c) 2014 Sujit Anand. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCell : UITableViewCell{
    UILabel *nameLabel;
    UILabel *locationLabel;
    UILabel *phoneLabel;
}
@property (nonatomic,retain) UILabel *nameLabel;
@property (nonatomic,retain) UILabel *locationLabel;
@property (nonatomic,retain) UILabel *phoneLabel;

@end
