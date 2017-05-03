//
//  ApplicationDetailsViewController.h
//  BGPPlanRegister
//
//  Created by SILICON on 08/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGPPlanRegisterDataModel.h"
#import "Utility.h"

@interface ApplicationDetailsViewController : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,UIAlertViewDelegate>


@property (strong, nonatomic) BGPPlanRegisterDataModel *dataModelBGPPlanRegister;
@property (strong, nonatomic) UITextField *textFieldActive;
@property (strong, nonatomic) NSMutableArray *arrayTableViewData;
@property (strong, nonatomic) NSString *stringFulfilment;
@property (strong, nonatomic) NSString *stringLeadSourceOther;
@property (assign, nonatomic) BOOL isReferanceDefault;
@property (assign, nonatomic) BOOL isReferanceOther;


@property (weak, nonatomic) IBOutlet UIButton *buttonDimonsJewellery;
@property (weak, nonatomic) IBOutlet UIButton *buttonGoldJewellery;
@property (weak, nonatomic) IBOutlet UIButton *buttonGoldPendent;
@property (weak, nonatomic) IBOutlet UITextField *textFieldReferalID;
@property (weak, nonatomic) IBOutlet UILabel *labelReferance;
@property (weak, nonatomic) IBOutlet UITextField *textFieldMailingAddress;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCity;
@property (weak, nonatomic) IBOutlet UITextField *textFieldState;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLandmark;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDistrict;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCountry;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPinCode;
@property (weak, nonatomic) IBOutlet UITextField *textFieldLandLine;
@property (weak, nonatomic) IBOutlet UITextField *textFieldOfficeNumber;
@property (weak, nonatomic) IBOutlet UITextField *textFieldMobileNumber;
@property (weak, nonatomic) IBOutlet UITextField *textFieldEmailID;
@property (weak, nonatomic) IBOutlet UIButton *buttonIAgree;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *viewPopUpBelowTable;
@property (weak, nonatomic) IBOutlet UITableView *tableViewPopUp;
@property (weak, nonatomic) IBOutlet UIImageView *imagaeViewDropDown;
@property (weak, nonatomic) IBOutlet UIView *viewMain;






- (BGPPlanRegisterDataModel *)collectDataInApplicationDetailsViewController;
- (BOOL)shouldGoNextScreen;


- (IBAction)buttonActionDimondJewellery:(id)sender;
- (IBAction)buttonActionGoldJewellery:(id)sender;
- (IBAction)buttonActionGoldPendent:(id)sender;
- (IBAction)buttonActionReferance:(id)sender;
- (IBAction)buttonActionIAgree:(id)sender;




@end
