//
//  MMTableViewRefreshDemoController.m
//  MaterialDesignSpinner
//
//  Created by Mike Maxwell on 7/22/17.
//  Copyright © 2017 Mike Maxwell. All rights reserved.
//

#import "MMTableViewRefreshDemoController.h"
#import "UIRefreshControl+MaterialDesignSpinner.h"
#import "MMMaterialDesignSpinner.h"

@interface MMTableViewRefreshDemoController ()
@property (strong, nonatomic) IBOutlet UIView *refreshControlView;
@property (weak, nonatomic) IBOutlet MMMaterialDesignSpinner *refreshControlSpinner;
@end

@implementation MMTableViewRefreshDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.refreshControlView.frame = self.refreshControl.bounds;
    [self.refreshControl addSubview:self.refreshControlView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DemoCell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [NSString stringWithFormat:@"Demo Cell #%ld", (long)indexPath.row];
    
    return cell;
}

- (IBAction)refresh:(id)sender {
    [self.refreshControlSpinner setAnimating:YES];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(4.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self.refreshControlSpinner setAnimating:NO];
        [self.refreshControl endRefreshing];
    });
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat yOffset = scrollView.contentOffset.y + scrollView.contentInset.top;
    if (yOffset < 0 && !self.refreshControlSpinner.isAnimating) {
        float percent = -yOffset / (2.0*self.refreshControl.bounds.size.height);
        self.refreshControlSpinner.percentComplete = percent;
    }
}

@end
