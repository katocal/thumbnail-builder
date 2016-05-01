//
//  DisplayImageCollectionViewController.m
//  collectionviewImagePicker
//
//  Created by Mostafa Elgamal on 4/30/16.
//  Copyright © 2016 2Go Consulting LLC. All rights reserved.
//

#import "DisplayImageCollectionViewController.h"

@interface DisplayImageCollectionViewController ()


@end

@implementation DisplayImageCollectionViewController

static NSString * const reuseIdentifier = @"itemCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    self.arrImages = [NSMutableArray new];
    [self.arrImages addObject:[UIImage imageNamed:@"images/a.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/b.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/c.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/d.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/e.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/f.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/g.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/h.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/i.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/j.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/k.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/l.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/m.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/n.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/o.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/p.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/q.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/r.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/s.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/t.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/u.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/v.jpg"]];
    [self.arrImages addObject:[UIImage imageNamed:@"images/w.jpg"]];

    
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    // Do any additional setup after loading the view.
}




- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader) {
        UICollectionReusableView *headerView =  [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"headerView" forIndexPath:indexPath ];
//        RecipeCollectionHeaderView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderView" forIndexPath:indexPath];
//        NSString *title = [[NSString alloc]initWithFormat:@"Recipe Group #%i", indexPath.section + 1];
//        headerView.title.text = title;
//        UIImage *headerImage = [UIImage imageNamed:@"header_banner.png"];
//        headerView.backgroundImage.image = headerImage;
        
        reusableview = headerView;
        
    }else{
        return nil;
    }
    return reusableview;
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
    
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 18;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIImageView *imageView  = (UIImageView  *)[cell.contentView viewWithTag:100];
    imageView.image = self.arrImages[indexPath.row];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSLog(@"selected item at indexapth: %@", indexPath);
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
