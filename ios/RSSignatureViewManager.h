#import "RSSignatureView.h"
#import <React/RCTViewManager.h>

@interface RSSignatureViewManager : RCTViewManager
@property (nonatomic, strong) RSSignatureView *signView;
-(void) saveImage:(NSString *) aTempPath withEncoded: (NSString *) aEncoded;
@end
