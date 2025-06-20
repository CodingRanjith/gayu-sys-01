## LeadSumit Request Mapping Details

{
"leadDetails": {
"typeOfLoan": "6" // ProductScheme -> optionValue
},
"chooseProduct": {
"mainCategory": "1", // ProductMaster -> MainCategoryMaster -> lsfFacId
"subCategory": "426", // ProductMaster -> SubCategoryMaster -> lsfFacId
"producrId": "10" // ProductMaster -> ProductMaster -> prdCode
},
"dedupeSearch": {
"existingCustomer": false,
"cifNumber": "1234456",
"constitution": "I" // Listofvalues -> Constitution -> optCode  
 },
"individualNonIndividualDetails": {
"title": "3", // Listofvalues -> Title -> optvalue  
 "firstName": "Jabaraj",
"middleName": "",
"lastName": "D",
"dob": "10-09-1998",
"residentialStatus": "4", // ResidentialStatus -> optvalue
"primaryMobileNumber": "9025347799",
"secondaryMobileNumber": "142414124",
"email": "john@sysarc",
"panNumber": "GIBPG3221W",
"aadharRefNo": "32132313213",
"passportNumber": "431241131",
"loanAmountRequested": 100000,
"natureOfActivity": "1", // Listofvalues -> NatureOfActivity -> optvalue
"occupationType": "01", // Listofvalues -> OccupationType -> optvalue
"agriculturistType": "1", // Listofvalues -> AgricultType -> optvalue
"farmerCategory": "2", // Listofvalues -> FarmerCategory -> optvalue
"farmerType": "1", // Listofvalues -> FarmerType -> optvalue
"religion": "3", // Listofvalues -> Religion -> optvalue
"caste": "CAS000001", // Listofvalues -> Caste -> optvalue
"cityDistrict": "23", // StateCityMaster -> cityName
"sourceid": "AGRI1124",
"sourcename": "Meena",
"subActivity": "1.3, 1.3" // Listofvalues -> SubActivity
},
"addressDetails": [
{
"addressType": "9", // Listofvalues -> AddressType
"address1": "1/124, NORTH STREET",
"address2": "ANUMANALLUR, PAPANASAM",
"address3": "",
"state": "38", // StateCityMaster -> stateCode
"cityDistrict": "0001", // StateCityMaster -> cityName
"area": "100", // StateCityMaster -> districtCode
"pincode": "612301"
}
],
"userid": "AGRI1124",
"vertical": "7",
"orgScode": "14356", // OrganizationMaster -> OrgID
"orgName":"BRAHMAMANGALAM", // OrganizationMaster -> OrgName
"orgLevel": "23", // OrganizationMaster -> OrgLevel
"token": "U2FsdGVkX1/Wa6+JeCIOVLl8LTr8WUocMz8kIGXVbEI9Q32v7zRLrnnvAIeJIVV3"
}
