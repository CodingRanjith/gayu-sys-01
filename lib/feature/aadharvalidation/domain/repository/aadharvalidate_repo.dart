import 'package:newsee/core/api/AsyncResponseHandler.dart';
import 'package:newsee/core/api/failure.dart';
import 'package:newsee/feature/aadharvalidation/domain/modal/aadharvalidate_request.dart';
import 'package:newsee/feature/aadharvalidation/domain/modal/aadharvalidate_response.dart';

/* 
@author   : Rajesh.S 10/06/2025
@desc     : Abstract class representing a contract for implementing Aadhaar validation logic.
Parameters:[request]: An instance of AadharvalidateRequest containing the details.
Returns:A [Future] that resolves to an [AsyncResponseHandler]  
*/
abstract class AadharvalidateRepo {
  Future<AsyncResponseHandler<Failure, AadharvalidateResponse>> validateAadhar({
    required AadharvalidateRequest request,
  });
}
