//
//  PaymentDetailsViewController.m
//  BGPPlanRegister
//
//  Created by SILICON on 06/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "PaymentDetailsViewController.h"

@interface PaymentDetailsViewController ()

@end

@implementation PaymentDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /**************************************************
     **************************************************
     **************************************************
     
     
//   Hit Below API to fetch Payment Method
// http://shagunn.info/cherishws/mobileapi/get_payment_modes

     
     **************************************************
     **************************************************
     **************************************************/
    
    NSLog(@"%@",[Utility descriptionForObject:_dataModelBGPPlanRegister]);
    

    _arrayPaymentMode = [[NSMutableArray alloc]initWithObjects:@"Online",@"Cheque Pickup",@"Cheque send through Courier",@"Cash Pickup",@"NEFT/RTGS", nil];
    _arrayChequePickupAMPM = [[NSMutableArray alloc]initWithObjects:@"10am to 12pm",@"12pm to 2pm",@"2pm to 4pm",@"4pm to 6pm",@"6pm to 8pm", nil];
    
    _viewDatePicker.hidden = YES;
    
    _buttonMinus.layer.cornerRadius = 4;
//    _buttonMinus.clipsToBounds = YES;
    _buttonMinus.layer.borderWidth = 2;
    _buttonMinus.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    
    _buttonPlus.layer.cornerRadius = 4;
    _buttonPlus.layer.borderWidth = 2;
    _buttonPlus.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleTapTapGestureRecognizerEvent:)];
    [_viewMain addGestureRecognizer:tapGesture];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handleTapGesture:)];
    [_viewPopUpBelowTable addGestureRecognizer:tapGestureRecognizer];
    
    _intPlanSizeRs = 1000;
    _intPlanSizeCount = 1;
    _labelPlanSize.text = [NSString stringWithFormat:@"%d",_intPlanSizeRs*_intPlanSizeCount];
    
    [_tableViewPopUp.layer setCornerRadius:4.0f];
    [_tableViewPopUp.layer setMasksToBounds:YES];
    _tableViewPopUp.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    [self showViewAtIndex:0];
    _scrollView.scrollEnabled = NO;
    _isOnline = YES;
    _viewPANNo.hidden = YES;
    
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

- (BGPPlanRegisterDataModel *)collectDataInPaymentDetailsViewController
{
//    initial_amount;
//    initial_pay_by;
//    initial_cheque_dd_no;
//    initial_cheque_dd_no_date;
//    initial_bank_name;
//    contact_address;
//    contact_name;
//    pick_date;
//    pick_time;
//    courier_name;
//    courier_tracking;
//    transaction_id;
    
//    _dataModelBGPPlanRegister = [BGPPlanRegisterDataModel new];
    
    _dataModelBGPPlanRegister.initial_amount = _labelPlanSize.text;
    _dataModelBGPPlanRegister.initial_pay_by = _labelPaymentMode.text;

    if (_isOnline)
    {
        
    }
    else if (_isChequePickUp)
    {
        _dataModelBGPPlanRegister.initial_cheque_dd_no = _textFieldChequePickupChequeNo.text;
        _dataModelBGPPlanRegister.initial_cheque_dd_no_date = _textFieldChequePickupChequeDate.text;
        _dataModelBGPPlanRegister.initial_bank_name = _textFieldChequePickupBankName.text;
        _dataModelBGPPlanRegister.contact_address = _textFieldChequePickupAddress.text;
        _dataModelBGPPlanRegister.contact_name = _textFieldChequePickupContactPerson.text;
        _dataModelBGPPlanRegister.pick_date =_textFieldChequePickupPickupDate.text;
        _dataModelBGPPlanRegister.pick_time = _labelChequePickupAMtoPM.text;
        
    }
    else if (_isChequeSendThroughCourier)
    {
        _dataModelBGPPlanRegister.initial_cheque_dd_no = _textFieldChequeSendChequeNo.text;
        _dataModelBGPPlanRegister.initial_cheque_dd_no_date = _textFieldChequeSendChequeDate.text;
        _dataModelBGPPlanRegister.initial_bank_name = _textFieldChequeSendBankName.text;
        _dataModelBGPPlanRegister.courier_name = _textFieldCourierName.text;
        _dataModelBGPPlanRegister.courier_tracking = _textFieldCourierAWDNo.text;
        
    }
    else if (_isCashPickUp)
    {
        _dataModelBGPPlanRegister.contact_address = _textFieldCashAddress.text;
        _dataModelBGPPlanRegister.contact_name = _textFieldCashContactPerson.text;
        _dataModelBGPPlanRegister.pick_date = _textFieldCashPickupDate.text;
        _dataModelBGPPlanRegister.pick_time = _labelCashPickupAMtoPM.text;
    }
    else if (_isNEFTRTGS)
    {
        _dataModelBGPPlanRegister.transaction_id = _textFieldNEFTRTGSTransactionID.text;
    }

    
    
    return _dataModelBGPPlanRegister;
}

- (BOOL)shouldGoNextScreen
{
    return [self isValidAllTextfield];
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
    return YES;
    
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
    
    if (_isOnline)
    {
        isValidate = YES;
    }
    else if (_isChequePickUp)
    {
     
        if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldChequePickupChequeNo.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please enter Cheque No."];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldChequePickupChequeDate.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please select Cheque Date"];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldChequePickupBankName.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please enter Bank Name"];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldChequePickupAddress.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please enter Cheque Pickup Address"];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldChequePickupContactPerson.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please enter Cheque Pickup contact Person Name"];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldChequePickupPickupDate.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please enter Cheque Pickup Date"];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_labelChequePickupAMtoPM.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please Select Cheque pickup Time"];
        }
        else
        {
            isValidate = YES;
        }
        
    }
    else if (_isChequeSendThroughCourier)
    {
        
        if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldChequeSendChequeNo.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please enter Cheque No."];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldChequeSendChequeDate.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please select Cheque Date"];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldChequeSendBankName.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please enter Bank Name"];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldCourierAWDNo.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please enter Courier AWD No."];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldCourierName.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please enter Courier Name"];
        }
        else
        {
            isValidate = YES;
        }
        
        
    }
    else if (_isCashPickUp)
    {
        
        if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldCashAddress.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please enter Cash Pickup Address"];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldCashContactPerson.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please enter Cash Pickup contact Person Name"];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldCashPickupDate.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please enter Cash Pickup Date"];
        }
        else if ([Utility trimString_RemoveWhiteSpaceFromString:_labelCashPickupAMtoPM.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please Select Cash pickup Time"];
        }
        else
        {
            isValidate = YES;
        }
    }
    else if (_isNEFTRTGS)
    {
        if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldNEFTRTGSTransactionID.text].length == 0)
        {
            [Utility showAlertControllerwithMessage:@"Please Select Transection ID"];
        }
        else
        {
            isValidate = YES;
        }
    }
    
    
    
    
    
    
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
    
    if (_isDatePickerChequePickupChequeDate)
    {
        _textFieldChequePickupChequeDate.text = strDate;
    }
    else if (_isDatePickerChequePickupPickupDate)
    {
        _textFieldChequePickupPickupDate.text = strDate;
    }
    else if (_isDatePickerChequeSendThroughCourierChequeDate)
    {
        _textFieldChequeSendChequeDate.text = strDate;
    }
    else if (_isDatePickupCashPickupPickupDate)
    {
        _textFieldCashPickupDate.text = strDate;
    }
    
}



- (IBAction)buttonActionMinus:(id)sender
{
    if (_intPlanSizeCount >= 2)
    {
        _intPlanSizeCount --;
    }
    if (_intPlanSizeCount <= 18)
    {
        _layoutConstraintsViewPaymentModeTop999.priority = 999;
        _viewPANNo.hidden = YES;
    }
    _intPlanSizeRs = 1000;
    _labelPlanSize.text = [NSString stringWithFormat:@"%d",_intPlanSizeRs*_intPlanSizeCount];
    
}

- (IBAction)buttonActionPlus:(id)sender
{
    _intPlanSizeCount ++;
    _intPlanSizeRs = 1000;
    _labelPlanSize.text = [NSString stringWithFormat:@"%d",_intPlanSizeRs*_intPlanSizeCount];
    if (_intPlanSizeCount == 19)
    {
        NSLog(@"PAN No.");
        _layoutConstraintsViewPaymentModeTop999.priority = 748;
        _viewPANNo.hidden = NO;
    }
}

- (IBAction)buttonActionChequePickpChequeDate:(id)sender
{
    _viewDatePicker.hidden = NO;
    _isDatePickerChequePickupChequeDate = YES;
    _isDatePickerChequePickupPickupDate = NO;
    _isDatePickerChequeSendThroughCourierChequeDate = NO;
    _isDatePickupCashPickupPickupDate = NO;
    [_textFieldActive resignFirstResponder];
}

- (IBAction)buttonActionChequePickupPickupDate:(id)sender
{
    _viewDatePicker.hidden = NO;
    _isDatePickerChequePickupChequeDate = NO;
    _isDatePickerChequePickupPickupDate = YES;
    _isDatePickerChequeSendThroughCourierChequeDate = NO;
    _isDatePickupCashPickupPickupDate = NO;
    [_textFieldActive resignFirstResponder];
}

- (IBAction)buttonActionChequePickupAMtoPM:(id)sender
{
    _viewPopUpBelowTable.hidden = NO;
    _tableViewPopUp.hidden = NO;
    
    //    _tableViewPopUp.frame = CGRectMake(_labelReferance.frame.origin.x, _labelReferance.frame.origin.y, _labelReferance.frame.size.width - _imagaeViewDropDown.frame.size.width, (HT/15.0*(_arrayTableViewData.count)));
    
    _arrayTableViewData = _arrayChequePickupAMPM;
    _istableViewPaymentMode = NO;
    _istableViewChequePickupAMtoPM = YES;
    _istableViewCashPickupAMtoPM = NO;
    _tableViewPopUp.frame = CGRectMake(_tableViewPopUp.frame.origin.x, _labelChequePickupAMtoPM.frame.origin.y, _tableViewPopUp.frame.size.width, (HT/15.0*(_arrayTableViewData.count)));
    [_tableViewPopUp reloadData];
}

- (IBAction)buttonActionCashAMtoPM:(id)sender
{
    _viewPopUpBelowTable.hidden = NO;
    _tableViewPopUp.hidden = NO;
    
    //    _tableViewPopUp.frame = CGRectMake(_labelReferance.frame.origin.x, _labelReferance.frame.origin.y, _labelReferance.frame.size.width - _imagaeViewDropDown.frame.size.width, (HT/15.0*(_arrayTableViewData.count)));
    
    _arrayTableViewData = _arrayChequePickupAMPM;
    _istableViewPaymentMode = NO;
    _istableViewChequePickupAMtoPM = NO;
    _istableViewCashPickupAMtoPM = YES;
    _tableViewPopUp.frame = CGRectMake(_tableViewPopUp.frame.origin.x, _labelCashPickupAMtoPM.frame.origin.y, _tableViewPopUp.frame.size.width, (HT/15.0*(_arrayTableViewData.count)));
    [_tableViewPopUp reloadData];
    
}
- (IBAction)buttonActionPaymentMode:(id)sender
{
    _viewPopUpBelowTable.hidden = NO;
    _tableViewPopUp.hidden = NO;
    
    //    _tableViewPopUp.frame = CGRectMake(_labelReferance.frame.origin.x, _labelReferance.frame.origin.y, _labelReferance.frame.size.width - _imagaeViewDropDown.frame.size.width, (HT/15.0*(_arrayTableViewData.count)));
    
    _arrayTableViewData = _arrayPaymentMode;
    _istableViewPaymentMode = YES;
    _istableViewChequePickupAMtoPM = NO;
    _istableViewCashPickupAMtoPM = NO;
    _tableViewPopUp.frame = CGRectMake(_tableViewPopUp.frame.origin.x, _tableViewPopUp.frame.origin.y, _tableViewPopUp.frame.size.width, (HT/15.0*(_arrayTableViewData.count)));
    [_tableViewPopUp reloadData];
    
}

- (IBAction)datePickerAction:(id)sender
{

        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:@"dd/MM/yyyy"];
        NSString *strDate = [dateFormatter stringFromDate:_datePicker.date];
       // _labelDate.text = strDate;
    
    if (_isDatePickerChequePickupChequeDate)
    {
        _textFieldChequePickupChequeDate.text = strDate;
    }
    else if (_isDatePickerChequePickupPickupDate)
    {
        _textFieldChequePickupPickupDate.text = strDate;
    }
    else if (_isDatePickerChequeSendThroughCourierChequeDate)
    {
        _textFieldChequeSendChequeDate.text = strDate;
    }
    else if (_isDatePickupCashPickupPickupDate)
    {
        _textFieldCashPickupDate.text = strDate;
    }
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

- (IBAction)buttonActionChequeSendThroughCourierChequeDate:(id)sender
{
    _viewDatePicker.hidden = NO;
    _isDatePickerChequePickupChequeDate = NO;
    _isDatePickerChequePickupPickupDate = NO;
    _isDatePickerChequeSendThroughCourierChequeDate = YES;
    _isDatePickupCashPickupPickupDate = NO;
    [_textFieldActive resignFirstResponder];
}

- (IBAction)buttonActionCashPickupPickupDate:(id)sender
{
    _viewDatePicker.hidden = NO;
    _isDatePickerChequePickupChequeDate = NO;
    _isDatePickerChequePickupPickupDate = NO;
    _isDatePickerChequeSendThroughCourierChequeDate = NO;
    _isDatePickupCashPickupPickupDate = YES;
    [_textFieldActive resignFirstResponder];
    
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

//-(void)tableView:(UITableView *)tableView willDisplayHeaderView:(UIView *)view forSection:(NSInteger)section
//{
//    //    view.tintColor = [UIColor colorWithRed:238.0/255.0 green:238.0/255.0 blue:238.0/255.0 alpha:1];
//}
//
//-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
//{
//    return @"";
//}
//
//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
//{
//    return 0.0;
//}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return HT/15.0;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    _viewPopUpBelowTable.hidden = YES;
    _tableViewPopUp.hidden = YES;
    
    if (_istableViewPaymentMode)
    {
        _labelPaymentMode.text = [_arrayTableViewData objectAtIndex:indexPath.row];
        
        if (indexPath.row == 0)
        {
            [self showViewAtIndex:0];
            _scrollView.scrollEnabled = NO;
        }
        else if (indexPath.row == 1)
        {
            [self showViewAtIndex:1];
            _scrollView.scrollEnabled = YES;
        }
        else if (indexPath.row == 2)
        {
            [self showViewAtIndex:2];
            _scrollView.scrollEnabled = NO;
        }
        else if (indexPath.row == 3)
        {
            [self showViewAtIndex:3];
            _scrollView.scrollEnabled = NO;
        }
        else if (indexPath.row == 4)
        {
            [self showViewAtIndex:4];
            _scrollView.scrollEnabled = NO;
        }
    }
    else if (_istableViewChequePickupAMtoPM)
    {
        _labelChequePickupAMtoPM.text = [_arrayTableViewData objectAtIndex:indexPath.row];
        
        
    }
    else if (_istableViewCashPickupAMtoPM)
    {
        _labelCashPickupAMtoPM.text = [_arrayTableViewData objectAtIndex:indexPath.row];
        
        
    }
    
}


-(void)handleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer
{
    _viewPopUpBelowTable.hidden = YES;
    _tableViewPopUp.hidden = YES;
    
}

- (void)showViewAtIndex:(int)viewNumber
{
    NSLog(@"%d",viewNumber);
    _viewChequePickup.hidden = YES;
    _viewChequeSendThroughCourier.hidden = YES;
    _viewCashPickup.hidden = YES;
    _viewNEFTRTGS.hidden = YES;
    
    _isOnline = NO;
    _isChequePickUp = NO;
    _isChequeSendThroughCourier = NO;
    _isCashPickUp = NO;
    _isNEFTRTGS = NO;
    
    switch (viewNumber) {
        case 0:
            _isOnline = YES;
            break;
        case 1:
            _viewChequePickup.hidden = NO;
            _isChequePickUp = YES;
            break;
        case 2:
            _viewChequeSendThroughCourier.hidden = NO;
            _isChequeSendThroughCourier = YES;
            break;
        case 3:
            _viewCashPickup.hidden = NO;
            _isCashPickUp = YES;
            break;
        case 4:
            _viewNEFTRTGS.hidden = NO;
            _isNEFTRTGS = YES;
            break;
            
        default:
            break;
    }
    
}



@end
