/**
 *  Utility validate field test controller.
 *
 *  Copyright (c) 2015-17 Wiregrass Cloud Technology 
 */
public with sharing class UtilityValidateFieldTestController {

    public String emailAddress { get; set; }
    public String emailAddressValid { get; set; }
    public String ssn { get; set; }
    public String ssnValid { get; set; }
    public String stateCode { get; set; }
    public String stateCodeValid { get; set; }
    public String telephoneNumber { get; set; }
    public String telephoneNumberValid { get; set; }
    public String zipCodeNumber { get; set; }
    public String zipCodeNumberValid { get; set; }
    public String numericField { get; set; }
    public String numericFieldValid { get; set; }

    public PageReference reset() {
        emailAddress = '';
        emailAddressValid = '';
        ssn = '';
        ssnValid = '';
        stateCode = '';
        stateCodeValid = '';
        telephoneNumber = '';
        telephoneNumberValid = '';
        zipCodeNumber = '';
        zipCodeNumberValid = '';
        numericField = '';
        numericFieldValid = '';
        return null;
    }

    public PageReference validate() {
        ValidateValues();
        return null;
    }

    private void ValidateValues() {
        UtilityValidateField validateField = new UtilityValidateField();

        if (validateField.emailAddress(emailAddress)) {
            emailAddressValid = 'true';
        }
        else {
            emailAddressValid = 'false';
        }
        if (validateField.ssn(ssn)) {
            ssnValid = 'true';
        }
        else {
            ssnValid = 'false';
        }
        if (validateField.stateCode(stateCode)) {
            stateCodeValid = 'true';
        }
        else {
            stateCodeValid = 'false';
        }
        if (validateField.telephoneNumber(telephoneNumber)) {
            telephoneNumberValid = 'true';
        }
        else {
            telephoneNumberValid = 'false';
        }
        if (validateField.zipCodeNumber(zipCodeNumber)) {
            zipCodeNumberValid = 'true';
        }
        else {
            zipCodeNumberValid = 'false';
        }
        if (validateField.isNumeric(numericField)) {
            numericFieldValid = 'true';
        }
        else {
            numericFieldValid = 'false';
        }
    }
}