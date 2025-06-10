import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ResponseWidget extends StatelessWidget {
  double heightSize;
  List<Map<String, dynamic>> dataList;
  VoidCallback? onpressed;

  ResponseWidget({
    required this.heightSize,
    required this.dataList,
    this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * heightSize,
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          Card(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ...dataList
                      .map(
                        (list) => _buildInfoRow(
                          context,
                          list['icon'] as IconData,
                          list['label'] as String,
                          list['value'] as String,
                        ),
                      )
                      .toList(),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: ElevatedButton.icon(
              onPressed: onpressed,
              icon: Icon(Icons.send, color: Colors.white),
              label: RichText(
                text: TextSpan(
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                  children: [TextSpan(text: 'OK')],
                ),
              ),
              style: ButtonStyle(
                minimumSize: MaterialStateProperty.all(
                  Size(double.infinity, 50),
                ),
                backgroundColor: MaterialStateProperty.all(
                  const Color.fromARGB(255, 75, 33, 83),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildInfoRow(
  BuildContext context,
  IconData icon,
  String label,
  String value,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.1,
          child: Icon(icon, color: Colors.teal),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.2,
          child: Text(
            "$label: ",
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(value, style: const TextStyle(fontSize: 13)),
        ),
      ],
    ),
  );
}

class ResponseWidgetList {
  String icon;
  String label;
  String value;
  ResponseWidgetList({
    required this.icon,
    required this.label,
    required this.value,
  });
}
