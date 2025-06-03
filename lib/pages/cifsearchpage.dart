// Importing necessary packages
import 'dart:convert'; // For JSON encoding
import 'package:flutter/material.dart'; // For UI components
import 'package:http/http.dart' as http; // For HTTP requests

// Main StatefulWidget for the CIF Search screen
class CifSearchPage extends StatefulWidget {
  @override
  _CifSearchPageState createState() => _CifSearchPageState(); // Connects to the state class
}

// State class to manage UI state and logic
class _CifSearchPageState extends State<CifSearchPage> {
  // Text controllers for input fields
  final TextEditingController custIdController = TextEditingController(
    text: "902534", // Default value for Customer ID
  );
  final TextEditingController cifIdController = TextEditingController(
    text: "121212", // Default value for CIF ID
  );

  // Variable to store the response/result from the API
  String result = '';

  // Flag to show loading indicator during API call
  bool isLoading = false;

  // Function to call the CIF Search API
  Future<void> searchCIF() async {
    setState(() {
      isLoading = true; // Start loading
      result = ''; // Clear previous result
    });

    // Define the API endpoint
    var url = Uri.parse(
      "http://192.168.0.19:19084/lendperfect/MobileService/CIFSearch",
    );

    // Define headers required by the API
    var headers = {
      "Content-Type": "application/json",
      "token":
          "U2FsdGVkX1/Wa6+JeCIOVLl8LTr8WUocMz8kIGXVbEI9Q32v7zRLrnnvAIeJIVV3",
      "deviceId":
          "U2FsdGVkX180H+UTzJxvLfDRxLNCZeZK0gzxeLDg9Azi7YqYqp0KqhJkMb7DiIns",
      "userid": "4321",
    };

    // Define the JSON body to be sent in the POST request
    var body = jsonEncode({
      "custId": custIdController.text,
      "uniqueId": "3",
      "cifId": cifIdController.text,
      "type": "borrower",
      "token":
          "U2FsdGVkX1/Wa6+JeCIOVLl8LTr8WUocMz8kIGXVbEI9Q32v7zRLrnnvAIeJIVV3",
    });

    try {
      // Sending the POST request
      final response = await http.post(url, headers: headers, body: body);

      // Handling the response
      setState(() {
        if (response.statusCode == 200) {
          // If request is successful, display the response body
          result = response.body;
        } else {
          // Show status code if not successful
          result = "Error: ${response.statusCode}";
        }
      });
    } catch (e) {
      // Catch and show any error that occurs
      setState(() {
        result = "Error: $e";
      });
    } finally {
      // Stop the loading spinner
      setState(() => isLoading = false);
    }
  }

  // Building the UI
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff8f9fb), // Light gray background
      appBar: AppBar(
        title: Text(
          "CIF Search", // Title in the app bar
          style: TextStyle(fontWeight: FontWeight.w600), // Semi-bold style
        ),
        backgroundColor: Color(0xff4B91F1), // Custom blue color for app bar
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0), // Page padding
        child: Column(
          children: [
            // Input field for Customer ID
            TextField(
              controller: custIdController,
              decoration: InputDecoration(
                labelText: "Customer ID",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10), // Rounded border
                ),
              ),
            ),
            SizedBox(height: 16), // Spacing between inputs
            // Input field for CIF ID
            TextField(
              controller: cifIdController,
              decoration: InputDecoration(
                labelText: "CIF ID",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20), // Spacing before button
            // Search button
            ElevatedButton(
              onPressed: isLoading ? null : searchCIF, // Disable when loading
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff4B91F1), // Button color
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8), // Rounded button
                ),
              ),
              child:
                  isLoading
                      ? SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                      : Text("Search", style: TextStyle(fontSize: 16)),
            ),
            SizedBox(height: 20), // Spacing before result
            // Result display area
            Expanded(
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: Colors.white, // White card background
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade200,
                      blurRadius: 8,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Text(
                    result.isEmpty ? 'Result will appear here...' : result,
                    style: TextStyle(
                      fontFamily: 'monospace', // Code-style font
                      fontSize: 13.5,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
