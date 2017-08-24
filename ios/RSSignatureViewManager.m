#import "RSSignatureViewManager.h"
#import <React/RCTBridgeModule.h>
#import <React/RCTBridge.h>
#import <React/RCTEventDispatcher.h>

@implementation RSSignatureViewManager

@synthesize bridge = _bridge;
@synthesize signView;

RCT_EXPORT_MODULE()

RCT_EXPORT_VIEW_PROPERTY(rotateClockwise, BOOL)
RCT_EXPORT_VIEW_PROPERTY(square, BOOL)

-(dispatch_queue_t) methodQueue
{
	return dispatch_get_main_queue();
}

-(UIView *) view
{
	self.signView = [[RSSignatureView alloc] init];
	self.signView.manager = self;
	return signView;
}

-(void) saveImage:(NSString *) aTempPath withEncoded: (NSString *) aEncoded {
	[self.bridge.eventDispatcher
	 sendDeviceEventWithName:@"onSaveEvent"
	 body:@{
					@"pathName": aTempPath,
					@"encoded": aEncoded
					}];
}

RCT_EXPORT_METHOD(onSaveButtonPressed:(RCTResponseSenderBlock)successCallback) {
    NSString* tempPath = [self.signView onSaveButtonPressed];
    successCallback(@[tempPath]);
}

RCT_EXPORT_METHOD(deleteFile:(NSString*)fileToDelete){
    [self.signView deleteFile:fileToDelete];
}

RCT_EXPORT_METHOD(onClearButtonPressed) {
    [self.signView onClearButtonPressed];
}

RCT_EXPORT_METHOD(isEmpty:(RCTResponseSenderBlock)successCallback) {
    BOOL isEmpty = [self.signView isEmpty];
    successCallback(@[[NSNumber numberWithBool:isEmpty]]);
}

@end
