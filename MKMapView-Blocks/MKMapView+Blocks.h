//
//  MKMapView+Blocks.h
//  MKMapView-Blocks Example
//
//  Created by Håkon Bogen on 23.10.13.
//  Copyright (c) 2013 Håkon Bogen. All rights reserved.
//
#import <MapKit/MapKit.h>


@interface MKMapView (Blocks)

@property (copy, nonatomic) void (^mapViewRegionWillChangeAnimatedBlock)(MKMapView *mapView, BOOL animated);
@property (copy, nonatomic) void (^mapViewRegionDidChangeAnimatedBlock)(MKMapView *maoView, BOOL animated);

@property (copy, nonatomic) void (^mapViewWillStartLoadingMapBlock)(MKMapView *mapView);
@property (copy, nonatomic) void (^mapViewDidFinishLoadingMapBlock)(MKMapView *mapView);
@property (copy, nonatomic) void (^mapViewDidFailLoadingMapBlock)(MKMapView *mapView, NSError *error);

@property (copy, nonatomic) void (^mapViewWillStartRenderingMapBlock)(MKMapView *mapView);
@property (copy, nonatomic) void (^mapViewDidFinishRenderingMapBlock)(MKMapView *mapView, BOOL fullyRendered);

@property (copy, nonatomic) MKAnnotationView* (^mapViewViewForAnnotationBlock)(MKMapView *mapView, id<MKAnnotation> annotation);

@property (copy, nonatomic) void (^mapvViewDidAddAnnotationViewsBlock)(MKMapView *mapView, NSArray *views);

@property (copy, nonatomic) void (^mapViewAnnotationViewCalloutAccessoryControlTappedBlock)(MKMapView *mapView, UIControl *control);

@property (copy, nonatomic) void (^mapViewDidSelectAnnotationView)(MKMapView *mapView, MKAnnotationView *view);
@property (copy, nonatomic) void (^mapViewDidDeselectAnnotationView)(MKMapView *mapView, MKAnnotationView *view);

@property (copy, nonatomic) void (^mapViewWillStartLocatingUser)(MKMapView *mapView);
@property (copy, nonatomic) void (^mapViewDidStopLocatingUser)(MKMapView *mapView);
@property (copy, nonatomic) void (^mapViewDidUpdateUserLocation)(MKMapView *mapView, MKUserLocation *userLocation);
@property (copy, nonatomic) void (^mapViewDidFailToLocateUserWithError)(MKMapView *mapView, NSError *error);

@property (copy, nonatomic) void (^mapViewAnnotationViewDidChangeDragState)(MKMapView *mapView, MKAnnotationViewDragState newState);


@property (copy, nonatomic) void (^mapViewDidChangeUserTrackingMode)(MKMapView *mapView, MKAnnotationViewDragState newState);

@property (copy, nonatomic) MKOverlayRenderer* (^mapViewRendererForOverlayBlock)(MKMapView *mapView,id<MKOverlay> overlay);
@property (copy, nonatomic) void (^mapViewDidAddOverlayRenderers)(MKMapView *mapView, NSArray *renderers);




- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated;
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated;

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView;
- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView;
- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error;

- (void)mapViewWillStartRenderingMap:(MKMapView *)mapView NS_AVAILABLE(10_9, 7_0);
- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered NS_AVAILABLE(10_9, 7_0);

// mapView:viewForAnnotation: provides the view for each annotation.
// This method may be called for all or some of the added annotations.
// For MapKit provided annotations (eg. MKUserLocation) return nil to use the MapKit provided annotation view.
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation;

// mapView:didAddAnnotationViews: is called after the annotation views have been added and positioned in the map.
// The delegate can implement this method to animate the adding of the annotations views.
// Use the current positions of the annotation views as the destinations of the animation.
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views;

#if TARGET_OS_IPHONE
// mapView:annotationView:calloutAccessoryControlTapped: is called when the user taps on left & right callout accessory UIControls.
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control;
#endif

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0);
- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0);

- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView NS_AVAILABLE(10_9, 4_0);
- (void)mapViewDidStopLocatingUser:(MKMapView *)mapView NS_AVAILABLE(10_9, 4_0);
- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(10_9, 4_0);
- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error NS_AVAILABLE(10_9, 4_0);

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState
   fromOldState:(MKAnnotationViewDragState)oldState NS_AVAILABLE(10_9, 4_0);

#if TARGET_OS_IPHONE
- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated NS_AVAILABLE(NA, 5_0);
#endif

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay NS_AVAILABLE(10_9, 7_0);
- (void)mapView:(MKMapView *)mapView didAddOverlayRenderers:(NSArray *)renderers NS_AVAILABLE(10_9, 7_0);

#if TARGET_OS_IPHONE
// Prefer -mapView:rendererForOverlay:
- (MKOverlayView *)mapView:(MKMapView *)mapView viewForOverlay:(id <MKOverlay>)overlay NS_DEPRECATED_IOS(4_0, 7_0);
// Called after the provided overlay views have been added and positioned in the map.
// Prefer -mapView:didAddOverlayRenderers:
- (void)mapView:(MKMapView *)mapView didAddOverlayViews:(NSArray *)overlayViews NS_DEPRECATED_IOS(4_0, 7_0);
#endif

@end
