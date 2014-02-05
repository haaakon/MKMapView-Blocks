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

#### mapView:DidFailLoadingMap: 
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
#### mapView:ViewForAnnotationBlock:
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

## Bug & Feature Requests
Not yet done testing on a mac app.
Pull-requests for bug-fixes and features are more than welcome!

## License:
MIT License

Copyright (c) 2014 Håkon Bogen

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
