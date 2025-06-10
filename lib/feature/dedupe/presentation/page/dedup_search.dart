import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:newsee/feature/dedupe/domain/model/deduperequest.dart';
// import 'package:newsee/feature/dedupe/domain/repositoy/deduperepository.dart';
import 'package:newsee/feature/dedupe/presentation/bloc/dedupe_bloc.dart';
import 'package:newsee/widgets/custom_text_field.dart';
import 'package:newsee/widgets/drop_down.dart';
import 'package:newsee/widgets/integer_text_field.dart';
import 'package:newsee/widgets/response_widget.dart';
// import 'package:newsee/widgets/response_widget.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:newsee/widgets/build_in_row.dart';

class DedupeSearch extends StatelessWidget {
  final FormGroup dedupeForm;
  final TabController tabController;
  DedupeSearch({super.key, required this.dedupeForm, required this.tabController});

  disposeResponse(context) {
    print("Welcome here for you");
    dedupeForm.reset();
    Navigator.of(context).pop();
    Navigator.of(context).pop();
    if (tabController.index < tabController.length - 1) {
      tabController.animateTo(tabController.index + 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> dataList;
    return 
      BlocProvider.value(
        value: DedupeBloc(),
        child: BlocListener<DedupeBloc, DedupeState>(
          listener: (context, state) => {
            if (state.status == DedupeFetchStatus.success) {
              dataList = [
                {"icon": Icons.currency_rupee, "label": "CBS", "value": "true"},
                {"icon": Icons.assignment_add, "label": "Remarks", "value": state.dedupeResponse?.remarks as String},
              ],
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return Dialog(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ResponseWidget(heightSize: 0.32, dataList: dataList, onpressed: () => disposeResponse(context))
                  );
                },
              )
            } else if (state.status == DedupeFetchStatus.failure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.errorMsg!)),
              )
            }
          },
        child: BlocBuilder<DedupeBloc, DedupeState>(
          builder: (context, state) { 
            return ReactiveForm(
            formGroup: dedupeForm, 
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 0,0,0),
                        child: Text("Dedupe Search", 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24
                          ),
                        ),
                      ),
                      
                      SizedBox(height: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Dropdown(
                            controlName: 'title',
                            label: 'Title',
                            items: ['Mr', 'Mrs', 'Miss', 'Others'],
                          ),
                          CustomTextField('firstname', 'First Name'),
                          CustomTextField('lastname', 'Last Name'),
                          IntegerTextField('mobilenumber', 'Mobile Number'),
                          CustomTextField('pan', 'PAN Number'),
                          IntegerTextField('aadhaar', 'Aadhaar Number'),
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
                              print("Click function passed ${dedupeForm.value}");
                              if (dedupeForm.valid) {
                                print("Click function passed go here, ${dedupeForm.valid}");
                                final DedupeRequest request = DedupeRequest().copyWith(
                                  aadharCard: dedupeForm.control('aadhaar').value,
                                  panCard: dedupeForm.control('pan').value,
                                  mobileno: dedupeForm.control('mobilenumber').value
                                );
                                
                                context.read<DedupeBloc>().add(FetchDedupeEvent(request: request));
                              } else {
                                print("Click function passed go here, ${dedupeForm.valid}");
                                dedupeForm.markAllAsTouched();
                              }
                            }, 
                            // child: Text("click"),
                            child: state.status == DedupeFetchStatus.loading ? CircularProgressIndicator() : Text("Search")
                          ),
                        ]
                      )
                    ]
                  )
                ) 
              )
            );
          }
        )
      )
    ); 
  }

}

