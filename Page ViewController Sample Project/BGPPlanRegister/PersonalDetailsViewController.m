//
//  PersonalDetailViewController.m
//  BGPPlanRegister
//
//  Created by SILICON on 06/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "PersonalDetailsViewController.h"

@interface PersonalDetailsViewController ()

@end

@implementation PersonalDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];


    NSLog(@"%@",[Utility descriptionForObject:_dataModelBGPPlanRegister]);
    
    _buttonMale.selected = YES;
    _labelDate.text = nil;
    _viewDatePicker.hidden = YES;

    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleTapTapGestureRecognizerEvent:)];
    [self.view addGestureRecognizer:tapGesture];
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
 
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


- (BGPPlanRegisterDataModel *)collectDataInPersonalDetailsViewController
{
    
//    applicant_name;
//    applicant_gender;
//    contact_email;
//    contact_mobile;
//    applicant_dob;

    
    NSString *stringMaleORFemale;
    if (self.buttonMale.selected)
    {
        NSLog(@"Male");
        stringMaleORFemale = @"Male";
    }
    
    else if(self.buttonFemale.selected)
    {
        NSLog(@"Female");
        stringMaleORFemale = @"Female";
    }
    
    
    _dataModelBGPPlanRegister.applicant_name = _textFieldName.text;
    _dataModelBGPPlanRegister.applicant_gender = stringMaleORFemale;
    _dataModelBGPPlanRegister.contact_email = _textFieldEmailID.text;
    _dataModelBGPPlanRegister.contact_mobile = _textFieldMobileNumber.text;
    _dataModelBGPPlanRegister.applicant_dob = _labelDate.text;
    
    return _dataModelBGPPlanRegister;
}

- (BOOL)shouldGoNextScreen
{
    return [self isValidAllTextfield];
}

- (IBAction)buttonActionMale:(id)sender {
    if (!_buttonMale.selected)
    {
        _buttonMale.selected = !_buttonMale.selected;
    }
    _buttonFemale.selected = NO;
}

- (IBAction)buttonActionFemale:(id)sender {
    if (!_buttonFemale.selected)
    {
        _buttonFemale.selected = !_buttonFemale.selected;
    }
    _buttonMale.selected = NO;
}

- (IBAction)buttonActionDate:(id)sender {
    _viewDatePicker.hidden = NO;
    [_textFieldActive resignFirstResponder];

}

- (IBAction)datePickerAction:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:_datePicker.date];
    _labelDate.text = strDate;
    
    /*
    //MM/DD/YYYY
    NSDate *selectedDate = _datePicker.date;
    NSDate * today = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MM/dd/yyy"];
    
    NSString *selectedDateString = [formatter stringFromDate:selectedDate];
    NSString *currentDateString = [formatter stringFromDate:today];
    NSComparisonResult compResult = [today compare:selectedDate];
    if ((compResult != NSOrderedAscending) &&
        (NO == [currentDateString isEqualToString:selectedDateString])) {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Invalid Move Date" message:@"Please select a valid Move date" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [alertView show];
        return;
    }
    */
    
}



#pragma mark - TextField Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    // return NO to disallow editing.
    return YES;
    
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    // became first responder
    _textFieldActive = textField;
    _viewDatePicker.hidden = YES;
}

- (BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    [_textFieldActive resignFirstResponder];
}

    
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    // return NO to not change text
    
    if (textField == _textFieldMobileNumber)
    {
        // Prevent crashing undo bug – see note below.
        if(range.length + range.location > textField.text.length)
        {
            return NO;
        }
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 10;
    }
    else
    {
        return YES;
    }
    
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // called when 'return' key pressed. return NO to ignore.
    [_textFieldActive resignFirstResponder];
    return YES;
}


- (BOOL)isValidAllTextfield
{
    [self.view endEditing:YES];
    
    BOOL isValidate = NO;
    
    if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldName.text].length == 0) {
        [Utility showAlertControllerwithMessage:@"Please Enter Name"];
    }
    else if (![Utility isValidEmail:_textFieldEmailID.text])
    {
        [Utility showAlertControllerwithMessage:@"Please Enter valid Email ID"];
    }
    else if (![Utility isValidPhone:[@"+91" stringByAppendingString:_textFieldMobileNumber.text]])
    {
        [Utility showAlertControllerwithMessage:@"Please Enter valid Phone Number"];
    }
    else if (_labelDate.text.length == 0)
    {
        [Utility showAlertControllerwithMessage:@"Please Select Date"];
    }
    else if (![Utility isAbow18PlusAgeDateOfBirth:_labelDate.text])
    {
        [Utility showAlertControllerwithMessage:@"You need to be 18+ years"];
    }
    else
    {
        isValidate = YES;
    }
    return isValidate;
}

#pragma mark -
- (void)handleTapTapGestureRecognizerEvent:(UITapGestureRecognizer *)recognizer
{
    [_textFieldActive resignFirstResponder];
    _viewDatePicker.hidden = YES;
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:_datePicker.date];
    _labelDate.text = strDate;
}





@end
