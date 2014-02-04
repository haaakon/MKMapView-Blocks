//
//  AAAMapAnnotation.h
//  MKMapView-Blocks Example
//
//  Created by Håkon Bogen on 04.02.14.
//  Copyright (c) 2014 Håkon Bogen. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <MapKit/MapKit.h>
@interface AAAMapAnnotation : NSObject<MKAnnotation>
@property (assign, nonatomic) CLLocationCoordinate2D coordinate;
@end
