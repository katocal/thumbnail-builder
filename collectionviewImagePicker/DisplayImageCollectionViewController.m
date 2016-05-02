//
//  DisplayImageCollectionViewController.m
//  collectionviewImagePicker
//
//  Created by Mostafa Elgamal on 4/30/16.
//  Copyright © 2016 2Go Consulting LLC. All rights reserved.
//

#import "DisplayImageCollectionViewController.h"

#import "collectionviewImagePicker-Swift.h"

@interface DisplayImageCollectionViewController ()

@property (retain) NSMutableArray *selectedIndexes; // a stack of the index of the selected images

@property (copy) NSArray<UIImageView *>* placeholders;
@property (copy) NSArray<NSString *>* placeholderImageNames;

@end

@implementation DisplayImageCollectionViewController

static NSString * const reuseIdentifier = @"itemCell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.selectedIndexes = [NSMutableArray array];
    
    
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
    
    
    // configure collection view
    self.collectionView.allowsMultipleSelection = YES;
    
    // build placeholder image names array
    NSMutableArray* names = @[].mutableCopy;
    for (int i = 1; i < 5; i++) {
        [names addObject:[NSString stringWithFormat:@"%d.png", i]];
    }
    self.placeholderImageNames = names;
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateHeaderDisplay];
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
        
        // get the placeolders so I can update them later
        NSMutableArray* imageViews = @[].mutableCopy;
        for (UIView* thisView in headerView.subviews) {
            if ([thisView isKindOfClass:[UIImageView class]]) {
                [imageViews addObject:thisView];
                
                //                UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(placeHolderTapped:)];
                //                [thisView addGestureRecognizer:tap];
                //
                //                thisView.userInteractionEnabled = YES;
            }
        }
        // TODO: be sure to sort these by x position. THey work for now, but who knows in the future
        self.placeholders = imageViews;
        
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
    
    [self.selectedIndexes insertObject:@(indexPath.row) atIndex:0];
    
    NSLog(@"indexes: %@", self.selectedIndexes);
    
    [self updateHeaderDisplay];
    [self updateplaceholderUI];
    
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [self.selectedIndexes removeObject:@(indexPath.row)];
    
    NSLog(@"indexes: %@", self.selectedIndexes);
    
    [self updateHeaderDisplay];
    [self updateplaceholderUI];
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

- (NSArray*)imagesForPlaceholderAtIndex:(NSUInteger)inIndex {
    
    // pull the first inIndex+1 indexes from selectedIndexes
    NSUInteger length = MIN(inIndex+1, self.selectedIndexes.count);
    
    
    NSMutableArray* outImages = @[].mutableCopy;
    for (int i=0;i<length;i++) {
        NSNumber* thisIndex = [self.selectedIndexes objectAtIndex:i];
        UIImage* thisImage = [self.arrImages objectAtIndex:thisIndex.unsignedIntegerValue];
        [outImages addObject:thisImage];
    }
    
    // pad with however many we need to get up to the necessary size
    while (outImages.count < inIndex+1) {
        [outImages addObject:[NSNull null]];
    }
    
    return outImages;
}

- (UIImage*)imageForPlaceHolderAtIndex:(NSUInteger)inIndex; {
    UIImage* placeholderImage = [UIImage imageNamed:[self.placeholderImageNames objectAtIndex:inIndex]];
    NSArray* images = [self imagesForPlaceholderAtIndex:inIndex];
    UIImage* out = [UIImage compoundImageFrom:images withBackgroundImage:placeholderImage];
    return out;
}

- (void)updateHeaderDisplay; {
    
    // place default images
    NSUInteger thisI = 1;
    for (UIImageView* thisView in self.placeholders) {
        UIImage* image;
        if ((image = [UIImage imageNamed:[self.placeholderImageNames objectAtIndex:(thisI++ - 1)]])) {
            thisView.image = image;
        }
    }
    
    // place images based on the selection above those images
    for (int i=0; i<4;i++) {
        UIImageView* placeHolder = [self.placeholders objectAtIndex:i];
        if (placeHolder) {
            placeHolder.image = [self imageForPlaceHolderAtIndex:i];
        }
    }
}

- (void)updateplaceholderUI; {
    
    int i = 0;
    for (UIView* thisPlaceholder in self.placeholders) {
        [self updatePlaceholder:thisPlaceholder enabled:self.selectedIndexes.count >= i+1];
        i++;
    }
}

- (void)updatePlaceholder:(UIView*)placeholder enabled:(BOOL)enabled; {
    
    NSLog(@"%s %@ : %d", __FUNCTION__, placeholder, enabled);
    
    
    // remove old gesture recognizers
    for (UIGestureRecognizer *thisRecognizer in placeholder.gestureRecognizers) {
        [placeholder removeGestureRecognizer:thisRecognizer];
    }
    
    // update gesture recognizers
    if (enabled) {
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(placeHolderTapped:)];
        [placeholder addGestureRecognizer:tap];
        placeholder.userInteractionEnabled = YES;
    }
    else {
        placeholder.userInteractionEnabled = NO;
    }
    
    // update UI
    if (enabled) {
        placeholder.alpha = 1;
    }
    else {
        placeholder.alpha = 0.6;
    }
}

- (IBAction)placeHolderTapped:(UITapGestureRecognizer*)recognizer {
    
    NSUInteger placeholderIndex = [self.placeholders indexOfObject:(UIImageView*)recognizer.view];
    if (NSNotFound == placeholderIndex) {
        return; // fail early
    }
    
    NSArray* images = [self imagesForPlaceholderAtIndex:placeholderIndex];
    UIImage* firstImage = (UIImage*)images.firstObject;
    UIImage* image = [UIImage compoundImageFrom:images constrainedToSize:firstImage.size withBackgroundColor:[UIColor blackColor]];
    
#if DEBUG
    [self saveImage:image];
#endif
    
    [self.delegate displayImageCollectionViewController:self didProduceCompositeImage:image];
}

- (void)saveImage:(UIImage*)inImage; {
    
    NSString* name = [[[NSDate date] descriptionWithLocale:nil] stringByAppendingPathExtension:@"jpg"];
    
    NSString  *jpgPath = [[NSHomeDirectory() stringByAppendingPathComponent:@"Documents"] stringByAppendingPathComponent:name];
    if (![UIImageJPEGRepresentation(inImage, 1.0) writeToFile:jpgPath atomically:YES]) {
        NSLog(@"error writing file %@", jpgPath);
    }
    else {
        NSLog(@"wrote file to %@", jpgPath);
    }
}

@end
