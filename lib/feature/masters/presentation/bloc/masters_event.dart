/* 
@author    :  karthick.d 23/05/2025
@desc      :  Event Registers for Masters Download feature
@param     :  none
 */
part of 'masters_bloc.dart';

sealed class MastersEvent {}

final class MasterFetch extends MastersEvent {
  final MasterRequest request;
  MasterFetch({required this.request});
}
