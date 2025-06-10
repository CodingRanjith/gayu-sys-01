import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:newsee/AppData/app_forms.dart';
import 'package:newsee/feature/dedupe/presentation/bloc/dedupe_bloc.dart';
import 'package:newsee/feature/cif/presentation/page/cif_search.dart';
import 'package:newsee/feature/dedupe/presentation/page/dedup_search.dart';
import 'package:reactive_forms/reactive_forms.dart';

class DedupeView extends StatelessWidget {
  final String title;

  DedupeView(String s, {required this.title, super.key});

  final dedupeForm = AppForms.DEDUPE_DETAILS_FORM;
  final cifForm = AppForms.CIF_DETAILS_FORM;

  void _openModalSheet(
    BuildContext context,
    bool isNewCustomer,
    FormGroup form,
  ) {
    final tabController = DefaultTabController.of(context);
    var resdata = showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder:
          (BuildContext context) => GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: DraggableScrollableSheet(
              expand: false,
              initialChildSize: isNewCustomer ? 0.9 : 0.7,
              minChildSize: 0.4,
              maxChildSize: 0.95,
              builder:
                  (_, scrollController) => Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                      border: Border.all(
                        width: 3,
                        color: Color.fromARGB(255, 3, 9, 110),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 10,
                          offset: Offset(0, -3),
                        ),
                      ],
                    ),
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom,
                      left: 16,
                      right: 16,
                      top: 20,
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: 40,
                          height: 5,
                          margin: const EdgeInsets.only(bottom: 16),
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 3, 9, 110),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        const SizedBox(height: 12),
                        Expanded(
                          child: SingleChildScrollView(
                            controller: scrollController,
                            child:
                                isNewCustomer
                                    ? DedupeSearch(
                                      dedupeForm: form,
                                      tabController: tabController,
                                    )
                                    : CIFSearch(
                                      cifForm: form,
                                      tabController: tabController,
                                    ),
                          ),
                        ),
                      ],
                    ),
                  ),
            ),
          ),
    );
    print("resdata $resdata");
  }

  @override
  Widget build(BuildContext context) {
    bool? selectedValue;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dedupe Details"),
        automaticallyImplyLeading: false,
      ),
      body: BlocProvider(
        create: (context) => DedupeBloc(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: StatefulBuilder(
            builder:
                (context, setState) => Column(
                  children: [
                    ListTile(
                      title: const Text("New Customer"),
                      leading: Radio<bool>(
                        value: true,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() => selectedValue = value);
                          _openModalSheet(context, true, dedupeForm);
                        },
                      ),
                      onTap: () {
                        setState(() => selectedValue = true);
                        _openModalSheet(context, true, dedupeForm);
                      },
                    ),
                    ListTile(
                      title: const Text("Existing Customer"),
                      leading: Radio<bool>(
                        value: false,
                        groupValue: selectedValue,
                        onChanged: (value) {
                          setState(() => selectedValue = value);
                          _openModalSheet(context, false, cifForm);
                        },
                      ),
                      onTap: () {
                        setState(() => selectedValue = false);
                        _openModalSheet(context, false, cifForm);
                      },
                    ),
                  ],
                ),
          ),
        ),
      ),
    );
  }
}
