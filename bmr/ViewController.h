//
//  ViewController.h
//  bmr
//
//  Created by Deshawn Dana on 2/17/16.
//  Copyright © 2016 Deshawn Dana. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *heightField;
@property (weak, nonatomic) IBOutlet UITextField *weightField;
@property (weak, nonatomic) IBOutlet UITextField *ageField;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;
@property (weak, nonatomic) IBOutlet UISwitch *sexSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *unitsSwitch;
@property (weak, nonatomic) IBOutlet UITextField *heightInchField;
- (IBAction)calculate:(id)sender;
- (IBAction)changeUnits:(id)sender;


@end

