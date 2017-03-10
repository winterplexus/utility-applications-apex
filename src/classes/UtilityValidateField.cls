/**
 *  Utility validate field class.
 *
 *  Copyright (c) 2015-17 Wiregrass Cloud Technology 
 */
global with sharing class UtilityValidateField {

    global Boolean isNumeric(String numeric) {
        if (numeric == null || String.isEmpty(numeric)) {
            return false;
        }

        String regex = '^[0-9]+$';
        Pattern numericPattern = Pattern.Compile(regex);
        Matcher numericMatcher = numericPattern.matcher(numeric);

        if (numericMatcher.Matches()){
            return true;
        }
        return false;
    }

    global Boolean emailAddress(String emailAddress) {
        if (emailAddress == null || String.isEmpty(emailAddress)) {
            return false;
        }

        String regex = '^[_A-Za-z0-9-+]+(\\.[_A-Za-z0-9-+]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$';
        Pattern emailAddressPattern = Pattern.compile(regex);
        Matcher emailAddressMatcher = emailAddressPattern.matcher(emailAddress);

        if (!emailAddressMatcher.matches()) {
            return false;
        }
        return true;
    }    

    global Boolean ssn(String ssn) {
        if (ssn == null || String.isEmpty(ssn)) {
            return false;
        }

        String regex = '^((?!000)(?!666)(?:[0-6]\\d{2}|7[0-2][0-9]|73[0-3]|7[5-6][0-9]|77[0-2]))-((?!00)\\d{2})-((?!0000)\\d{4})$';
        Pattern ssnPattern = Pattern.compile(regex);
        Matcher ssnMatcher = ssnPattern.matcher(ssn);

        if (!ssnMatcher.matches()) {
            return false;
        }
        return true;
    }

    global Boolean stateCode(String stateCode) {   
        if (stateCode == null || String.isEmpty(stateCode)) {
            return false;
        }

        String regex = '^((AL)|(AK)|(AS)|(AZ)|(AR)|(CA)|(CO)|(CT)|(DE)|(DC)|(FM)|(FL)|(GA)|(GU)|(HI)|(ID)|(IL)|(IN)|(IA)|(KS)|(KY)|(LA)|(ME)|(MH)|(MD)|(MA)|(MI)|(MN)|(MS)|(MO)|(MT)|(NE)|(NV)|(NH)|(NJ)|(NM)|(NY)|(NC)|(ND)|(MP)|(OH)|(OK)|(OR)|(PW)|(PA)|(PR)|(RI)|(SC)|(SD)|(TN)|(TX)|(UT)|(VT)|(VI)|(VA)|(WA)|(WV)|(WI)|(WY))$';
        Pattern stateCodePattern = Pattern.compile(regex);
        Matcher stateCodeMatcher = stateCodePattern.matcher(stateCode);

        if (!stateCodeMatcher.matches()) {
            return false;
        }
        return true;
    }

    global Boolean telephoneNumber(String telephoneNumber) {
        if (telephoneNumber == null || String.isEmpty(telephoneNumber)) {
            return false;
        }

        String regex = '^\\(\\d{3}\\) ?\\d{3}( |-)?\\d{4}|^\\d{3}( |-)?\\d{3}( |-)?\\d{4}';
        Pattern telephoneNumberPattern = Pattern.compile(regex);
        Matcher telephoneNumberMatcher = telephoneNumberPattern.matcher(telephoneNumber);

        if (!telephoneNumberMatcher.matches()) {
            return false;
        }
        return true;
    }

    global Boolean zipCodeNumber(String zipCodeNumber) {
        if (zipCodeNumber == null || String.isEmpty(zipCodeNumber)) {
            return false;
        }

        String regex = '^[0-9]{5}([- /]?[0-9]{4})?$'; 
        Pattern zipCodePattern = Pattern.compile(regex);
        Matcher zipCodeMatcher = zipCodePattern.matcher(zipCodeNumber);

        if (!zipCodeMatcher.matches()) {
            return false;
        }
        return true;
    }
}