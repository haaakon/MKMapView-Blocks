//
//  MKMapView+Blocks.m
//  MKMapView-Blocks Example
//
//  Created by Håkon Bogen on 23.10.13.
//  Copyright (c) 2013 Håkon Bogen. All rights reserved.
//

#import "MKMapView+Blocks.h"
#import <objc/runtime.h>

typedef void (^MKMapViewVoidBlock) (MKMapView *mapView);
typedef void (^MKMapViewVoidAnimatedBlock) (MKMapView *mapView, BOOL animated);
typedef void (^MKMapViewVoidFullyRenderedBlock) (MKMapView *mapView, BOOL fullyRendered);
typedef void (^MKMapViewVoidErrorBlock) (MKMapView *mapView, NSError *error);
typedef void (^MKMapViewVoidArrayBlock) (MKMapView *mapView, NSArray *array);

typedef MKAnnotationView* (^MKMapViewAnnotationViewAnnotationBlock) (MKMapView *mapView, id<MKAnnotation> annotation);

typedef void (^MKMapViewVoidAnnotationViewUIControlBlock)(MKMapView *mapView, MKAnnotationView *view, UIControl *control);
typedef void (^MKMapViewVoidAnnotationViewBlock)(MKMapView *mapView, MKAnnotationView *view);
typedef void (^MKMapViewVoidUserLocationBock)(MKMapView *mapView, MKUserLocation *userLocation);
typedef void (^MKMapViewVoidAnnotationViewNewDragStateOldDragStateBlock)(MKMapView *mapView, MKAnnotationView *view, MKAnnotationViewDragState newState, MKAnnotationViewDragState oldState);
typedef void (^MKMapViewVoidUserTrackingModeAnimatedBlock)(MKMapView *mapView, MKUserTrackingMode mode, BOOL animated);

typedef MKOverlayRenderer* (^MKMapViewOverLayRendererOverlayBlock)(MKMapView *mapView, id<MKOverlay> overlay);

@implementation MKMapView (Blocks)

static const void *MKMapViewDelegateKey                           = &MKMapViewDelegateKey;
static const void *MKMapViewRegionWillChangeAnimatedKey                          = &MKMapViewRegionWillChangeAnimatedKey;
static const void *MKMapViewRegionDidChangeAnimatedKey                         = &MKMapViewRegionDidChangeAnimatedKey;
static const void *MKMapViewWillStartLoadingMapKey                           = &MKMapViewWillStartLoadingMapKey;
static const void *MKMapViewDidFinishLoadingMapKey                           = &MKMapViewDidFinishLoadingMapKey;
static const void *MKMapViewDidFailLoadingMapKey                           = &MKMapViewDidFailLoadingMapKey;
static const void *MKMapViewWillStartRenderingMapKey                           = &MKMapViewWillStartRenderingMapKey;
static const void *MKMapViewDidFinishRenderingMapBlock                           = &MKMapViewDidFinishRenderingMapBlock;
static const void *MKMapViewViewForAnnotationKey                           = &MKMapViewViewForAnnotationKey;
static const void *MKMapViewDidAddAnnotationViewsKey                           = &MKMapViewDidAddAnnotationViewsKey;
static const void *MKMapViewAnnotationViewCalloutAccessoryControlTappedKey                           = &MKMapViewAnnotationViewCalloutAccessoryControlTappedKey;
static const void *MKMapViewDidSelectAnnotationViewKey                           = &MKMapViewDidSelectAnnotationViewKey;
static const void *MKMapViewDidDeselectAnnotationViewKey                           = &MKMapViewDidDeselectAnnotationViewKey;
static const void *MKMapViewWillStartLocatingUserKey                           = &MKMapViewWillStartLocatingUserKey;
static const void *MKMapViewDidStopLocatingUserKey                           = &MKMapViewDidStopLocatingUserKey;
static const void *MKMapViewDidUpdateUserLocationKey                           = &MKMapViewDidUpdateUserLocationKey;
static const void *MKMapViewDidFailToLocateUserWithErrorKey                           = &MKMapViewDidFailToLocateUserWithErrorKey;
static const void *MKMapViewAnnotationViewDidChangeDragStateKey                           = &MKMapViewAnnotationViewDidChangeDragStateKey;
static const void *MKMapViewDidChangeUserTrackingModeKey                           = &MKMapViewDidChangeUserTrackingModeKey;
static const void *MKMapViewRendererForOverlayKey                           = &MKMapViewRendererForOverlayKey;
static const void *MKMapViewDidAddOverlayRenderersKey                           = &MKMapViewDidAddOverlayRenderersKey;

- (void)mapView:(MKMapView *)mapView regionWillChangeAnimated:(BOOL)animated
{
    MKMapViewVoidAnimatedBlock block = mapView.mapViewRegionWillChangeAnimatedBlock;

    if (block) {
        block(mapView, animated);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:regionWillChangeAnimated:)]) {
        return [delegate mapView:mapView regionWillChangeAnimated:animated];
    }
}

- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    MKMapViewVoidAnimatedBlock block = mapView.mapViewRegionDidChangeAnimatedBlock;
    
    if (block) {
        block(mapView, animated);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:regionDidChangeAnimated:)]) {
        return [delegate mapView:mapView regionDidChangeAnimated:animated];
    }
}

- (void)mapViewWillStartLoadingMap:(MKMapView *)mapView
{
    MKMapViewVoidBlock block = mapView.mapViewWillStartLoadingMapBlock;
    
    if (block) {
        block(mapView);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapViewWillStartLoadingMap:)]) {
        return [delegate mapViewWillStartLoadingMap:mapView];
    }
}

- (void)mapViewDidFinishLoadingMap:(MKMapView *)mapView
{
    MKMapViewVoidBlock block = mapView.mapViewDidFinishLoadingMapBlock;
    
    if (block) {
        block(mapView);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapViewDidFinishLoadingMap:)]) {
        [delegate mapViewDidFinishLoadingMap:mapView];
    }
}

- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error
{
    MKMapViewVoidErrorBlock block = mapView.mapViewDidFailLoadingMapBlock;
    
    if (block) {
        block(mapView, error);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapViewDidFailLoadingMap:withError:)]) {
        [delegate mapViewDidFailLoadingMap:mapView withError:error];
    }
}

- (void)mapViewWillStartRenderingMap:(MKMapView *)mapView
{
    MKMapViewVoidBlock block = mapView.mapViewWillStartRenderingMapBlock;
    
    if (block) {
        block(mapView);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapViewWillStartRenderingMap:)]) {
        [delegate mapViewWillStartRenderingMap:mapView];
    }
}

- (void)mapViewDidFinishRenderingMap:(MKMapView *)mapView fullyRendered:(BOOL)fullyRendered NS_AVAILABLE(10_9, 7_0)
{
    MKMapViewVoidFullyRenderedBlock block = mapView.mapViewDidFinishRenderingMapBlock;
    
    if (block) {
        block(mapView,fullyRendered);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapViewDidFinishRenderingMap:fullyRendered:)]) {
        [delegate mapViewDidFinishRenderingMap:mapView fullyRendered:fullyRendered];
    }
}

// mapView:viewForAnnotation: provides the view for each annotation.
// This method may be called for all or some of the added annotations.
// For MapKit provided annotations (eg. MKUserLocation) return nil to use the MapKit provided annotation view.
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation
{
    MKMapViewAnnotationViewAnnotationBlock block = mapView.mapViewViewForAnnotationBlock;
    
    if (block) {
        return block(mapView,annotation);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:viewForAnnotation:)]) {
        return [delegate mapView:mapView viewForAnnotation:annotation];
    }
    
    return nil;
}

// mapView:didAddAnnotationViews: is called after the annotation views have been added and positioned in the map.
// The delegate can implement this method to animate the adding of the annotations views.
// Use the current positions of the annotation views as the destinations of the animation.
- (void)mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views
{
    MKMapViewVoidArrayBlock block = mapView.mapvViewDidAddAnnotationViewsBlock;
    
    if (block) {
         block(mapView,views);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:didAddAnnotationViews:)]) {
        [delegate mapView:mapView didAddAnnotationViews:views];
    }
}

#if TARGET_OS_IPHONE
// mapView:annotationView:calloutAccessoryControlTapped: is called when the user taps on left & right callout accessory UIControls.
- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    MKMapViewVoidAnnotationViewUIControlBlock block = mapView.mapViewAnnotationViewCalloutAccessoryControlTappedBlock;
    
    if (block) {
        block(mapView,view,control);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:annotationView:calloutAccessoryControlTapped:)]) {
        [delegate mapView:mapView annotationView:view calloutAccessoryControlTapped:control];
    }
}

#endif

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0)
{
    MKMapViewVoidAnnotationViewBlock block = mapView.mapViewDidSelectAnnotationViewBlock;
    
    if (block) {
        block(mapView,view);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:didSelectAnnotationView:)]) {
        [delegate mapView:mapView didSelectAnnotationView:view];
    }
}

- (void)mapView:(MKMapView *)mapView didDeselectAnnotationView:(MKAnnotationView *)view NS_AVAILABLE(10_9, 4_0)
{
    MKMapViewVoidAnnotationViewBlock block = mapView.mapViewDidDeselectAnnotationViewBlock;
    
    if (block) {
        block(mapView,view);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:didDeselectAnnotationView:)]) {
        [delegate mapView:mapView didDeselectAnnotationView:view];
    }
}

- (void)mapViewWillStartLocatingUser:(MKMapView *)mapView NS_AVAILABLE(10_9, 4_0)
{
    MKMapViewVoidBlock block = mapView.mapViewWillStartLocatingUserBlock;
    
    if (block) {
        block(mapView);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapViewWillStartLocatingUser:)]) {
        [delegate mapViewWillStartLocatingUser:mapView];
    }
}

- (void)mapViewDidStopLocatingUser:(MKMapView *)mapView NS_AVAILABLE(10_9, 4_0)
{
    MKMapViewVoidBlock block = mapView.mapViewDidStopLocatingUserBlock;
    
    if (block) {
        block(mapView);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapViewDidStopLocatingUser:)]) {
        [delegate mapViewDidStopLocatingUser:mapView];
    }
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation NS_AVAILABLE(10_9, 4_0)
{
    MKMapViewVoidUserLocationBock block = mapView.mapViewDidUpdateUserLocationBlock;
    
    if (block) {
        block(mapView,userLocation);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:didUpdateUserLocation:)]) {
        [delegate mapView:mapView didUpdateUserLocation:userLocation];
    }
}

- (void)mapView:(MKMapView *)mapView didFailToLocateUserWithError:(NSError *)error NS_AVAILABLE(10_9, 4_0)
{
    MKMapViewVoidErrorBlock block = mapView.mapViewDidFailToLocateUserWithErrorBlock;
    
    if (block) {
        block(mapView,error);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:didFailToLocateUserWithError:)]) {
        [delegate mapView:mapView didFailToLocateUserWithError:error];
    }
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view didChangeDragState:(MKAnnotationViewDragState)newState
   fromOldState:(MKAnnotationViewDragState)oldState NS_AVAILABLE(10_9, 4_0)
{
    MKMapViewVoidAnnotationViewNewDragStateOldDragStateBlock block = mapView.mapViewAnnotationViewDidChangeDragStateBlock;
    
    if (block) {
        block(mapView,view,newState,oldState);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:annotationView:didChangeDragState:fromOldState:)]) {
        [delegate mapView:mapView annotationView:view didChangeDragState:newState fromOldState:oldState];
    }
}

#if TARGET_OS_IPHONE
- (void)mapView:(MKMapView *)mapView didChangeUserTrackingMode:(MKUserTrackingMode)mode animated:(BOOL)animated
{
    MKMapViewVoidUserTrackingModeAnimatedBlock block = mapView.mapViewDidChangeUserTrackingModeBlock;
    
    if (block) {
        block(mapView,mode,animated);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:didChangeUserTrackingMode:animated:)]) {
        [delegate mapView:mapView didChangeUserTrackingMode:mode animated:animated];
    }
}
#endif

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id <MKOverlay>)overlay
{
    MKMapViewOverLayRendererOverlayBlock block = mapView.mapViewRendererForOverlayBlock;
    
    if (block) {
        return block(mapView,overlay);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:rendererForOverlay:)]) {
        return [delegate mapView:mapView rendererForOverlay:overlay];
    }
    return nil;
}

- (void)mapView:(MKMapView *)mapView didAddOverlayRenderers:(NSArray *)renderers NS_AVAILABLE(10_9, 7_0)
{
    MKMapViewVoidArrayBlock block = mapView.mapViewDidAddOverlayRenderersBlock;
    
    if (block) {
        block(mapView,renderers);
    }
    
    id delegate = objc_getAssociatedObject(self, MKMapViewDelegateKey);
    
    if ([delegate respondsToSelector:@selector(mapView:didAddOverlayRenderers:)]) {
        [delegate mapView:mapView didAddOverlayRenderers:renderers];
    }
}
#pragma mark block based getters/setters
- (void (^)(MKMapView *, BOOL))mapViewRegionWillChangeAnimatedBlock
{
    return objc_getAssociatedObject(self, UITextFieldShouldClearKey);
}
- (void)setMapViewRegionWillChangeAnimatedBlock:(void (^)(MKMapView *, BOOL))mapViewRegionWillChangeAnimatedBlock
{
    
}

/*
 
 return objc_getAssociatedObject(self, UITextFieldShouldClearKey);
 }
 
 - (void)setShouldClearBlock:(BOOL (^)(UITextField *textField))shouldClearBlock
 {
 [self setDelegateIfNoDelegateSet];
 objc_setAssociatedObject(self, UITextFieldShouldClearKey, shouldClearBlock, OBJC_ASSOCIATION_COPY);
 }
*/
/*
@property (copy, nonatomic) void (^mapViewRegionWillChangeAnimatedBlock)(MKMapView *mapView, BOOL animated);
@property (copy, nonatomic) void (^mapViewRegionDidChangeAnimatedBlock)(MKMapView *maoView, BOOL animated);

@property (copy, nonatomic) void (^mapViewWillStartLoadingMapBlock)(MKMapView *mapView);
@property (copy, nonatomic) void (^mapViewDidFinishLoadingMapBlock)(MKMapView *mapView);
@property (copy, nonatomic) void (^mapViewDidFailLoadingMapBlock)(MKMapView *mapView, NSError *error);

@property (copy, nonatomic) void (^mapViewWillStartRenderingMapBlock)(MKMapView *mapView);
@property (copy, nonatomic) void (^mapViewDidFinishRenderingMapBlock)(MKMapView *mapView, BOOL fullyRendered);

@property (copy, nonatomic) MKAnnotationView* (^mapViewViewForAnnotationBlock)(MKMapView *mapView, id<MKAnnotation> annotation);

@property (copy, nonatomic) void (^mapvViewDidAddAnnotationViewsBlock)(MKMapView *mapView, NSArray *views);

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
*/
@end
