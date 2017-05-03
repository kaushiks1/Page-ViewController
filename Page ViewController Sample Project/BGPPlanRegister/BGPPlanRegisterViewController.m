//
//  BGPPlanRegisterViewController.m
//  BGPPlanRegister
//
//  Created by SILICON on 05/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import "BGPPlanRegisterViewController.h"

@interface BGPPlanRegisterViewController ()

@end

@implementation BGPPlanRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataModelBGPPlanRegister = [BGPPlanRegisterDataModel new];
    _dataModelBGPPlanRegister.Auth_Token = @"USA";
    // Create page view controller
    self.pageViewController = [[UIPageViewController alloc] initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll
                                                              navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil];
    [self.pageViewController.view setFrame:[_viewPageContainer bounds]];
    self.pageViewController.dataSource = self;
    self.pageViewController.delegate = self;
    
    _personalDetailsViewControllerObj = [[UIStoryboard storyboardWithName:@"BGPPlanRegisterStoryboard" bundle:nil]instantiateViewControllerWithIdentifier:@"PersonalDetailsViewController"];
    _personalDetailsViewControllerObj.dataModelBGPPlanRegister = _dataModelBGPPlanRegister;
//    _personalDetailsViewControllerObj.dataModelBGPPlanRegister = (BGPPlanRegisterDataModel *) @{@"Name": @"BGPPlanRegisterViewController"};
    
    _applicationDetailsViewControllerObj = [[UIStoryboard storyboardWithName:@"BGPPlanRegisterStoryboard" bundle:nil]instantiateViewControllerWithIdentifier:@"ApplicationDetailsViewController"];
    
    _nominationDetailsViewControllerObj = [[UIStoryboard storyboardWithName:@"BGPPlanRegisterStoryboard" bundle:nil]instantiateViewControllerWithIdentifier:@"NominationDetailsViewController"];
    
    _agreemnetDetailsViewControllerObj = [[UIStoryboard storyboardWithName:@"BGPPlanRegisterStoryboard" bundle:nil]instantiateViewControllerWithIdentifier:@"AgreemnetDetailsViewController"];
    
    _paymentDetailsViewControllerObj = [[UIStoryboard storyboardWithName:@"BGPPlanRegisterStoryboard" bundle:nil]instantiateViewControllerWithIdentifier:@"PaymentDetailsViewController"];
    
    
    _viewControllers = [NSArray arrayWithObjects:_personalDetailsViewControllerObj, _applicationDetailsViewControllerObj, _nominationDetailsViewControllerObj, _agreemnetDetailsViewControllerObj, _paymentDetailsViewControllerObj, nil];
    
    
    _integerViewControllerIndex = 0;
    NSArray *tutorialViews = @[[self viewControllerAtIndex:_integerViewControllerIndex]];
    [self.pageViewController setViewControllers:tutorialViews direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    
    
    
    [self addChildViewController:_pageViewController];
    [self.viewPageContainer addSubview:_pageViewController.view];
    [self.pageViewController didMoveToParentViewController:self];
    
    _buttonPrevious.hidden = YES;
    _buttonSubmit.hidden = YES;
    [self viewProgressHeighlightNumber:0];
    // Do any additional setup after loading the view.
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

- (IBAction)buttonActionPrevious:(id)sender {
    
    if (_integerViewControllerIndex == 1)
    {
        _buttonPrevious.hidden = YES;
    }
    
    if (_integerViewControllerIndex == 4) {
        _buttonNext.hidden = NO;
        _buttonSubmit.hidden = YES;
    }
    
    if (_integerViewControllerIndex >= 1) {
        
        _integerViewControllerIndex --;
        [self viewProgressHeighlightNumber:_integerViewControllerIndex];
        NSArray *tutorialViews = @[[self viewControllerAtIndex:_integerViewControllerIndex]];
        [self.pageViewController setViewControllers:tutorialViews direction:UIPageViewControllerNavigationDirectionReverse animated:NO completion:nil];
        
    }
    
}

- (IBAction)buttonActionNext:(id)sender {
    
    
    if (_integerViewControllerIndex == 0)
    {
        if (![_personalDetailsViewControllerObj shouldGoNextScreen])
        {
            return;
        }
        _buttonPrevious.hidden = NO;
        _dataModelBGPPlanRegister = [_personalDetailsViewControllerObj collectDataInPersonalDetailsViewController];
        _applicationDetailsViewControllerObj.dataModelBGPPlanRegister = _dataModelBGPPlanRegister;
    }
    else if (_integerViewControllerIndex == 1)
    {
        if (![_applicationDetailsViewControllerObj shouldGoNextScreen])
        {
            return;
        }
        _dataModelBGPPlanRegister = [_applicationDetailsViewControllerObj collectDataInApplicationDetailsViewController];
        _nominationDetailsViewControllerObj.dataModelBGPPlanRegister =  _dataModelBGPPlanRegister;
    }
    else if (_integerViewControllerIndex == 2)
    {
        if (![_nominationDetailsViewControllerObj shouldGoNextScreen])
        {
            return;
        }
        _dataModelBGPPlanRegister = [_nominationDetailsViewControllerObj collectDataInNominationDetailsViewController];
        _agreemnetDetailsViewControllerObj.dataModelBGPPlanRegister = _dataModelBGPPlanRegister;
    }
    else if (_integerViewControllerIndex == 3)
    {
        if (![_agreemnetDetailsViewControllerObj shouldGoNextScreen])
        {
            return;
        }
        _dataModelBGPPlanRegister = [_agreemnetDetailsViewControllerObj collectDataInAgreemnetDetailsViewController];
        _paymentDetailsViewControllerObj.dataModelBGPPlanRegister = _dataModelBGPPlanRegister;
        _buttonSubmit.hidden = NO;
        _buttonNext.hidden = YES;
        
    }
    else if (_integerViewControllerIndex == 4)
    {
        if (![_paymentDetailsViewControllerObj shouldGoNextScreen])
        {
            return;
        }
        _dataModelBGPPlanRegister = [_paymentDetailsViewControllerObj collectDataInPaymentDetailsViewController];
        NSLog(@"%@",[Utility descriptionForObject:_dataModelBGPPlanRegister]);
        
    }
    
    
    
    
    if (_integerViewControllerIndex <= 3) {
        
        _integerViewControllerIndex ++;
        [self viewProgressHeighlightNumber:_integerViewControllerIndex];
        NSArray *viewControllersView = @[[self viewControllerAtIndex:_integerViewControllerIndex]];
        [self.pageViewController setViewControllers:viewControllersView direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
    }
    
}

- (IBAction)buttonActionSubmit:(id)sender {
}


- (UIViewController *)viewControllerAtIndex:(NSUInteger)index
{
    // Create a new view controller and pass suitable data.
    
    UIViewController *viewController = nil;
    if (index == 0)
    {
        viewController = _personalDetailsViewControllerObj;
        _labelDetails.text = @"Personal Details";
    }
    else if (index == 1)
    {
        viewController = _applicationDetailsViewControllerObj;
        _labelDetails.text = @"Application Details";
    }
    else if (index == 2)
    {
        viewController = _nominationDetailsViewControllerObj;
        _labelDetails.text = @"Nomination Details";
    }
    else if (index == 3)
    {
        viewController = _agreemnetDetailsViewControllerObj;
        _labelDetails.text = @"Agreement Details";
    }
    else if (index == 4)
    {
        viewController = _paymentDetailsViewControllerObj;
        _labelDetails.text = @"Payment Details";
    }
    
    return viewController;
}


#pragma mark - Page View Controller Data Source
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController{
//
//    if ([viewController isKindOfClass:[PersonalDetailsViewController class]]) {
//        return  [self viewControllerAtIndex:1];
//    }
//    else if ([viewController isKindOfClass:[ApplicationDetailsViewController class]])
//    {
//        return [self viewControllerAtIndex:2];
//    }
//    else
//    {
//        return nil;
//    }
//
//}
//
//- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController{
//
//    if ([viewController isKindOfClass:[NominationDetailsViewController class]]) {
//        return  [self viewControllerAtIndex:2];
//    }
//    else if ([viewController isKindOfClass:[ApplicationDetailsViewController class]]){
//        return [self viewControllerAtIndex:1];
//    }
//    else{
//        return nil;
//    }
//
//}

- (NSInteger)presentationCountForPageViewController:(UIPageViewController *)pageViewController
{
    //    For show Page Indicator
    //    return [self.pageTitles count];
    //    return 3;
    return 0;
}

- (NSInteger)presentationIndexForPageViewController:(UIPageViewController *)pageViewController
{
    return 0;
}



// called before the transition starts
- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray<UIViewController *> *)pendingViewControllers
{
    NSLog(@"willTransitionToViewControllers");
}

// called after the transition is finished
- (void)pageViewController:(UIPageViewController *)pageViewController didFinishAnimating:(BOOL)finished previousViewControllers:(NSArray<UIViewController *> *)previousViewControllers transitionCompleted:(BOOL)completed
{
    NSLog(@"transitionCompleted");
}



- (void)collectDataInApplicationDetailsViewControllerDictionaryData:(NSDictionary *)dictionaryData
{
    NSLog(@"%@",dictionaryData);
}


- (void)viewProgressHeighlightNumber:(int)viewNumber
{
    NSLog(@"%d",viewNumber);

    if (viewNumber == 0) {
        _viewProgressFirst.backgroundColor = [UIColor colorWithRed:251/255.0 green:195/255.0 blue:0/255.0 alpha:1];
        _viewProgressSecond.backgroundColor = [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1];
        _viewProgressThird.backgroundColor = [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1];
        _viewProgressFourth.backgroundColor = [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1];
        _viewProgressFifth.backgroundColor = [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1];
    }
    else if (viewNumber == 1)
    {
        _viewProgressFirst.backgroundColor = [UIColor colorWithRed:145/255.0 green:202/255.0 blue:65/255.0 alpha:1];
        _viewProgressSecond.backgroundColor = [UIColor colorWithRed:251/255.0 green:195/255.0 blue:0/255.0 alpha:1];
        _viewProgressThird.backgroundColor = [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1];
        _viewProgressFourth.backgroundColor = [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1];
        _viewProgressFifth.backgroundColor = [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1];
    }
    else if (viewNumber == 2)
    {
        _viewProgressFirst.backgroundColor = [UIColor colorWithRed:145/255.0 green:202/255.0 blue:65/255.0 alpha:1];
        _viewProgressSecond.backgroundColor = [UIColor colorWithRed:145/255.0 green:202/255.0 blue:65/255.0 alpha:1];
        _viewProgressThird.backgroundColor = [UIColor colorWithRed:251/255.0 green:195/255.0 blue:0/255.0 alpha:1];
        _viewProgressFourth.backgroundColor = [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1];
        _viewProgressFifth.backgroundColor = [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1];
    }
    else if (viewNumber == 3)
    {
        _viewProgressFirst.backgroundColor = [UIColor colorWithRed:145/255.0 green:202/255.0 blue:65/255.0 alpha:1];
        _viewProgressSecond.backgroundColor = [UIColor colorWithRed:145/255.0 green:202/255.0 blue:65/255.0 alpha:1];
        _viewProgressThird.backgroundColor = [UIColor colorWithRed:145/255.0 green:202/255.0 blue:65/255.0 alpha:1];
        _viewProgressFourth.backgroundColor = [UIColor colorWithRed:251/255.0 green:195/255.0 blue:0/255.0 alpha:1];
        _viewProgressFifth.backgroundColor = [UIColor colorWithRed:196/255.0 green:196/255.0 blue:196/255.0 alpha:1];
    }
    else if (viewNumber == 4)
    {
        _viewProgressFirst.backgroundColor = [UIColor colorWithRed:145/255.0 green:202/255.0 blue:65/255.0 alpha:1];
        _viewProgressSecond.backgroundColor = [UIColor colorWithRed:145/255.0 green:202/255.0 blue:65/255.0 alpha:1];
        _viewProgressThird.backgroundColor = [UIColor colorWithRed:145/255.0 green:202/255.0 blue:65/255.0 alpha:1];
        _viewProgressFourth.backgroundColor = [UIColor colorWithRed:145/255.0 green:202/255.0 blue:65/255.0 alpha:1];
        _viewProgressFifth.backgroundColor = [UIColor colorWithRed:251/255.0 green:195/255.0 blue:0/255.0 alpha:1];
    }
    
}


-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];// this will do the trick
}

@end
