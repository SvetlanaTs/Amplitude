#import <UIKit/UIKit.h>

@class ModelPickerViewController;

@protocol ModelPickerViewControllerDelegate <NSObject>

- (void)modelPicker:(ModelPickerViewController *)picker didPickModel:(NSString *)theModelName;

@end

@interface ModelPickerViewController : UITableViewController

@property (nonatomic, weak) id <ModelPickerViewControllerDelegate> delegate;
@property (nonatomic, strong) NSString *selectedModelName;

@end
