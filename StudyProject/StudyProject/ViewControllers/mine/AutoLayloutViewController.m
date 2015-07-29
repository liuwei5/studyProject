//
//  AutoLayloutViewController.m
//  StudyProject
//
//  Created by BrotherWei on 15/3/3.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "AutoLayloutViewController.h"

@interface AutoLayloutViewController ()

@end

@implementation AutoLayloutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupBaseUiPropertiesForView];
    [self setupBaseDataPropertiesForView];
}

- (void)setupBaseUiPropertiesForView
{
    self.title = @"自动布局";
    
    UIBarButtonItem *btnNavBack = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickNavBackBtn)];
    btnNavBack.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = btnNavBack;
}

- (void)setupBaseDataPropertiesForView
{
    locManager = [[CLLocationManager alloc] init];
    locManager.delegate = self;
    locManager.desiredAccuracy = kCLLocationAccuracyBest;
    [locManager startUpdatingLocation];
}

- (void)clickNavBackBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)startUpdateLocation:(id)sender
{
    [locManager startUpdatingLocation];
}

- (IBAction)stopUpdateLocation:(id)sender
{
    [locManager stopUpdatingLocation];
    
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"弹框" message:@"消息" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    
    
}

#pragma mark CLLocationManagerDelegate
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if(status == kCLAuthorizationStatusNotDetermined)
    {
         if([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
         {
             if([locManager respondsToSelector:@selector(requestAlwaysAuthorization)])
             {
                 [locManager requestAlwaysAuthorization];
             }
         }
    }
    else
    {
     
    }
    NSLog(@"didChangeAuthorizationStatus-----");
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    [locManager stopUpdatingLocation];
    NSLog(@"didUpdateToLocation: %@" , newLocation);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    [locManager stopUpdatingLocation];
    NSLog(@"Locations: %@" , locations);
    CLLocation *location = [locations objectAtIndex:0];
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        
    }];
}

- (void)locationManager:(CLLocationManager *)manager didStartMonitoringForRegion:(CLRegion *)region
{
    NSLog(@"didStartMonitoringForRegion-----");
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError----%@",error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
