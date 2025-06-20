import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:newsee/widgets/custom_text_field.dart';
import 'package:newsee/widgets/drop_down.dart';
import 'package:newsee/widgets/radio.dart';

class LandInfoFormPage extends StatelessWidget {
  final String title;
  final FormGroup form = FormGroup({
    'applicantName': FormControl<String>(validators: [Validators.required]),
    'locationOfFarm': FormControl<String>(validators: [Validators.required]),
    'state': FormControl<String>(validators: [Validators.required]),
    'taluk': FormControl<String>(validators: [Validators.required]),
    'firka': FormControl<String>(validators: [Validators.required]),
    'totalAcreage': FormControl<String>(validators: [Validators.required]),
    'irrigatedLand': FormControl<String>(validators: [Validators.required]),
    'compactBlocks': FormControl<String>(validators: [Validators.required]),
    'landOwnedByApplicant': FormControl<bool>(
      validators: [Validators.required],
    ),
    'distanceFromBranch': FormControl<String>(
      validators: [Validators.required],
    ),
    'district': FormControl<String>(validators: [Validators.required]),
    'village': FormControl<String>(validators: [Validators.required]),
    'surveyNo': FormControl<String>(validators: [Validators.required]),
    'natureOfRight': FormControl<String>(validators: [Validators.required]),
    'irrigationFacilities': FormControl<String>(
      validators: [Validators.required],
    ),
    'affectedByCeiling': FormControl<String>(validators: [Validators.required]),
    'landAgriActive': FormControl<String>(validators: [Validators.required]),
  });

  final ValueNotifier<List<Map<String, dynamic>>> entryListNotifier =
      ValueNotifier<List<Map<String, dynamic>>>([]);

  LandInfoFormPage({super.key, required this.title});

  void handleSubmit(BuildContext context) {
    if (form.valid) {
      entryListNotifier.value = [...entryListNotifier.value, form.value];
      form.reset();
    } else {
      form.markAllAsTouched();
    }
  }

  void showBottomSheet(BuildContext context) {
    final entries = entryListNotifier.value;
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder:
          (_) => SizedBox(
            height: 300,
            child:
                entries.isEmpty
                    ? const Center(child: Text('No saved entries.'))
                    : ListView.separated(
                      padding: const EdgeInsets.all(16),
                      itemCount: entries.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (ctx, index) {
                        final item = entries[index];
                        return ListTile(
                          title: Text(item['applicantName'] ?? ''),
                          subtitle: Text(item['locationOfFarm'] ?? ''),
                          trailing: const Icon(
                            Icons.arrow_forward_ios,
                            size: 16,
                          ),
                          onTap: () {
                            Navigator.pop(context);
                            form.patchValue(item);
                          },
                        );
                      },
                    ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: ReactiveForm(
        formGroup: form,
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 100),
                child: Column(
                  children: [
                    Dropdown(
                      controlName: 'applicantName',
                      label: 'Applicant Name / Guarantor',
                      items: [
                        '--Select--',
                        'Ravi Kumar',
                        'Sita Devi',
                        'Vikram R',
                      ],
                    ),
                    CustomTextField(
                      controlName: 'locationOfFarm',
                      label: 'Location of Farm',
                      mantatory: true,
                    ),
                    Dropdown(
                      controlName: 'state',
                      label: 'State',
                      items: [
                        '--Select--',
                        'Tamil Nadu',
                        'Kerala',
                        'Karnataka',
                      ],
                    ),
                    CustomTextField(
                      controlName: 'taluk',
                      label: 'Taluk',
                      mantatory: true,
                    ),
                    CustomTextField(
                      controlName: 'firka',
                      label: 'Firka (as per Adangal/Chitta/Patta)',
                      mantatory: true,
                    ),
                    CustomTextField(
                      controlName: 'totalAcreage',
                      label: 'Total Acreage (in Acres)',
                      mantatory: true,
                    ),
                    CustomTextField(
                      controlName: 'irrigatedLand',
                      label: 'Irrigated Land (in Acres)',
                      mantatory: true,
                    ),
                    Dropdown(
                      controlName: 'compactBlocks',
                      label: 'Lands situated in compact blocks',
                      items: ['--Select--', 'Yes', 'No'],
                    ),
                    RadioButton(
                      'Land owned by the Applicant',
                      'landOwnedByApplicant',
                    ),
                    CustomTextField(
                      controlName: 'distanceFromBranch',
                      label: 'Distance from Branch (in Kms)',
                      mantatory: true,
                    ),
                    Dropdown(
                      controlName: 'district',
                      label: 'District',
                      items: ['--Select--', 'Chennai', 'Madurai', 'Coimbatore'],
                    ),
                    CustomTextField(
                      controlName: 'village',
                      label: 'Village',
                      mantatory: true,
                    ),
                    CustomTextField(
                      controlName: 'surveyNo',
                      label: 'Survey No.',
                      mantatory: true,
                    ),
                    Dropdown(
                      controlName: 'natureOfRight',
                      label: 'Nature of Right',
                      items: [
                        '--Select--',
                        'Owned',
                        'Leaseholder',
                        'Ancestral',
                      ],
                    ),
                    Dropdown(
                      controlName: 'irrigationFacilities',
                      label: 'Nature of Irrigation facilities',
                      items: ['--Select--', 'Canal', 'Well', 'Tube Wells'],
                    ),
                    Dropdown(
                      controlName: 'affectedByCeiling',
                      label: 'Affected by land ceiling enactments',
                      items: ['--Select--', 'Yes', 'No'],
                    ),
                    Dropdown(
                      controlName: 'landAgriActive',
                      label: 'Whether Land Agriculturally Active',
                      items: ['--Select--', 'Yes', 'No'],
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 16,
                left: 0,
                right: 0,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () => handleSubmit(context),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text(
                      'Save',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ValueListenableBuilder<List<Map<String, dynamic>>>(
        valueListenable: entryListNotifier,
        builder:
            (_, entries, __) => FloatingActionButton(
              heroTag: 'view_button',
              backgroundColor: Colors.white,
              onPressed: () => showBottomSheet(context),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  const Icon(
                    Icons.remove_red_eye,
                    color: Colors.blue,
                    size: 28,
                  ),
                  if (entries.isNotEmpty)
                    Positioned(
                      top: 4,
                      right: 4,
                      child: Container(
                        padding: const EdgeInsets.all(3),
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          '${entries.length}',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                ],
              ),
            ),
      ),
    );
  }
}
