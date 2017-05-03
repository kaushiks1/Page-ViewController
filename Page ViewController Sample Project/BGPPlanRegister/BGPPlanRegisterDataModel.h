//
//  BGPPlanRegisterDataModel.h
//  BGPPlanRegister
//
//  Created by SILICON on 12/08/16.
//  Copyright © 2016 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BGPPlanRegisterDataModel : NSObject

@property (strong, nonatomic)NSString *Auth_Token;
@property (strong, nonatomic)NSString *applicant_name;
@property (strong, nonatomic)NSString *applicant_gender;
@property (strong, nonatomic)NSString *contact_email;
@property (strong, nonatomic)NSString *contact_mobile;
@property (strong, nonatomic)NSString *applicant_dob;
@property (strong, nonatomic)NSString *fulfilment;
@property (strong, nonatomic)NSString *partner_code;
@property (strong, nonatomic)NSString *lead_source;
@property (strong, nonatomic)NSString *lead_source_other;
@property (strong, nonatomic)NSString *mailing_address;
@property (strong, nonatomic)NSString *mailing_city;
@property (strong, nonatomic)NSString *mailing_state;
@property (strong, nonatomic)NSString *mailing_landmark;
@property (strong, nonatomic)NSString *mailing_district;
@property (strong, nonatomic)NSString *mailing_country;
@property (strong, nonatomic)NSString *mailing_pincode;
@property (strong, nonatomic)NSString *contact_phone_residence;
@property (strong, nonatomic)NSString *contact_phone_office;
@property (strong, nonatomic)NSString *nomination_name;
@property (strong, nonatomic)NSString *nomination_dob;
@property (strong, nonatomic)NSString *nomination_applicant_realtion;
@property (strong, nonatomic)NSString *nomination_address;
@property (strong, nonatomic)NSString *nomination_city;
@property (strong, nonatomic)NSString *nomination_state;
@property (strong, nonatomic)NSString *nomination_pincode;
@property (strong, nonatomic)NSString *declaration_date;
@property (strong, nonatomic)NSString *declaration_place;
@property (strong, nonatomic)NSString *initial_amount;
@property (strong, nonatomic)NSString *initial_pay_by;
@property (strong, nonatomic)NSString *initial_cheque_dd_no;
@property (strong, nonatomic)NSString *initial_cheque_dd_no_date;
@property (strong, nonatomic)NSString *initial_bank_name;
@property (strong, nonatomic)NSString *contact_address;
@property (strong, nonatomic)NSString *contact_name;
@property (strong, nonatomic)NSString *pick_date;
@property (strong, nonatomic)NSString *pick_time;
@property (strong, nonatomic)NSString *courier_name;
@property (strong, nonatomic)NSString *courier_tracking;
@property (strong, nonatomic)NSString *transaction_id;






@property (strong, nonatomic)NSString *applicant_guardian_name;
@property (strong, nonatomic)NSString *applicant_guardian_relationship;
@property (strong, nonatomic)NSString *applicant_guardian_relationship_other;







@end
