//
//  AgreemnetDetailsViewController.m
//  BGPPlanRegister
//
//  Created by SILICON on 06/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "AgreemnetDetailsViewController.h"

@interface AgreemnetDetailsViewController ()

@end

@implementation AgreemnetDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@",[Utility descriptionForObject:_dataModelBGPPlanRegister]);

    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(handleTapTapGestureRecognizerEvent:)];
    [self.view addGestureRecognizer:tapGesture];
    

    _viewIProposeTo.hidden = YES;
    
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

- (BGPPlanRegisterDataModel *)collectDataInAgreemnetDetailsViewController
{
//    declaration_date;
//    declaration_place;
    
    _dataModelBGPPlanRegister.declaration_date = _textFieldDate.text;
    _dataModelBGPPlanRegister.declaration_place = _textFieldPlace.text;
    
    return _dataModelBGPPlanRegister;
}

- (BOOL)shouldGoNextScreen
{
    BOOL canGoNextScreen = NO;
    
    if ([self isValidAllTextfield])
    {
        if (_buttonAcceptTC.selected)
        {
            canGoNextScreen = YES;
        }
        else
        {
            [Utility showAlertControllerwithMessage:@"Kindly accept the agreement"];
        }
        
    }
    
    
    return canGoNextScreen;
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
    
    if ([Utility trimString_RemoveWhiteSpaceFromString:_textFieldPlace.text].length == 0) {
        [Utility showAlertControllerwithMessage:@"Please Enter Place"];
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
    
}

- (IBAction)buttonActionAcceptTC:(id)sender
{
    _buttonAcceptTC.selected = !_buttonAcceptTC.selected;
}

- (IBAction)buttonActionShowTC:(id)sender
{
    _buttonShowTC.selected = !_buttonShowTC.selected;

    if (_buttonShowTC.selected)
    {
        _layoutConstraintsViewDateTop999.priority = 748;
        _viewIProposeTo.hidden = NO;
    }
    else
    {
        _layoutConstraintsViewDateTop999.priority = 999;
        _viewIProposeTo.hidden = YES;
    }
   

}



@end
