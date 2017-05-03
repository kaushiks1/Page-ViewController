//
//  ApplicationDetailsViewController.m
//  BGPPlanRegister
//
//  Created by SILICON on 08/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "ApplicationDetailsViewController.h"

@interface ApplicationDetailsViewController ()

@end

@implementation ApplicationDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",[Utility descriptionForObject:_dataModelBGPPlanRegister]);
    
    _stringFulfilment = @"Coin";
    _buttonDimonsJewellery.selected = YES;
    _arrayTableViewData = [[NSMutableArray alloc]initWithObjects:@"Website",@"Social Media",@"Mobile App",@"Newspaper",@"Friend",@"Other", nil];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleTapTapGestureRecognizerEvent:)];
    [_viewMain addGestureRecognizer:tapGesture];
    
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    [_viewPopUpBelowTable addGestureRecognizer:tapGestureRecognizer];
    
    [_tableViewPopUp.layer setCornerRadius:4.0f];
    [_tableViewPopUp.layer setMasksToBounds:YES];
    _tableViewPopUp.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    _textFieldMobileNumber.text = _dataModelBGPPlanRegister.contact_mobile;
    _textFieldEmailID.text = _dataModelBGPPlanRegister.contact_email;
    
    _isReferanceDefault = YES;
    
    // Do any additional setup after loading the view.
}

-(void)viewWillAppear:(BOOL)animated
{
    _tableViewPopUp.hidden = YES;
    _viewPopUpBelowTable.hidden = YES;
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

- (BGPPlanRegisterDataModel *)collectDataInApplicationDetailsViewController
{
    //    fulfilment;
    //    partner_code;
    //    lead_source;
    //    lead_source_other
    //    mailing_address;
    //    mailing_city;
    //    mailing_state;
    //    mailing_landmark;
    //    mailing_district;
    //    mailing_country;
    //    mailing_pincode;
    //    contact_phone_residence;
    //    contact_phone_office;
    
    
    _dataModelBGPPlanRegister.fulfilment = _stringFulfilment;
    _dataModelBGPPlanRegister.partner_code = _textFieldReferalID.text;
    if (_isReferanceDefault)
    {
        _dataModelBGPPlanRegister.lead_source = _labelReferance.text;
    }
    else if (_isReferanceOther)
    {
        _dataModelBGPPlanRegister.lead_source_other = _labelReferance.text;
    }
    
    
    _dataModelBGPPlanRegister.mailing_address = _textFieldMailingAddress.text;
    _dataModelBGPPlanRegister.mailing_city = _textFieldCity.text;
    _dataModelBGPPlanRegister.mailing_state = _textFieldState.text;
    _dataModelBGPPlanRegister.mailing_landmark = _textFieldLandmark.text;
    _dataModelBGPPlanRegister.mailing_district = _textFieldDistrict.text;
    _dataModelBGPPlanRegister.mailing_country = _textFieldCountry.text;
    _dataModelBGPPlanRegister.mailing_pincode = _textFieldPinCode.text;
    _dataModelBGPPlanRegister.contact_phone_residence = _textFieldLandLine.text;
    _dataModelBGPPlanRegister.contact_phone_office = _textFieldOfficeNumber.text;
    
    
    return _dataModelBGPPlanRegister;
}

- (BOOL)shouldGoNextScreen
{
    BOOL canGoNextScreen = NO;
    
    if ([self isValidAllTextfield])
    {
        if (_buttonIAgree.selected)
        {
            canGoNextScreen = YES;
        }
        else
        {
            [Utility showAlertControllerwithMessage:@"Please Tick Agreement Check Box"];
        }
        
    }
    
    
    return canGoNextScreen;
}


- (IBAction)buttonActionDimondJewellery:(id)sender
{
    [self tickMarkOnButtonAtIndex:1];
}

- (IBAction)buttonActionGoldJewellery:(id)sender
{
    [self tickMarkOnButtonAtIndex:2];
}

- (IBAction)buttonActionGoldPendent:(id)sender
{
    [self tickMarkOnButtonAtIndex:3];
}

- (IBAction)buttonActionReferance:(id)sender
{
    _viewPopUpBelowTable.hidden = NO;
    _tableViewPopUp.hidden = NO;
    
//    _tableViewPopUp.frame = CGRectMake(_labelReferance.frame.origin.x, _labelReferance.frame.origin.y, _labelReferance.frame.size.width - _imagaeViewDropDown.frame.size.width, (HT/15.0*(_arrayTableViewData.count)));
    
    _tableViewPopUp.frame = CGRectMake(_tableViewPopUp.frame.origin.x, _tableViewPopUp.frame.origin.y, _tableViewPopUp.frame.size.width, (HT/15.0*(_arrayTableViewData.count)));
    
}

- (IBAction)buttonActionIAgree:(id)sender
{
    _buttonIAgree.selected = !_buttonIAgree.selected;
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
    
    //    if (_textFieldActive != _textFieldReferalID && _textFieldActive != _textFieldMailingAddress) {
    //        //    iPhone = -210
    //        //    iPad = -230
    //        [self viewUpDownWithAnimationYCoordinate:-230];
    //    }
    
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
    
    if (textField == _textFieldPinCode)
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
    
    BOOL isValidate = NO;
    
    if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldCity.text].length == 0) {
        [Utility showAlertControllerwithMessage:@"Please Enter City Name"];
    }
    else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldState.text].length == 0) {
        [Utility showAlertControllerwithMessage:@"Please Enter State Name"];
    }
    else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldDistrict.text].length == 0) {
        [Utility showAlertControllerwithMessage:@"Please Enter District Name"];
    }
    else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldPinCode.text].length == 0) {
        [Utility showAlertControllerwithMessage:@"Please Enter Pincode"];
    }
    else
    {
        isValidate = YES;
    }
    return isValidate;
}


- (void)handleTapTapGestureRecognizerEvent:(UITapGestureRecognizer *)recognizer
{
    [_textFieldActive resignFirstResponder];
    
}

- (void)tickMarkOnButtonAtIndex:(int)selectedButton
{
    _buttonDimonsJewellery.selected = NO;
    _buttonGoldJewellery.selected = NO;
    _buttonGoldPendent.selected = NO;
    
    if (selectedButton == 1)
    {
        _buttonDimonsJewellery.selected = YES;
        _stringFulfilment = @"Coin";
    }
    else if (selectedButton == 2)
    {
        _buttonGoldJewellery.selected = YES;
        _stringFulfilment = @"Jewellery";
    }
    else if (selectedButton == 3)
    {
        _buttonGoldPendent.selected = YES;
        _stringFulfilment = @"Pendant";
    }
    
}



#pragma mark - View Popup
#pragma mark - TableView Delegate
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrayTableViewData count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellTableView"];
    
    cell.textLabel.text = [_arrayTableViewData objectAtIndex:indexPath.row];
    cell.backgroundColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
{
//    view.tintColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1];
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"";
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HT/15.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == [_arrayTableViewData count]-1)
    {
        NSLog(@"Other Selected");
        _viewPopUpBelowTable.hidden = YES;
        _tableViewPopUp.hidden = YES;
        _isReferanceDefault = NO;
        _isReferanceOther = YES;
        
        
        UIAlertView *alertView = [[UIAlertView alloc]
                                  initWithTitle:nil
                                  message:@"Enter Other Referance"
                                  delegate:self
                                  cancelButtonTitle:nil
                                  otherButtonTitles:@"OK", nil];
        alertView.alertViewStyle = UIAlertViewStylePlainTextInput;
        [alertView show];
        
//        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Enter Referance"
//                                                                       message:nil
//                                                                preferredStyle:UIAlertControllerStyleAlert];
//        [alertController addTextFieldWithConfigurationHandler:^(UITextField *textField) {
//            // optionally configure the text field
//            textField.keyboardType = UIKeyboardTypeDefault;
//        }];
//        
//        UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"OK"
//                                                           style:UIAlertActionStyleDefault
//                                                         handler:^(UIAlertAction *action) {
//                                                             UITextField *textFieldEnterOtherReferance = [alertController.textFields firstObject];
//                                                             NSLog(@"%@",textFieldEnterOtherReferance.text);
//                                                             if ([Utility trimString_RemoveWhiteSpaceFromString:textFieldEnterOtherReferance.text].length != 0)
//                                                             {
//                                                                 _labelReferance.text = textFieldEnterOtherReferance.text;
//                                                             }
//                                                         }];
//        [alertController addAction:okAction];
//        [self presentViewController:alertController animated:YES completion:nil];
        
    }
    else
    {
        _labelReferance.text = [_arrayTableViewData objectAtIndex:indexPath.row];
        _viewPopUpBelowTable.hidden = YES;
        _tableViewPopUp.hidden = YES;
        _isReferanceDefault = YES;
        _isReferanceOther = NO;
    }
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSLog(@"%@",[alertView textFieldAtIndex:0].text);
    _labelReferance.text = [alertView textFieldAtIndex:0].text;
}


-(void)handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer
{
    _viewPopUpBelowTable.hidden = YES;
    _tableViewPopUp.hidden = YES;
    
}


@end
