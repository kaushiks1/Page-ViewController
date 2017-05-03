//
//  PersonalDetailViewController.h
//  BGPPlanRegister
//
//  Created by SILICON on 06/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Constant.h"
#import "Utility.h"
#import "BGPPlanRegisterDataModel.h"

@interface PersonalDetailsViewController : UIViewController<UITextFieldDelegate>


@property (strong, nonatomic) BGPPlanRegisterDataModel *dataModelBGPPlanRegister;
@property (strong, nonatomic) UITextField *textFieldActive;


@property (weak, nonatomic) IBOutlet UIButton *buttonMale;
@property (weak, nonatomic) IBOutlet UIButton *buttonFemale;
@property (weak, nonatomic) IBOutlet UITextField *textFieldName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmailID;
@property (weak, nonatomic) IBOutlet UITextField *textFieldMobileNumber;
@property (weak, nonatomic) IBOutlet UILabel *labelDate;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIView *viewDatePicker;




- (BGPPlanRegisterDataModel *)collectDataInPersonalDetailsViewController;
- (BOOL)shouldGoNextScreen;

- (IBAction)buttonActionMale:(id)sender;
- (IBAction)buttonActionFemale:(id)sender;
- (IBAction)buttonActionDate:(id)sender;
- (IBAction)datePickerAction:(id)sender;




@end
