## Designing Master Download / Update Feature

AsyncResposeHandler<L,R> -> L - Failure , R- InterestMaster , ProductMaster ,MainProduct , Subproduct

For Handling Error

Master Error Response
{
"errorCode": "002",
"errorDesc": "Technical error occured please try again later"
}

For Handling Success

class MasterResponse<T> {
// json serialization deserialization not required
final List<T> mastersList;

    MasterResponse(this.master);

}

class LovMaster{

<!--
 "Header": "IrrigationNew",
                "optvalue": "1",
                "optDesc": "River"
 -->

final String Header;
final String optvalue;
final String optDesc;

}

class InterestMaster{

}

class ProductMaster{

}

Designing Master Download Feature:

all the master's should be downloaded one by one sequentially and the UI progress bar
updated with the progress

create table during the initialization of the db

create table function can be encapsulated

## version based master update

step 1. store masterdetail object in table
table name - masterversion colums : id , mastername , version

step 2 - once master successfully downloaded , insert masterversion record for that
master

step 3 - when all masters are downloaded , and user logging in again
check the masterdetails from login api response against masterversion table data
if there is no deviation then no master update
otherwise update the master only which has deviation

-------- END ------------


# Version Based Master Update Refetch Logic

step 1 :    First we fetching lov master 

step 2 :    if master fetching success then update the master version upate table and fetching next master.

step 3 :    if failure then upate the master version table status key as failure and fetching next master

step 4 :    finally all master fetching completed then we check the all master table status key is success or failure.

step 5 :    if all mstatus is success then navigate to homepage 

step 6 :    if some master are failed then refetch the failed master and re update the master table.

When all masters are fetched Successfully and Master Version Table status success then navigate to home page and proceed the application.

