#import "PPSSignatureView.h"
#import <UIKit/UIKit.h>
#import "RCTView.h"
#import "RCTBridge.h"

@class RSSignatureViewManager;

@interface RSSignatureView : RCTView
@property (nonatomic, strong) PPSSignatureView *sign;
@property (nonatomic, strong) RSSignatureViewManager *manager;
-(NSString*) onSaveButtonPressed;
-(void) onClearButtonPressed;
-(void)deleteFile:(NSString *)fileToDelete;
@end
