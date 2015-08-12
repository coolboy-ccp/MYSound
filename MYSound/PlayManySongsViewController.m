//
//  PlayManySongsViewController.m
//  MYSound
//
//  Created by liqunfei on 15/7/24.
//  Copyright (c) 2015年 QHPay. All rights reserved.
//

#import "PlayManySongsViewController.h"
#import "PlayMultiMusics.h"
@interface PlayManySongsViewController ()
@property (strong,nonatomic) NSMutableArray *songsName;
@property (assign,nonatomic) int currentIndex;
@end

@implementation PlayManySongsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (NSMutableArray *)songsName{
    if (!_songsName) {
        _songsName = [@[@"love.mp3",@"love you.mp3"]mutableCopy];
    }
    return _songsName;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)startBTN:(UIButton *)sender {
    [PlayMultiMusics playMusic:self.songsName[self.currentIndex]];
}

- (IBAction)pauseBTN:(UIButton *)sender {
    [PlayMultiMusics pauseMusic:self.songsName[self.currentIndex]];
}

- (IBAction)stopBTN:(UIButton *)sender {
    [PlayMultiMusics stopMusic:self.songsName[self.currentIndex]];
}

- (IBAction)nextBTN:(UIButton *)sender {
    [self stopBTN:nil];
    self.currentIndex ++;
    self.currentIndex = self.currentIndex >= self.songsName.count?0:self.currentIndex;
    [self startBTN:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
