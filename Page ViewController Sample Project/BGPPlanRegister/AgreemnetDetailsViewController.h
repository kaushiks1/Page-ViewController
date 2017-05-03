//
//  AgreemnetDetailsViewController.h
//  BGPPlanRegister
//
//  Created by SILICON on 06/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BGPPlanRegisterDataModel.h"
#import "Utility.h"

@interface AgreemnetDetailsViewController : UIViewController


@property (strong, nonatomic) BGPPlanRegisterDataModel *dataModelBGPPlanRegister;
@property (strong, nonatomic) UITextField *textFieldActive;


@property (weak, nonatomic) IBOutlet UIButton *buttonAcceptTC;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDate;
@property (weak, nonatomic) IBOutlet UITextField *textFieldPlace;
@property (weak, nonatomic) IBOutlet UIView *viewAcceptTC;
@property (weak, nonatomic) IBOutlet UIView *viewIProposeTo;
@property (weak, nonatomic) IBOutlet UIView *viewDate;
@property (weak, nonatomic) IBOutlet UIButton *buttonShowTC;
@property (weak, nonatomic) IBOutlet UIView *viewMain;




@property (weak, nonatomic) IBOutlet NSLayoutConstraint *layoutConstraintsViewDateTop999;



- (BGPPlanRegisterDataModel *)collectDataInAgreemnetDetailsViewController;
- (BOOL)shouldGoNextScreen;


- (IBAction)buttonActionAcceptTC:(id)sender;
- (IBAction)buttonActionShowTC:(id)sender;







@end
