//
//  SSBGLocationDelegate.h
//  SSBGLocation
//
//  Created by Shebin Koshy on 13/02/20.
//  Copyright © 2020 Shebin Koshy. All rights reserved.
//

#import <Foundation/Foundation.h>


NS_ASSUME_NONNULL_BEGIN


@class CLLocation, SSBGLocationManager;

@protocol SSBGLocationDelegate <NSObject>

- (void)ssBGLocationManager:(SSBGLocationManager*)locationManager didUpdateLocations:(NSArray*)locations;

@end




@interface SSBGLocationManager : NSObject

@property(nonatomic, weak) id <SSBGLocationDelegate> delegate;

- (NSArray*)allLocations;

@end

NS_ASSUME_NONNULL_END
