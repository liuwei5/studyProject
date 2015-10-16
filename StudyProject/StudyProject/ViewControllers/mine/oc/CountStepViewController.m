//
//  CountStepViewController.m
//  StudyProject
//
//  Created by BrotherWei on 15/1/1.
//  Copyright (c) 2015年 paDev. All rights reserved.
//

#import "CountStepViewController.h"
#import <CoreMotion/CoreMotion.h>
#import <HealthKit/HealthKit.h>

@interface CountStepViewController ()

@property (nonatomic , strong) CMPedometer *cmPedometerCounter;

@property (nonatomic , strong) CMStepCounter *cmStepCounter;

@property (nonatomic , strong) NSOperationQueue *cmStepOperationQueue;

@property (nonatomic , strong) HKHealthStore *healthStore;

@end

@implementation CountStepViewController

#pragma mark – Life Cycle //life cycle code，包括dealloc、init等

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.hidesBottomBarWhenPushed = YES;
    [self setupBaseUiPropertiesForView];
    
//    [self useCMStepCounterData];
//    [self useCMPedometerData];
    [self useHealthKitData];
}

- (void)setupBaseUiPropertiesForView
{
    self.title = @"计步";
    
    UIBarButtonItem *btnNavBack = [[UIBarButtonItem alloc] initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(clickNavBackBtn)];
    btnNavBack.tintColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = btnNavBack;
}

- (void)clickNavBackBtn
{
    [self.navigationController popViewControllerAnimated:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark – Override //override code，重写父类的方法


#pragma mark – Delegate //delegate code


#pragma mark – Getter & Setter //属性的Setter 和 Getter方法

- (CMPedometer *)cmPedometerCounter
{
    if(!_cmPedometerCounter)
    {
        _cmPedometerCounter = [[CMPedometer alloc] init];
    }
    return _cmPedometerCounter;
}

- (CMStepCounter *)cmStepCounter
{
    if(!_cmStepCounter)
    {
        _cmStepCounter = [[CMStepCounter alloc] init];
    }
    return _cmStepCounter;
}

- (NSOperationQueue *)cmStepOperationQueue
{
    if(!_cmStepOperationQueue)
    {
        _cmStepOperationQueue = [[NSOperationQueue alloc] init];
    }
    return _cmStepOperationQueue;
}

- (HKHealthStore *)healthStore
{
    if(!_healthStore)
    {
        _healthStore = [[HKHealthStore alloc] init];
    }
    return _healthStore;
}

#pragma mark – Public //公有方法

- (void)useCMStepCounterData
{
    if([CMStepCounter isStepCountingAvailable])
    {
        //获取当前时间
        NSDate *date = [NSDate date];
        
        NSTimeZone *zone = [NSTimeZone systemTimeZone];
        NSInteger interval = [zone secondsFromGMTForDate: date];
        NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
        
        //获取当天零点时间
        NSDateFormatter *df = [[NSDateFormatter alloc] init];
        df.dateFormat  = @"yyyy-MM-dd HH:mm:ss";
        NSMutableString *zeroDateStr = [[NSMutableString alloc] init];
        [zeroDateStr  setString:[df stringFromDate:[NSDate date]]];
        NSRange range = {11,8};
        [zeroDateStr deleteCharactersInRange:range];
        NSString *zeroStr = [NSString stringWithFormat:@"%@00:00:00",zeroDateStr];
        NSDate *zeroDate = [df dateFromString:zeroStr];
        
        [self.cmStepCounter queryStepCountStartingFrom:zeroDate to:localeDate toQueue:self.cmStepOperationQueue withHandler:^(NSInteger numberOfSteps, NSError *error) {
            NSLog(@"========================= current step  :  %ld" , numberOfSteps);
        }];
        
        [self.cmStepCounter startStepCountingUpdatesToQueue:self.cmStepOperationQueue updateOn:1 withHandler:^(NSInteger numberOfSteps, NSDate *timestamp, NSError *error) {
            NSLog(@"========================= changed step  :  %ld" , numberOfSteps);
        }];
    }
}

- (void)useCMPedometerData
{
    //获取当前时间
    NSDate *date = [NSDate date];
    
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate: date];
    NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    
    //获取当天零点时间
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    df.dateFormat  = @"yyyy-MM-dd HH:mm:ss";
    NSMutableString *zeroDateStr = [[NSMutableString alloc] init];
    [zeroDateStr  setString:[df stringFromDate:[NSDate date]]];
    NSRange range = {11,8};
    [zeroDateStr deleteCharactersInRange:range];
    NSString *zeroStr = [NSString stringWithFormat:@"%@00:00:00",zeroDateStr];
    NSDate *zeroDate = [df dateFromString:zeroStr];
    
    
    [self.cmPedometerCounter queryPedometerDataFromDate:zeroDate toDate:localeDate withHandler:^(CMPedometerData *  pedometerData, NSError *error) {
        NSLog(@"usePedometer:%@", pedometerData);
        NSInteger steps = [[pedometerData numberOfSteps] integerValue];
        NSLog(@"total steps:%ld", steps);
        
    }];
}

- (void)useHealthKitData
{
    //获取当前时间
    NSDate *localeDate = [NSDate date];
    //             NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //             NSInteger interval = [zone secondsFromGMTForDate: date];
    //             NSDate *localeDate = [date  dateByAddingTimeInterval: interval];
    NSLog(@"localeDate%@", localeDate);
    
    //获取当天零点时间
    NSCalendar * calendar = [NSCalendar currentCalendar];
    NSDate *endDate = [NSDate date];
    NSDateComponents *comps = [calendar components:(NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond)
                                          fromDate:endDate];
    comps.hour = 0;
    comps.minute = 0;
    comps.second = 0;
    NSTimeZone * timeZone = [NSTimeZone systemTimeZone];
    calendar.timeZone = timeZone;
    
    NSDate *startDate = [calendar dateFromComponents:comps];
    startDate = [NSDate dateWithTimeInterval:-86400 sinceDate:startDate];
    
    
    if ([HKHealthStore isHealthDataAvailable]) {
        
        self.healthStore = [[HKHealthStore alloc] init];
        // Share body mass, height and body mass index etc....
        NSSet *shareObjectTypes = [NSSet setWithObjects:
                                   [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierBodyMass],
                                   [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierHeight],
                                   [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning],
                                   [HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
                                   nil];
        
        // Read date of birth, biological sex and step count etc
        NSSet *readObjectTypes  = [NSSet setWithObjects:
                                   [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierDateOfBirth],
                                   [HKObjectType characteristicTypeForIdentifier:HKCharacteristicTypeIdentifierBiologicalSex],
                                   [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierDistanceWalkingRunning],
                                   [HKSampleType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount],
                                   nil];
        
        HKQuantityType *type = [HKObjectType quantityTypeForIdentifier:HKQuantityTypeIdentifierStepCount];
        void (^completion)(BOOL success, NSError *error) = ^(BOOL success, NSError *error) {
            
            if(!success) {
                return;
            }
            
            NSSortDescriptor *timeSortDescription = [[NSSortDescriptor alloc] initWithKey:HKSampleSortIdentifierEndDate ascending:NO];
            NSPredicate * predicate = [HKQuery predicateForSamplesWithStartDate:startDate endDate:endDate options:HKQueryOptionStrictStartDate];
            
           // NSPredicate *predicate1 = [HKQuery predicateForObjectsWithMetadataKey:HKMetadataKeyWasUserEntered allowedValues:@[true]];
           //HKQuery.predicateForObjectsWithMetadataKey(HKMetadataKeyWasUserEntered, allowedValues: [true])
            
            HKSampleQuery    *query = [[HKSampleQuery alloc] initWithSampleType:type
                                                                      predicate:predicate
                                                                          limit:HKObjectQueryNoLimit
                                                                sortDescriptors:@[timeSortDescription]
                                                                 resultsHandler:^(HKSampleQuery *query, NSArray *result, NSError *error){
                                                                     
                                                                     NSLog(@"RESULT  : =>  %@",result);
                                                                     if(!error && result) {
                                                                         long totalSteps=0;
                                                                         for(HKQuantitySample *quantitySample in result) {
                                                                             // your code here
                                                                    
                                                                             
                                                                             HKQuantity  *quantity=quantitySample.quantity;
                                                                             //HKQuantity *quantity = quantitySample.quantity;
                                                                             NSString *string=[NSString stringWithFormat:@"%@",quantity];
                                                                             NSString *newString1 = [string stringByReplacingOccurrencesOfString:@" count" withString:@""];
                                                                             
                                                                             NSInteger count=[newString1 integerValue];
                                                                             totalSteps=totalSteps+count;
                                                                         }
                                                                         NSLog(@"=====TOTAL: %ld", totalSteps);
                                                                         
                                                                         
                                                                     }
                                                                 }];
            [self.healthStore executeQuery:query];
            
        };
        
        
        // Request access
        [self.healthStore requestAuthorizationToShareTypes:shareObjectTypes
                                                 readTypes:readObjectTypes
                                                completion:completion];
    }

}


#pragma mark – Private //私有方法


#pragma mark – Action //Selector 方法


#pragma mark – Notification //Notification Observer 方法


@end
