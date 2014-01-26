#import "ModelPickerViewController.h"

@interface ModelPickerViewController ()

@end

@implementation ModelPickerViewController {
    NSArray *models;
    NSIndexPath *selectedIndexPath;
}

@synthesize delegate, selectedModelName;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    models = [NSArray arrayWithObjects:
              @"ИВ-99Б",
              @"ИВ-98Б",
              @"ИВ-107А",
              @"ИВ-107А-1.5",
              @"ИВ-105-2.2",
              @"ИВ-99Н",
              @"ИВ-107Н",
              @"ИВ-107Н-1.5",
              @"ИВ-105Н-2.2",
              nil];
}

#pragma mark - UItableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return models.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    NSString *modelName = [models objectAtIndex:indexPath.row];
    cell.textLabel.text = modelName;
    
    if ([modelName isEqualToString:self.selectedModelName]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        selectedIndexPath = indexPath;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    return cell;
}

#pragma mark - UItableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != selectedIndexPath.row) {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:selectedIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        selectedIndexPath = indexPath;
    }
    
    NSString *modelName = [models objectAtIndex:indexPath.row];
    [self.delegate modelPicker:self didPickModel:modelName];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CGRect frame = (section == 1) ? CGRectZero : CGRectMake(0, 0, 320, 20);
    UIView *footerView = [[UIView alloc] initWithFrame:frame];
    
    return footerView;
}

@end
