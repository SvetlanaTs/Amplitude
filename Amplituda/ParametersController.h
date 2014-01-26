#import <UIKit/UIKit.h>
#import "ModelPickerViewController.h"
#import "DebalancePickerViewController.h"

@interface ParametersController : UITableViewController <UITextViewDelegate, ModelPickerViewControllerDelegate, DebalancePickerViewControllerDelegate, UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UILabel *modelVibrLabel;
@property (strong, nonatomic) IBOutlet UILabel *statMomentLabel;
@property (strong, nonatomic) IBOutlet UILabel *debalancePositionLabel;
@property (strong, nonatomic) IBOutlet UILabel *massVibrLabel;
@property (strong, nonatomic) IBOutlet UITextField *numberVibrTextField;
@property (strong, nonatomic) IBOutlet UITextField *massPodvSystemTextField;

+ (float)amplitude;

@end
