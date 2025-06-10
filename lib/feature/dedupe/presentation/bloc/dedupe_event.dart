/* 
@author    :  ganeshkumar.b 04/06/2025
@desc      :  Event Registers for Dedupe Search feature
@param     :  Pass Dedupe Reqest for Fetching Event
 */

part of 'dedupe_bloc.dart';

class DedupeEvent {

}

class FetchDedupeEvent extends DedupeEvent {
  DedupeRequest request;
  FetchDedupeEvent({required this.request});
}

