#import "CalculationViewController.h"

@interface CalculationViewController ()

@end

@implementation CalculationViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self updateLabel];
}

- (void)updateLabel
{
    if ([ParametersController amplitude] > 0) {
        self.wholeText.hidden = NO;
        self.resultAmplitudeLabel.text = [NSString stringWithFormat:@"%.4f sm", [ParametersController amplitude]];
        self.save.text = [NSString stringWithFormat:@"Power of vibrator is 3000 rpm"];
        self.frequence.text = [NSString stringWithFormat:@"Vibration frequence is 36 Hz"];
        self.frequence.hidden = NO;
    } else {
        self.wholeText.hidden = YES;
        self.resultAmplitudeLabel.text = [NSString stringWithFormat:@"Enter all parameters"];
        self.save.hidden = NO;
    }
}

@end
