//
//  ViewController.m
//  bmr
//
//  Created by Deshawn Dana on 2/17/16.
//  Copyright © 2016 Deshawn Dana. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//source online http://stackoverflow.com/questions/18756196/how-to-dismiss-keyboard-when-user-tap-other-area-outside-textfield
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)calculate:(id)sender {
    
    NSNumber* tempHeightFeet;
    NSNumber* tempHeightInch;
    NSNumber* tempWeightPound;
    float heightFeetInCM, heightInchInCM, newHeight, newWeight;
    
    //female
    if(_sexSwitch.on )
    {
        //Do not calculate if fields are empty
        if([ [self.heightField text] length] == 0 || [[self.weightField text] length] == 0 || [[self.ageField text] length] == 0)
        {
            return;
        }
        
        
        //US Metric logic
        if(self.unitsSwitch.on){
            
            //Height Logic
            //get entered height from height (ft) field
            tempHeightFeet = [NSNumber numberWithFloat: [[self.heightField text] floatValue]];
            heightFeetInCM = 30.48*[tempHeightFeet floatValue]; //30.48 is value for cm
            
            //Inch Logic
            //get inches from inch field
            tempHeightInch = [NSNumber numberWithFloat: [[self.heightInchField text] floatValue]];
            heightInchInCM = 2.54*[tempHeightInch floatValue];
            newHeight = heightFeetInCM + heightInchInCM;    //total value in cm
            
            //Weight Logic
            //get lbs from lbs field
            tempWeightPound = [NSNumber numberWithFloat: [[self.weightField text] floatValue]];
            newWeight = 0.453592*[tempWeightPound floatValue];   //total value in kg
            
            //convert height & weight from float to NSNumber
            NSNumber* heightConverted = [NSNumber numberWithFloat: newHeight];
            NSNumber* weightConverted = [NSNumber numberWithFloat: newWeight];
            
            //talking to model, setting information into model data (Person.h)
            [[Person sharedPersonInstance] setHeight: heightConverted];
            [[Person sharedPersonInstance] setWeight: weightConverted];
            
        }
        else //(self.unitsSwitch.on == NO)
        {
            //talking to model, setting information into model data (Person.h)
            [[Person sharedPersonInstance] setHeight: [NSNumber numberWithFloat: [[self.heightField text] floatValue]]];
            [[Person sharedPersonInstance] setWeight: [NSNumber numberWithFloat: [[self.weightField text] floatValue]]];
        }
        
        [[Person sharedPersonInstance] setAge: [NSNumber numberWithFloat: [[self.ageField text] floatValue]]];
        
        //calls model class to calculate bmr
        float results = [[Person sharedPersonInstance] calculateFemaleBMR];
        
        //display results
        self.resultsLabel.text = [NSString stringWithFormat:@"BMR: %.01f", results];
        
    }
    //male
    else{
        //Do not calculate if fields are empty
        if([ [self.heightField text] length] == 0 || [[self.weightField text] length] == 0 || [[self.ageField text] length] == 0)
        {
            return;
        }
        
        //US Metric logic
        if(_unitsSwitch.on){
            
            //Height Logic
            //get entered height from height (ft) field
            tempHeightFeet = [NSNumber numberWithFloat: [[self.heightField text] floatValue]];
            heightFeetInCM = 30.48*[tempHeightFeet floatValue]; //30.48 is value for cm
            
            //Inch Logic
            //get inches from inch field
            tempHeightInch = [NSNumber numberWithFloat: [[self.heightInchField text] floatValue]];
            heightInchInCM = 2.54*[tempHeightInch floatValue];
            newHeight = heightFeetInCM + heightInchInCM;    //total value in cm
            
            //Weight Logic
            //get lbs from lbs field
            tempWeightPound = [NSNumber numberWithFloat: [[self.weightField text] floatValue]];
            newWeight = 0.453592*[tempWeightPound floatValue];   //total value in kg
            
            //convert height & weight from float to NSNumber
            NSNumber* heightConverted = [NSNumber numberWithFloat: newHeight];
            NSNumber* weightConverted = [NSNumber numberWithFloat: newWeight];
            
            //talking to model, setting information into model data (Person.h)
            [[Person sharedPersonInstance] setHeight: heightConverted];
            [[Person sharedPersonInstance] setWeight: weightConverted];
        }
        else //(_unitsSwitch.on == NO)
        {
            //talking to model, setting information into model data (Person.h)
            [[Person sharedPersonInstance] setHeight: [NSNumber numberWithFloat: [[self.heightField text] floatValue]]];
            [[Person sharedPersonInstance] setWeight: [NSNumber numberWithFloat: [[self.weightField text] floatValue]]];
        }

        
        //talking to model, setting information into model data (Person.h)
        [[Person sharedPersonInstance] setAge: [NSNumber numberWithFloat: [[_ageField text] floatValue]]];
        
        float results = [[Person sharedPersonInstance] calculateMaleBMR];
        
        //display results
        self.resultsLabel.text = [NSString stringWithFormat:@"BMR: %.01f", results];
        
    }
    
}

- (IBAction)changeUnits:(id)sender {
    //on switch = us metric
    if(self.unitsSwitch.on)
    {
        self.heightField.placeholder = @"ft";
        self.heightField.text = @"";
        self.weightField.placeholder = @"lbs";
        self.weightField.text = @"";
        self.heightInchField.placeholder = @"inch";
        self.heightInchField.text = @"";
        self.ageField.text = @"";
        self.resultsLabel.text = [NSString stringWithFormat:@""];
        
    }
    else //off switch = world metric
    {
        self.heightField.placeholder = @"cm";
        self.heightField.text = @"";
        self.weightField.placeholder = @"kg";
        self.weightField.text = @"";
        self.heightInchField.placeholder = @"disabled";
        self.heightInchField.text = @"";
        self.ageField.text = @"";
        self.resultsLabel.text = [NSString stringWithFormat:@""];
    }
    
}

@end
