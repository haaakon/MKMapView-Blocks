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
@property (copy, nonatomic) void (^mapViewDidAddAnnotationViewsBlock)(MKMapView *mapView, NSArray *views);
@property (copy, nonatomic) void (^mapViewAnnotationViewCalloutAccessoryControlTappedBlock)(MKMapView *mapView, MKAnnotationView *view , UIControl *control);
@property (copy, nonatomic) void (^mapViewDidSelectAnnotationViewBlock)(MKMapView *mapView, MKAnnotationView *view);
@property (copy, nonatomic) void (^mapViewDidDeselectAnnotationViewBlock)(MKMapView *mapView, MKAnnotationView *view);
@property (copy, nonatomic) void (^mapViewWillStartLocatingUserBlock)(MKMapView *mapView);
@property (copy, nonatomic) void (^mapViewDidStopLocatingUserBlock)(MKMapView *mapView);
@property (copy, nonatomic) void (^mapViewDidUpdateUserLocationBlock)(MKMapView *mapView, MKUserLocation *userLocation);
@property (copy, nonatomic) void (^mapViewDidFailToLocateUserWithErrorBlock)(MKMapView *mapView, NSError *error);
@property (copy, nonatomic) void (^mapViewAnnotationViewDidChangeDragStateBlock)(MKMapView *mapView,MKAnnotationView *view, MKAnnotationViewDragState newState, MKAnnotationViewDragState oldState);
@property (copy, nonatomic) void (^mapViewDidChangeUserTrackingModeBlock)(MKMapView *mapView, MKUserTrackingMode mode, BOOL animated);
@property (copy, nonatomic) MKOverlayRenderer* (^mapViewRendererForOverlayBlock)(MKMapView *mapView,id<MKOverlay> overlay);
@property (copy, nonatomic) void (^mapViewDidAddOverlayRenderersBlock)(MKMapView *mapView, NSArray *renderers);

// For users convenience so blocks will get auto completed by xcode
- (void)setMapViewRegionWillChangeAnimatedBlock:(void (^)(MKMapView *mapView, BOOL animated))mapViewRegionWillChangeAnimatedBlock;
- (void)setMapViewRegionDidChangeAnimatedBlock:(void (^)(MKMapView *mapView, BOOL animated))mapViewRegionDidChangeAnimatedBlock;
- (void)setMapViewWillStartLoadingMapBlock:(void (^)(MKMapView *mapView))mapViewWillStartLoadingMapBlock;
- (void)setMapViewDidFinishLoadingMapBlock:(void (^)(MKMapView *mapView))mapViewDidFinishLoadingMapBlock;
- (void)setMapViewDidFailLoadingMapBlock:(void (^)(MKMapView *mapView, NSError *error))mapViewDidFailLoadingMapBlock;
- (void)setMapViewWillStartRenderingMapBlock:(void (^)(MKMapView *mapView))mapViewWillStartRenderingMapBlock;
- (void)setMapViewDidFinishRenderingMapBlock:(void (^)(MKMapView *mapView, BOOL fullyRendered))mapViewDidFinishRenderingMapBlock;
- (void)setMapViewViewForAnnotationBlock:(MKAnnotationView *(^)(MKMapView *mapView, id<MKAnnotation> annotation))mapViewViewForAnnotationBlock;
- (void)setMapViewDidAddAnnotationViewsBlock:(void (^)(MKMapView *mapView, NSArray *views))mapViewDidAddAnnotationViewsBlock;
- (void)setMapViewAnnotationViewCalloutAccessoryControlTappedBlock:(void (^)(MKMapView *mapView, MKAnnotationView *view, UIControl *control))mapViewAnnotationViewCalloutAccessoryControlTappedBlock;
- (void)setMapViewDidSelectAnnotationViewBlock:(void (^)(MKMapView *mapView, MKAnnotationView *view))mapViewDidSelectAnnotationViewBlock;
- (void)setMapViewDidDeselectAnnotationViewBlock:(void (^)(MKMapView *mapView, MKAnnotationView *view))mapViewDidDeselectAnnotationViewBlock;
- (void)setMapViewWillStartLocatingUserBlock:(void (^)(MKMapView *mapView))mapViewWillStartLocatingUserBlock;
- (void)setMapViewDidStopLocatingUserBlock:(void (^)(MKMapView *mapView))mapViewDidStopLocatingUserBlock;
- (void)setMapViewDidUpdateUserLocationBlock:(void (^)(MKMapView *mapView, MKUserLocation *userLocation))mapViewDidUpdateUserLocationBlock;
- (void)setMapViewDidFailToLocateUserWithErrorBlock:(void (^)(MKMapView *mapView, NSError *error))mapViewDidFailToLocateUserWithErrorBlock;
- (void)setMapViewAnnotationViewDidChangeDragStateBlock:(void (^)(MKMapView *mapView, MKAnnotationView *view, MKAnnotationViewDragState newState, MKAnnotationViewDragState oldState))mapViewAnnotationViewDidChangeDragStateBlock;
- (void)setMapViewDidChangeUserTrackingModeBlock:(void (^)(MKMapView *mapView, MKUserTrackingMode mode, BOOL animated))mapViewDidChangeUserTrackingModeBlock;
-(void)setMapViewRendererForOverlayBlock:(MKOverlayRenderer *(^)(MKMapView *mapView, id<MKOverlay> overlay))mapViewRendererForOverlayBlock;
-(void)setMapViewDidAddOverlayRenderersBlock:(void (^)(MKMapView *mapView, NSArray *renderers))mapViewDidAddOverlayRenderersBlock;

@end
