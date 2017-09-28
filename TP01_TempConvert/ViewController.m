//
//  ViewController.m
//  TP01_TempConvert
//
//  Created by user on 9/27/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *segOrgTempType;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segConvTempType;
@property (weak, nonatomic) IBOutlet UILabel *lblOrgTemp;
@property (weak, nonatomic) IBOutlet UILabel *lblConvTemp;
@property (weak, nonatomic) IBOutlet UISlider *sldrTemp;
@property (weak, nonatomic) IBOutlet UILabel *lblFreezing;
@property (weak, nonatomic) IBOutlet UILabel *lblBoiling;
-(void)calcTemps;
-(void)showFreezeBoil;
-(void)checkConvTempType;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self checkConvTempType];
    [self showFreezeBoil];
    [self calcTemps];
    // Do any additional setup after loading the view, typically from a nib.
    }
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sldMove:(id)sender {
    [self calcTemps];
    [self showFreezeBoil];
}
- (IBAction)segSelOrg:(id)sender {
    [self checkConvTempType];
    [self calcTemps];
    [self showFreezeBoil];}
- (IBAction)segSelConv:(id)sender {
    [self calcTemps];
    [self showFreezeBoil];
}







-(void)checkConvTempType
{
    for (int t=0;t<3;t++)
    {
        if (_segOrgTempType.selectedSegmentIndex == t)
        {
            [_segConvTempType setEnabled:NO forSegmentAtIndex:t];
            _lblConvTemp.text = @"Select Conv";
        }
        else
        {
            [_segConvTempType setEnabled:YES forSegmentAtIndex:t];
        }
        
}
}

-(void)showFreezeBoil
{
    if (_sldrTemp.value==0)
    {
        [_lblFreezing setHidden:NO];
    }
    else
    {
        [_lblFreezing setHidden:YES];
    }
    if (_sldrTemp.value==100)
    {
        [_lblBoiling setHidden:NO];
    }
    else{
        [_lblBoiling setHidden:YES];
    }
}

- (void)calcTemps{
    double sel = _sldrTemp.value;
    double fah = (sel*9/5)+32;
    double cel = sel;
    double kel = sel + 273.15;
    if(_segOrgTempType.selectedSegmentIndex == 0)
    {
        _lblOrgTemp.text = [NSString stringWithFormat:@"%.1f", fah];
    }
    else if (_segOrgTempType.selectedSegmentIndex == 1)
    {
        _lblOrgTemp.text = [NSString stringWithFormat:@"%.1f", cel];
    }
    else if (_segOrgTempType.selectedSegmentIndex == 2)
    {
        _lblOrgTemp.text = [NSString stringWithFormat:@"%.1f", kel];
    }
    if(_segConvTempType.selectedSegmentIndex == 0)
    {
        _lblConvTemp.text = [NSString stringWithFormat:@"%.1f", fah];
    }
    else if (_segConvTempType.selectedSegmentIndex == 1)
    {
        _lblConvTemp.text = [NSString stringWithFormat:@"%.1f", cel];
    }
    else if (_segConvTempType.selectedSegmentIndex == 2)
    {
        _lblConvTemp.text = [NSString stringWithFormat:@"%.1f", kel];
    }

}


@end
