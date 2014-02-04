//
//  AAAViewController.m
//  MKMapView-Blocks Example
//
//  Created by Håkon Bogen on 23.10.13.
//  Copyright (c) 2013 Håkon Bogen. All rights reserved.
//

#import "AAAViewController.h"
#import "AAAMapAnnotation.h"

@interface AAAViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@end

@implementation AAAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
    [self.mapView setShowsUserLocation:YES];
    [self.mapView setMapViewDidFinishLoadingMapBlock:^(MKMapView *mapView) {
        NSLog(@"did finish loading map");
    }];
    
    [self.mapView setMapViewWillStartLoadingMapBlock:^(MKMapView *mapView) {
        NSLog(@"will start loading map");
        
    }];
    
    [self.mapView setMapViewDidFailLoadingMapBlock:^(MKMapView *mapView, NSError *error) {
        NSLog(@"failed with error %@",error);
    }];
    
    [self.mapView setMapViewDidUpdateUserLocationBlock:^(MKMapView *mapView, MKUserLocation *userLocation) {
        NSLog(@"did update user location");
    }];
    
    [self.mapView setMapViewDidFinishRenderingMapBlock:^(MKMapView *mapView, BOOL fullyRendered) {
        
    }];

    [self.mapView setMapViewViewForAnnotationBlock:^MKAnnotationView *(MKMapView *mapView, id<MKAnnotation> annotation) {
          if ([annotation isKindOfClass:[MKUserLocation class]]) {
              return nil;
          }
        MKPinAnnotationView *annotationView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"mapAnnotation"];
        if (annotationView == nil) {
            annotationView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"mapAnnotation"];
        }
        annotationView.pinColor = MKPinAnnotationColorGreen;
        return annotationView;
    }];
    
    NSMutableArray *mutableAnnotations = [NSMutableArray array];
    for (NSInteger i = 0; i < 30; i++) {
        AAAMapAnnotation *annotation = [[AAAMapAnnotation alloc ] init];
        CLLocationDegrees longitude = arc4random() % 80;
        CLLocationDegrees latitude =  arc4random() % 80;
        CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake( longitude ,  latitude);
        annotation.coordinate = coordinate;
        [mutableAnnotations addObject:annotation];
    }
    
    [self.mapView addAnnotations:mutableAnnotations];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
