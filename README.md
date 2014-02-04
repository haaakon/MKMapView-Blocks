MKMapView-Blocks
================
Adds blocks to all MKMapView delegate methods with a simple and easy to use category, no subclassing. Also allows the use of delegate methods if no block is set for a particular method. 

[![Build Status](https://travis-ci.org/haaakon/MKMapView-Blocks.png)](https://travis-ci.org/haaakon/MKMapView-Blocks)



##Example usage

#### mapViewWillStartLoadingMap:
```objective-c
[self.mapView setMapViewWillStartLoadingMapBlock:^(MKMapView *mapView) {
    NSLog(@"will start loading map");
}];
```

#### mapViewDidFailLoadingMap: 
```objective-c
[self.mapView setMapViewDidFailLoadingMapBlock:^(MKMapView *mapView, NSError *error) {
    NSLog(@"failed with error %@",error);
}];
```

#### mapViewDidFinishLoadingMap:
```objective-c
[self.mapView setMapViewDidFinishLoadingMapBlock:^(MKMapView *mapView) {
    NSLog(@"did finish loading map");
}];
```
#### mapViewViewForAnnotationBlock:
```Objective-c
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
```
