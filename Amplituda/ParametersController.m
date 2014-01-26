#import "ParametersController.h"
#import "HUDView.h"

@interface ParametersController ()

@end

@implementation ParametersController {
    NSString *numberVibrText;
    NSString *massPodvSystemText;
    NSString *modelName;
    NSString *debalancePosition;
    NSString *massVibr;
    NSString *statMoment;
}

float amplitude;

@synthesize modelVibrLabel;
@synthesize statMomentLabel;
@synthesize debalancePositionLabel;
@synthesize massVibrLabel;
@synthesize numberVibrTextField;
@synthesize massPodvSystemTextField;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        numberVibrText = @"";
        massPodvSystemText = @"";
        modelName = @"ИВ-98Б";
        debalancePosition = @"VI";
        massVibr = @"20.0";
        statMoment = @"11.4";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.numberVibrTextField.text = numberVibrText;
    self.numberVibrTextField.enabled = NO;
    self.massPodvSystemTextField.text = massPodvSystemText;
    self.massPodvSystemTextField.enabled = NO;
    self.modelVibrLabel.text = modelName;
    self.debalancePositionLabel.text = debalancePosition;
    self.massVibrLabel.text = massVibr;
    self.statMomentLabel.text = statMoment;
    
    [self editButton];
}

#pragma mark - Editing

- (void)edit:(id)sender
{
    [self saveButton];
    
    self.numberVibrTextField.enabled = YES;
    self.massPodvSystemTextField.enabled = YES;
    [self.numberVibrTextField becomeFirstResponder];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"PickModel"]) {
        ModelPickerViewController *controller = segue.destinationViewController;
        controller.delegate = self;
        controller.selectedModelName = modelName;
    } else if ([segue.identifier isEqualToString:@"PickDebalance"]) {
        DebalancePickerViewController *controller = segue.destinationViewController;
        controller.delegate = self;
        controller.selectedDebalancePosition = debalancePosition;
    }
}

- (void)chooseMass
{
    if ([modelName isEqualToString:@"ИВ-99Б"]) {
        massVibr = @"11.5";
    } else if ([modelName isEqualToString:@"ИВ-98Б"]) {
        massVibr = @"20.0";
    } else if ([modelName isEqualToString:@"ИВ-107А"]) {
        massVibr = @"40.0";
    } else if ([modelName isEqualToString:@"ИВ-107А-1.5"]) {
        massVibr = @"41.0";
    } else if ([modelName isEqualToString:@"ИВ-105-2.2"]) {
        massVibr = @"79.5";
    } else if ([modelName isEqualToString:@"ИВ-99Н"]) {
        massVibr = @"14.5";
    } else if ([modelName isEqualToString:@"ИВ-107Н"]) {
        massVibr = @"46.0";
    } else if ([modelName isEqualToString:@"ИВ-107Н-1.5"]) {
        massVibr = @"46.0";
    } else if ([modelName isEqualToString:@"ИВ-105Н-2.2"]) {
        massVibr = @"79.5";
    }
    self.massVibrLabel.text = massVibr;

}

- (void)chooseDebalancePosition
{
    if ([modelName isEqualToString:@"ИВ-99Б"] || [modelName isEqualToString:@"ИВ-99Н"]) {
        if ([debalancePosition isEqualToString:@"I"]) {
            statMoment = @"2.55";
        } else if ([debalancePosition isEqualToString:@"II"]) {
            statMoment = @"3.45";
        } else if ([debalancePosition isEqualToString:@"III"]) {
            statMoment = @"4.2";
        } else if ([debalancePosition isEqualToString:@"IV"]) {
            statMoment = @"4.6";
        } else if ([debalancePosition isEqualToString:@"V"]) {
            statMoment = @"4.9";
        } else if ([debalancePosition isEqualToString:@"VI"]) {
            statMoment = @"5.1";
        }
    } else if ([modelName isEqualToString:@"ИВ-98Б"]) {
        if ([debalancePosition isEqualToString:@"I"]) {
            statMoment = @"5.7";
        } else if ([debalancePosition isEqualToString:@"II"]) {
            statMoment = @"7.7";
        } else if ([debalancePosition isEqualToString:@"III"]) {
            statMoment = @"9.4";
        } else if ([debalancePosition isEqualToString:@"IV"]) {
            statMoment = @"10.3";
        } else if ([debalancePosition isEqualToString:@"V"]) {
            statMoment = @"11.1";
        } else if ([debalancePosition isEqualToString:@"VI"]) {
            statMoment = @"11.4";
        }
    } else if ([modelName isEqualToString:@"ИВ-105-2.2"] || [modelName isEqualToString:@"ИВ-105Н-2.2"]) {
        if ([debalancePosition isEqualToString:@"I"]) {
            statMoment = @"20.0";
        } else if ([debalancePosition isEqualToString:@"II"]) {
            statMoment = @"26.0";
        } else if ([debalancePosition isEqualToString:@"III"]) {
            statMoment = @"32.0";
        } else if ([debalancePosition isEqualToString:@"IV"]) {
            statMoment = @"36.0";
        } else if ([debalancePosition isEqualToString:@"V"]) {
            statMoment = @"38.8";
        } else if ([debalancePosition isEqualToString:@"VI"]) {
            statMoment = @"40.0";
        }
    } else if ([modelName isEqualToString:@"ИВ-107А"] || [modelName isEqualToString:@"ИВ-107Н"]) {
        if ([debalancePosition isEqualToString:@"I"]) {
            statMoment = @"10.0";
        } else if ([debalancePosition isEqualToString:@"II"]) {
            statMoment = @"13.0";
        } else if ([debalancePosition isEqualToString:@"III"]) {
            statMoment = @"16.0";
        } else if ([debalancePosition isEqualToString:@"IV"]) {
            statMoment = @"18.0";
        } else if ([debalancePosition isEqualToString:@"V"]) {
            statMoment = @"19.4";
        } else if ([debalancePosition isEqualToString:@"VI"]) {
            statMoment = @"20.0";
        }
    } else if ([modelName isEqualToString:@"ИВ-107А-1.5"] || [modelName isEqualToString:@"ИВ-107Н-1.5"]) {
        if ([debalancePosition isEqualToString:@"I"]) {
            statMoment = @"10.0";
        } else if ([debalancePosition isEqualToString:@"II"]) {
            statMoment = @"13.0";
        } else if ([debalancePosition isEqualToString:@"III"]) {
            statMoment = @"16.0";
        } else if ([debalancePosition isEqualToString:@"IV"]) {
            statMoment = @"18.0";
        } else if ([debalancePosition isEqualToString:@"V"]) {
            statMoment = @"19.4";
        } else if ([debalancePosition isEqualToString:@"VI"]) {
            statMoment = @"20.0";
        }
    }
        
    self.statMomentLabel.text = statMoment;
}

- (void)calculationAmplitude
{
    [self enterText];
    
    int n = [numberVibrText intValue];
    float statM = [statMoment floatValue];
    float mSyst = [massPodvSystemText floatValue];
    float mVibr = [massVibr floatValue];
    
    amplitude = ((n * statM) / (mSyst + n * mVibr));
}

+ (float)amplitude
{
    return amplitude;
}

- (void)showAlertMessage:(NSString *)message title:(NSString *)title cancelButton:(NSString *)cancel
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:nil cancelButtonTitle:cancel otherButtonTitles:nil, nil];
    [alertView show];
}

- (void)save:(id)sender
{
    [self calculationAmplitude];

    [self hudMessage];
}

- (void)hudMessage
{
    HUDView *hudView;
    NSString *title = [NSString stringWithFormat:@"Error"];
    
    if ([numberVibrText isEqualToString:@""]) {
        [self showAlertMessage:@"Enter the number of vibrators" title:title cancelButton:@"OK"];
        [self saveButton];
    } else if ([massPodvSystemText isEqualToString:@""]) {
        [self showAlertMessage:@"Enter the mass of mobile system" title:title cancelButton:@"OK"];
        [self saveButton];
    } else {
        hudView = [HUDView hudInView:self.navigationController.view animated:YES];
        hudView.text = @"Save";
        self.numberVibrTextField.enabled = NO;
        self.massPodvSystemTextField.enabled = NO;
        [self calculationAmplitude];
        [self editButton];
    }
}

- (void)saveButton
{
    UIBarButtonItem *saveBut = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave target:self action:@selector(save:)];
    self.navigationItem.rightBarButtonItem = saveBut;
}

- (void)editButton
{
    UIBarButtonItem *editBut = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemEdit target:self action:@selector(edit:)];
    self.navigationItem.rightBarButtonItem = editBut;

}

#pragma mark - UItableViewDelegate

- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ((indexPath.section == 0 && indexPath.row == 0) || (indexPath.section == 0 && indexPath.row == 1)) {
        return indexPath;
    } else {
        return nil;
    }
}

#pragma mark - UITextFieldDelegate

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    numberVibrText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    massPodvSystemText = [textField.text stringByReplacingCharactersInRange:range withString:string];
    
    return YES;
}

- (void)enterText
{
    [self textFieldDidEndEditing:numberVibrTextField];
    numberVibrText = numberVibrTextField.text;
    [self textFieldDidEndEditing:massPodvSystemTextField];
    massPodvSystemText = massPodvSystemTextField.text;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSString *value;
    value = textField.text;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField.tag == 10) {
        [[self.view viewWithTag:11] becomeFirstResponder];
    } else {
        [self editButton];
        [self hudMessage];
    }
    return YES;
}

#pragma mark - ModelPickerViewControllerDelegate

- (void)modelPicker:(ModelPickerViewController *)picker didPickModel:(NSString *)theModelName
{
    modelName = theModelName;
    self.modelVibrLabel.text = modelName;
    [self chooseMass];
    
    [self calculationAmplitude];
    
    
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - DebalancePickerViewControllerDelegate

- (void)debalancePicker:(DebalancePickerViewController *)picker didPickDebalance:(NSString *)theDebalancePosition
{
    debalancePosition = theDebalancePosition;
    self.debalancePositionLabel.text = debalancePosition;
    [self chooseDebalancePosition];
    
    [self calculationAmplitude];

    [self.navigationController popViewControllerAnimated:YES];
}


@end
