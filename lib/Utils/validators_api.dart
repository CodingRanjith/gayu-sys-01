import 'package:newsee/AppData/app_constants.dart';
import 'package:reactive_forms/reactive_forms.dart';

Map<String, dynamic>? checkForRestrictedSpecialChars(
  AbstractControl<dynamic> control,
) {
  String val = control.value as String;
  if (val.contains(AppConstants.PATTERN_SPECIALCHAR)) {
    return {'contains': 'Restricted Special Characters Not Allowed'};
  } else {
    return null;
  }
}
