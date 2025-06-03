// ignore_for_file: public_member_api_docs, sort_constructors_first

/* 
@author     : karthick.d  23/05/2025
@desc       : State Object for Master Download
@param      : {MasterdownloadStatus status} - enum for download serice status 
              {String errorMsg} - error message when service failure
              {MasterResponse<T> response} - return MasterResponse<T>
                T - Lov | InterestMaster | ProductMaster | DocumentMaster etc
 */

part of 'masters_bloc.dart';

enum MasterdownloadStatus { init, loading, success, failue, refetch }

final class MastersState extends Equatable {
  final MasterdownloadStatus status;
  final String? errorMsg;
  final MasterResponse? masterResponse;
  MastersState({
    this.status = MasterdownloadStatus.init,
    this.errorMsg,
    this.masterResponse,
  });

  MastersState copyWith({
    MasterdownloadStatus? status,
    String? errorMsg,
    MasterResponse? masterResponse,
  }) {
    return MastersState(
      status: status ?? this.status,
      errorMsg: errorMsg ?? this.errorMsg,
      masterResponse: masterResponse ?? this.masterResponse,
    );
  }

  @override
  String toString() =>
      'MastersState(status: $status, errorMsg: $errorMsg, masterResponse: $masterResponse)';

  @override
  bool operator ==(covariant MastersState other) {
    if (identical(this, other)) return true;

    return other.status == status &&
        other.errorMsg == errorMsg &&
        other.masterResponse == masterResponse;
  }

  @override
  int get hashCode =>
      status.hashCode ^ errorMsg.hashCode ^ masterResponse.hashCode;

  @override
  List<Object?> get props => [status, errorMsg, masterResponse];
}
