import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsee/feature/cif/domain/model/user/cif_request.dart';
import 'package:newsee/feature/cif/presentation/bloc/cif_bloc.dart';
import 'package:newsee/widgets/build_in_row.dart';
import 'package:newsee/widgets/integer_text_field.dart';
import 'package:newsee/widgets/response_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:intl/intl.dart';

class CIFSearch extends StatelessWidget {
  final FormGroup cifForm;
  final TabController tabController;
  CIFSearch({super.key, required this.cifForm, required this.tabController});

  // Convert Cif Response date to String date(dd-MM-yyyy);
  String getDateFormat(dynamic state) {
    final DateFormat parser = DateFormat("MMM dd, yyyy, hh:mm:ss a");
    DateTime date = parser.parse(state.cifResponseModel?.lpretLeadDetails['lleaddob']);
    DateFormat formatter = DateFormat('dd-MM-yyyy');
    String convertedDateString = formatter.format(date);
    return convertedDateString;
  }

  //Dispose Popover
  disposeResponse(context) {
    print("Welcome here for you");
    cifForm.reset();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    if (tabController.index < tabController.length - 1) {
      tabController.animateTo(tabController.index + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList;
    String formattedDate;
    return BlocProvider(
      create: (context) => CifBloc(),
      child: BlocListener<CifBloc, CifState>(
        listener: (context, state) => {
          
          if (state.status == CifStatus.success) {  
            formattedDate = getDateFormat(state),
            dataList = [
              {
                "icon": Icons.person, 
                "label": "Name", 
                "value": [
                  state.cifResponseModel?.lpretLeadDetails['lleadfrstname'] ?? '',
                  state.cifResponseModel?.lpretLeadDetails['lleadmidname'] ?? '',
                  state.cifResponseModel?.lpretLeadDetails['lleadlastname'] ?? '',
                ].where((val) => val.isNotEmpty).join(' ')
              },
              
              {"icon": Icons.date_range, "label": "DOB", "value": formattedDate},
              {"icon": Icons.call, "label": "Mobile", "value": state.cifResponseModel?.lpretLeadDetails['lleadmobno']},
              {"icon": Icons.chrome_reader_mode_rounded, "label": "PAN", "value": state.cifResponseModel?.lpretLeadDetails['lleadpanno']},
              {"icon": Icons.elevator_rounded, "label": "AAdhaar", "value": state.cifResponseModel?.lpretLeadDetails['lleadadharno']},
              {
                "icon": Icons.home, 
                "label": "Address", 
                "value": [
                  state.cifResponseModel?.lpretLeadDetails['lleadaddress'] ?? '',
                  state.cifResponseModel?.lpretLeadDetails['lleadaddresslane1'] ?? '',
                  state.cifResponseModel?.lpretLeadDetails['lleadaddresslane2'] ?? ''
                ].where((val) => val.isNotEmpty).join(' ')
              },
              {"icon": Icons.format_list_numbered_rtl_rounded, "label": "Pinocode", "value": state.cifResponseModel?.lpretLeadDetails['lleadpinno']},
            ],
            showDialog(
              context: context,
              builder: (BuildContext context) {
                // final DateFormat parser = DateFormat("MMM dd, yyyy, hh:mm:ss a");
                // DateTime date = parser.parse(state.cifResponseModel?.lpretLeadDetails['lleaddob']);
                
                // // Format to desired output
                // final DateFormat formatter = DateFormat('dd-MM-yyyy');
                // String formattedDate = formatter.format(date);
                return Dialog(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ResponseWidget(heightSize: 0.6, dataList: dataList, onpressed: () => disposeResponse(context))
                );
              },
            )
          } else if (state.status == CifStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage as String)),
            )
          }
        },
        child: BlocBuilder<CifBloc, CifState>(
          builder: (context, state) {
            return ReactiveForm(
                formGroup: cifForm,
                child: SafeArea(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(20, 0,0,0),
                          child: Text("Cif Search", 
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            IntegerTextField('cifid', 'CIF ID'),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color.fromARGB(255, 3, 9, 110),
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                              onPressed: () {
                                if (cifForm.valid) {
                                  final CIFRequest req = CIFRequest(cifId: cifForm.control('cifid').value).copyWith();
                                  context.read<CifBloc>().add(SearchCifEvent(request: req));
                                } else {
                                  print("Click function passed go here, ${cifForm.valid}");
                                  cifForm.markAllAsTouched();
                                }
                                
                              }, 
                              child: state.status == CifStatus.loading ? CircularProgressIndicator() : Text("Search")
                            )
                          ],
                        )
                      ]
                    )
                  )
                )
            );
          }
          ),
      )
      
    );
  }
}