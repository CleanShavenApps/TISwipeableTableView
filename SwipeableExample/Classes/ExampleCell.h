//
//  ExampleCell.h
//  SwipeableExample
//
//  Created by Tom Irving on 16/06/2010.
//  Copyright 2010 Tom Irving. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TISwipeableTableView.h"

@class ExampleCell;

@protocol ExampleCellDelegate <TISwipeableTableViewCellDelegate>
- (void)cellBackButtonWasTapped:(ExampleCell *)cell;
@end

@interface ExampleCell : TISwipeableTableViewCell {
	
	id <ExampleCellDelegate> __unsafe_unretained delegate;
	NSString * text;
}

@property (nonatomic, unsafe_unretained) id <ExampleCellDelegate> delegate;
@property (nonatomic, copy) NSString * text;

- (void)drawShadowsWithHeight:(CGFloat)shadowHeight opacity:(CGFloat)opacity InRect:(CGRect)rect forContext:(CGContextRef)context;

@end
