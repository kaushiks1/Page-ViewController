//
//  NominationDetailsViewController.m
//  BGPPlanRegister
//
//  Created by SILICON on 06/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "NominationDetailsViewController.h"

@interface NominationDetailsViewController ()

@end

@implementation NominationDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",[Utility descriptionForObject:_dataModelBGPPlanRegister]);
    
    _viewDatePicker.hidden = YES;
    _labelDate.text = nil;
    
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

- (BGPPlanRegisterDataModel *)collectDataInNominationDetailsViewController
{
//    nomination_name;
//    nomination_dob;
//    nomination_applicant_realtion;
//    nomination_address;
//    nomination_city;
//    nomination_state;
//    nomination_pincode;
    
    _dataModelBGPPlanRegister.nomination_name = _textFieldName.text;
    _dataModelBGPPlanRegister.nomination_dob = _labelDate.text;
    _dataModelBGPPlanRegister.nomination_applicant_realtion = _textFieldRelationshipWithApplicant.text;
    _dataModelBGPPlanRegister.nomination_address = _textFieldAddress.text;
    _dataModelBGPPlanRegister.nomination_city = _textFieldCity.text;
    _dataModelBGPPlanRegister.nomination_state = _textFieldState.text;
    _dataModelBGPPlanRegister.nomination_pincode = _textFieldPincode.text;
    
    return _dataModelBGPPlanRegister;
}

- (BOOL)shouldGoNextScreen
{
    return [self isValidAllTextfield];
}


#pragma mark - TextField Delegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    // return NO to disallow editing_dataModelBGPPlanRegister.
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
    
    if (textField == _textFieldPincode)
    {
        // Prevent crashing undo bug – see note below.
        if(range.length + range.location > textField.text.length)
        {
            return NO;
        }
        NSUInteger newLength = [textField.text length] + [string length] - range.length;
        return newLength <= 6;
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
    
//    BOOL isValidate = NO;
//    
//    if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldName.text].length == 0) {
//        [Utility showAlertControllerwithMessage:@"Please Enter Name"];
//    }
//    else if (![Utility isValidEmail:_textFieldEmailID.text])
//    {
//        [Utility showAlertControllerwithMessage:@"Please Enter valid Email ID"];
//    }
//    else if (![Utility isValidPhone:[@"+91" stringByAppendingString:_textFieldMobileNumber.text]])
//    {
//        [Utility showAlertControllerwithMessage:@"Please Enter valid Phone Number"];
//    }
//    else if (_labelDate.text.length == 0)
//    {
//        [Utility showAlertControllerwithMessage:@"Please Select Date"];
//    }
//    else
//    {
//        isValidate = YES;
//    }
    return YES;
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


- (IBAction)buttonActionDate:(id)sender {
    _viewDatePicker.hidden = NO;
    [_textFieldActive resignFirstResponder];
}

- (IBAction)buttonActionAddressSame:(id)sender
{
    _buttonAddressSame.selected = !_buttonAddressSame.selected;
    
    if (_buttonAddressSame.selected)
    {
        _textFieldAddress.enabled = NO;
        _textFieldCity.enabled = NO;
        _textFieldState.enabled = NO;
        _textFieldPincode.enabled = NO;
        
        _textFieldAddress.text = _dataModelBGPPlanRegister.mailing_address;
        _textFieldCity.text = _dataModelBGPPlanRegister.mailing_city;
        _textFieldState.text = _dataModelBGPPlanRegister.mailing_state;
        _textFieldPincode.text = _dataModelBGPPlanRegister.mailing_pincode;
        
        
    }
    else
    {
        _textFieldAddress.enabled = YES;
        _textFieldCity.enabled = YES;
        _textFieldState.enabled = YES;
        _textFieldPincode.enabled = YES;
        
        _textFieldAddress.text = @"";
        _textFieldCity.text = @"";
        _textFieldState.text = @"";
        _textFieldPincode.text = @"";
        
    }
    
}

- (IBAction)datePickerAction:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    NSString *strDate = [dateFormatter stringFromDate:_datePicker.date];
    _labelDate.text = strDate;
}




@end
