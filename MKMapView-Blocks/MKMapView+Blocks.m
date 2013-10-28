//
//  MKMapView+Blocks.m
//  MKMapView-Blocks Example
//
//  Created by Håkon Bogen on 23.10.13.
//  Copyright (c) 2013 Håkon Bogen. All rights reserved.
//

#import "MKMapView+Blocks.h"

@implementation MKMapView (Blocks)


- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    
}

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView
{
    
}
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    
}
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error
{
    
}

- (void)mapViewWillStartRenderingMap:(MKMapView *)mapView NS_AVAILABLE(10_9, 7_0)
{
    
}
- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered NS_AVAILABLE(10_9, 7_0)
{
    
}

// mapView:viewForAnnotation: provides the view for each annotation.
// This method may be called for all or some of the added annotations.
// For MapKit provided annotations (eg. MKUserLocation) return nil to use the MapKit provided annotation view.
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    return nil;
}

// mapView:didAddAnnotationViews: is called after the annotation views have been added and positioned in the map.
// The delegate can implement this method to animate the adding of the annotations views.
// Use the current positions of the annotation views as the destinations of the animation.
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    
}

#if TARGET_OS_IPHONE
// mapView:annotationView:calloutAccessoryControlTapped: is called when the user taps on left & right callout accessory UIControls.
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    
}
#endif

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0)
{
    
}
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0)
{
    
}

- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView NS_AVAILABLE(10_9, 4_0)
{
    
}
- (void)mapViewDidStopLocatingUser:(MKMapView *)mapView NS_AVAILABLE(10_9, 4_0)
{
    
}
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(10_9, 4_0)
{
    
}
- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error NS_AVAILABLE(10_9, 4_0)
{
    
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState
   fromOldState:(MKAnnotationViewDragState)oldState NS_AVAILABLE(10_9, 4_0)
{
    
}

#if TARGET_OS_IPHONE
- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated NS_AVAILABLE(NA, 5_0)
{
    
}
#endif

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay NS_AVAILABLE(10_9, 7_0)
{
    return nil;
}

- (void)mapView:(MKMapView *)mapView didAddOverlayRenderers:(NSArray *)renderers NS_AVAILABLE(10_9, 7_0)
{
    
}

-


@end
