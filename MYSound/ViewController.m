//
//  ViewController.m
//  MYSound
//
//  Created by liqunfei on 15/7/24.
//  Copyright (c) 2015年 QHPay. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()
{
    AVAudioPlayer *myPlayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (BOOL)preAudio{
    NSError *error;
    NSString *path = [[NSBundle mainBundle] pathForResource:@"haha" ofType:@"mp3"];
    myPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:&error];
    if (error) {
        [NSException raise:@"开启失败" format:@"%@",[error localizedDescription]];
        return NO;
    }
    for (int i = 9; i >= 0; i--) {
        myPlayer.volume = i/10.0f;
        [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:.1f]];
        [myPlayer pause];
    }
    float a = [[[NSUserDefaults standardUserDefaults] objectForKey:@"Interruption"] floatValue];
    myPlayer.currentTime = a?a:0.f;
    [myPlayer prepareToPlay];
    [myPlayer setNumberOfLoops:1];
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (IBAction)playMusicBTN:(UIButton *)sender {
    [self preAudio];
    [myPlayer play];
    if (!myPlayer.playing) {
        [[NSUserDefaults standardUserDefaults] setFloat:[myPlayer currentTime] forKey:@"Interruption"];
        [[NSUserDefaults standardUserDefaults]synchronize];
    }
}

- (IBAction)disPlayNoiceBTN:(UIButton *)sender {
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    AudioServicesPlayAlertSound(kTimePitchParam_Rate);
   
}

@end
