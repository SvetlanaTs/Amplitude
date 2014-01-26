#import <UIKit/UIKit.h>

@class DebalancePickerViewController;

@protocol DebalancePickerViewControllerDelegate <NSObject>

- (void)debalancePicker:(DebalancePickerViewController *)picker didPickDebalance:(NSString *)theDebalancePosition;

@end

@interface DebalancePickerViewController : UITableViewController

@property (nonatomic, weak) id <DebalancePickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *selectedDebalancePosition;

@end
