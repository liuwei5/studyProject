#import <UIKit/UIKit.h>

#define kBDKNotifyHUDDefaultWidth 250.0f
#define kBDKNotifyHUDDefaultHeight 25.0f

@interface BDKNotifyHUD : UIView

@property (assign, nonatomic) CGFloat destinationOpacity;
@property (assign, nonatomic) CGFloat currentOpacity;
@property (nonatomic,strong) UIImage *image;
@property (assign, nonatomic) CGFloat roundness;
@property (assign, nonatomic) BOOL bordered;
@property (assign, nonatomic) BOOL isAnimating;

@property (strong, nonatomic) UIColor *borderColor;
@property (strong, nonatomic) NSString *text;

+ (id)notifyHUDWithImage:(UIImage *)image text:(NSString *)text;
- (id)initWithImage:(UIImage *)image text:(NSString *)text;

- (void)presentWithDuration:(CGFloat)duration speed:(CGFloat)speed inView:(UIView *)view completion:(void (^)(void))completion;

@end
