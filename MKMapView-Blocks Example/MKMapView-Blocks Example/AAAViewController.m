//
//  AAAViewController.m
//  MKMapView-Blocks Example
//
//  Created by Håkon Bogen on 23.10.13.
//  Copyright (c) 2013 Håkon Bogen. All rights reserved.
//

#import "AAAViewController.h"

@interface AAAViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation AAAViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.mapView.delegate = self;
    [self.mapView setMapViewDidFinishLoadingMapBlock:^(MKMapView *mapView) {
        NSLog(@"did finish loading map");
    }];
    [self.mapView setMapViewWillStartLoadingMapBlock:^(MKMapView *mapView) {
        NSLog(@"will start loading map");
        
    }];
    
    [self.mapView setMapViewDidFailLoadingMapBlock:^(MKMapView *mapView, NSError *error) {
        NSLog(@"failed with error %@",error);
    }];
	// Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
