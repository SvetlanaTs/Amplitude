#import "DebalancePickerViewController.h"

@interface DebalancePickerViewController ()

@end

@implementation DebalancePickerViewController {
    NSArray *debalances;
    NSIndexPath *selectedIndexPath;
}

@synthesize delegate, selectedDebalancePosition;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    debalances = [NSArray arrayWithObjects:
                  @"I",
                  @"II",
                  @"III",
                  @"IV",
                  @"V",
                  @"VI",
                  nil];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return debalances.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.backgroundColor = [UIColor clearColor];
    
    NSString *debalancePosition = [debalances objectAtIndex:indexPath.row];
    cell.textLabel.text = debalancePosition;
    
    if ([debalancePosition isEqualToString:self.selectedDebalancePosition]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        selectedIndexPath = indexPath;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row != selectedIndexPath.row) {
        UITableViewCell *newCell = [tableView cellForRowAtIndexPath:indexPath];
        newCell.accessoryType = UITableViewCellAccessoryCheckmark;
        
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:selectedIndexPath];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        
        selectedIndexPath = indexPath;
    }
    
    NSString *debalancePosition = [debalances objectAtIndex:indexPath.row];
    [self.delegate debalancePicker:self didPickDebalance:debalancePosition];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    CGRect frame = (section == 1) ? CGRectZero : CGRectMake(0, 0, 320, 20);
    UIView *footerView = [[UIView alloc] initWithFrame:frame];
    
    return footerView;
}

@end
