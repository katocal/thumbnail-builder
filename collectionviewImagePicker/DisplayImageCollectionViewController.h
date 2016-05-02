//
//  DisplayImageCollectionViewController.h
//  collectionviewImagePicker
//
//  Created by Mostafa Elgamal on 4/30/16.
//  Copyright © 2016 2Go Consulting LLC. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DisplayImageCollectionViewControllerDelegate;


@interface DisplayImageCollectionViewController : UICollectionViewController

@property (weak) id<DisplayImageCollectionViewControllerDelegate> delegate;

@property (nonatomic, retain) NSMutableArray * arrImages;

@end


@protocol DisplayImageCollectionViewControllerDelegate

- (void)displayImageCollectionViewController:(DisplayImageCollectionViewController*)controller didProduceCompositeImage:(UIImage*)image;

@end