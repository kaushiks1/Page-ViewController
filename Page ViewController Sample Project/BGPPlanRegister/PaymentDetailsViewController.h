//
//  PaymentDetailsViewController.h
//  BGPPlanRegister
//
//  Created by SILICON on 06/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGPPlanRegisterDataModel.h"
#import "Utility.h"

@interface PaymentDetailsViewController : UIViewController<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource>


@property (strong, nonatomic) BGPPlanRegisterDataModel *dataModelBGPPlanRegister;
@property (strong, nonatomic) UITextField *textFieldActive;
@property int intPlanSizeRs;
@property int intPlanSizeCount;
@property (strong, nonatomic) NSMutableArray *arrayTableViewData;
@property (strong, nonatomic) NSMutableArray *arrayPaymentMode;
@property (strong, nonatomic) NSMutableArray *arrayChequePickupAMPM;
@property (assign, nonatomic) BOOL isOnline;
@property (assign, nonatomic) BOOL isChequePickUp;
@property (assign, nonatomic) BOOL isChequeSendThroughCourier;
@property (assign, nonatomic) BOOL isCashPickUp;
@property (assign, nonatomic) BOOL isNEFTRTGS;
@property (assign, nonatomic) BOOL isDatePickerChequePickupChequeDate;
@property (assign, nonatomic) BOOL isDatePickerChequePickupPickupDate;
@property (assign, nonatomic) BOOL isDatePickerChequeSendThroughCourierChequeDate;
@property (assign, nonatomic) BOOL isDatePickupCashPickupPickupDate;
@property (assign, nonatomic) BOOL istableViewPaymentMode;
@property (assign, nonatomic) BOOL istableViewChequePickupAMtoPM;
@property (assign, nonatomic) BOOL istableViewCashPickupAMtoPM;


@property (weak, nonatomic) IBOutlet UIButton *buttonMinus;
@property (weak, nonatomic) IBOutlet UIButton *buttonPlus;
@property (weak, nonatomic) IBOutlet UILabel *labelPlanSize;
@property (weak, nonatomic) IBOutlet UIView *viewPANNo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPANNo;
@property (weak, nonatomic) IBOutlet UIView *viewPaymentMode;
@property (weak, nonatomic) IBOutlet UIView *viewChequePickup;
@property (weak, nonatomic) IBOutlet UIView *viewChequeSendThroughCourier;
@property (weak, nonatomic) IBOutlet UIView *viewCashPickup;
@property (weak, nonatomic) IBOutlet UIView *viewNEFTRTGS;
@property (weak, nonatomic) IBOutlet UITextField *textFieldChequePickupChequeNo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldChequePickupChequeDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldChequePickupBankName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldChequePickupAddress;
@property (weak, nonatomic) IBOutlet UITextField *textFieldChequePickupContactPerson;
@property (weak, nonatomic) IBOutlet UITextField *textFieldChequePickupPickupDate;
@property (weak, nonatomic) IBOutlet UILabel *labelChequePickupAMtoPM;
@property (weak, nonatomic) IBOutlet UITextField *textFieldChequeSendChequeNo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldChequeSendChequeDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldChequeSendBankName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCourierAWDNo;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCourierName;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCashAddress;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCashContactPerson;
@property (weak, nonatomic) IBOutlet UITextField *textFieldCashPickupDate;
@property (weak, nonatomic) IBOutlet UILabel *labelCashPickupAMtoPM;
@property (weak, nonatomic) IBOutlet UITextField *textFieldNEFTRTGSTransactionID;
@property (weak, nonatomic) IBOutlet UITableView *tableViewPopUp;
@property (weak, nonatomic) IBOutlet UIView *viewPopUpBelowTable;
@property (weak, nonatomic) IBOutlet UILabel *labelPaymentMode;
@property (weak, nonatomic) IBOutlet UIView *viewMain;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *viewDatePicker;
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;



@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layoutConstraintsViewPaymentModeTop999;




- (BGPPlanRegisterDataModel *)collectDataInPaymentDetailsViewController;
- (BOOL)shouldGoNextScreen;


- (IBAction)buttonActionMinus:(id)sender;
- (IBAction)buttonActionPlus:(id)sender;
- (IBAction)buttonActionChequePickpChequeDate:(id)sender;
- (IBAction)buttonActionChequePickupPickupDate:(id)sender;
- (IBAction)buttonActionChequePickupAMtoPM:(id)sender;
- (IBAction)buttonActionCashAMtoPM:(id)sender;
- (IBAction)buttonActionPaymentMode:(id)sender;
- (IBAction)datePickerAction:(id)sender;
- (IBAction)buttonActionChequeSendThroughCourierChequeDate:(id)sender;
- (IBAction)buttonActionCashPickupPickupDate:(id)sender;





@end
