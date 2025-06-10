/* 
@author   : karthick.d 
@desc     : state object that returns downloadprogress decimal
@param    : {double downloadProgress} - progress value in double 
            downloadProgress is 0.0 it defined as 0% progress 
            downloadProgress is 0.5 - 50% progress
            downloadProgress is 1 - 100% progress
 */
part of 'progress_bloc.dart';

class ProgressState extends Equatable {
  final double downloadProgress;

  ProgressState({required this.downloadProgress});
  ProgressState.initial() : downloadProgress = 0.0;

  @override
  List<Object?> get props => [downloadProgress];
}
