//
//  NominationDetailsViewController.h
//  BGPPlanRegister
//
//  Created by SILICON on 06/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGPPlanRegisterDataModel.h"
#import "Utility.h"


@interface NominationDetailsViewController : UIViewController<UITextFieldDelegate>

@property (strong, nonatomic) BGPPlanRegisterDataModel *dataModelBGPPlanRegister;
@property (strong, nonatomic) UITextField *textFieldActive;


@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldRelationshipWithApplicant;
@property (weak, nonatomic) IBOutlet UIButton *buttonAddressSame;
@property (weak, nonatomic) IBOutlet UITextField *textFieldAddress;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCity;
@property (weak, nonatomic) IBOutlet UITextField *textFieldState;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPincode;
@property (weak, nonatomic) IBOutlet UIView *viewDatePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;



- (BGPPlanRegisterDataModel *)collectDataInNominationDetailsViewController;
- (BOOL)shouldGoNextScreen;

- (IBAction)buttonActionDate:(id)sender;
- (IBAction)buttonActionAddressSame:(id)sender;
- (IBAction)datePickerAction:(id)sender;




@end
