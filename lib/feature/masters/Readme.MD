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
