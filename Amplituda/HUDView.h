#import <UIKit/UIKit.h>

@interface HUDView : UIView

+ (HUDView *)hudInView:(UIView *)view animated:(BOOL)animated;

@property (nonatomic, strong) NSString *text;

@end
