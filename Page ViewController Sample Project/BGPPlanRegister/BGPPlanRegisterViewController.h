//
//  BGPPlanRegisterViewController.h
//  BGPPlanRegister
//
//  Created by SILICON on 05/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalDetailsViewController.h"
#import "ApplicationDetailsViewController.h"
#import "NominationDetailsViewController.h"
#import "AgreemnetDetailsViewController.h"
#import "PaymentDetailsViewController.h"
#import "BGPPlanRegisterDataModel.h"

@protocol bGPPlanRegisterViewControllerDelegate <NSObject>

- (void)collectDataAndPassDataIFromPersonalDetailsViewControllerToApplicationDetailsViewControllerDictionaryData:(NSDictionary *)dictionaryData;

@end

@interface BGPPlanRegisterViewController : UIViewController <UIPageViewControllerDelegate,UIPageViewControllerDataSource>

@property (nonatomic, assign) int integerViewControllerIndex;
@property (strong, nonatomic) UIPageViewController *pageViewController;
@property (weak, nonatomic) UIPageControl *pageControl;
@property (strong, nonatomic) NSArray *viewControllers;
@property (strong, nonatomic) BGPPlanRegisterDataModel *dataModelBGPPlanRegister;

@property (strong, nonatomic) PersonalDetailsViewController *personalDetailsViewControllerObj;
@property (strong, nonatomic) ApplicationDetailsViewController *applicationDetailsViewControllerObj;
@property (strong, nonatomic) NominationDetailsViewController *nominationDetailsViewControllerObj;
@property (strong, nonatomic) AgreemnetDetailsViewController *agreemnetDetailsViewControllerObj;
@property (strong, nonatomic) PaymentDetailsViewController *paymentDetailsViewControllerObj;
@property (nonatomic, weak) id<bGPPlanRegisterViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIView *viewProgressFirst;
@property (weak, nonatomic) IBOutlet UIView *viewProgressSecond;
@property (weak, nonatomic) IBOutlet UIView *viewProgressThird;
@property (weak, nonatomic) IBOutlet UIView *viewProgressFourth;
@property (weak, nonatomic) IBOutlet UIView *viewProgressFifth;
@property (weak, nonatomic) IBOutlet UIView *viewPageContainer;
@property (weak, nonatomic) IBOutlet UILabel *labelDetails;
@property (weak, nonatomic) IBOutlet UIButton *buttonPrevious;
@property (weak, nonatomic) IBOutlet UIButton *buttonNext;
@property (weak, nonatomic) IBOutlet UIButton *buttonSubmit;




- (IBAction)buttonActionPrevious:(id)sender;
- (IBAction)buttonActionNext:(id)sender;
- (IBAction)buttonActionSubmit:(id)sender;




@end
