import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/*
   @author   : Gayathri.B  06/05/2025
   @description : This function displays a Cupertino-style action sheet prompting the user 
              to reset their PIN. It shows a lock icon, a title, a message, and provides 
              two action buttons (e.g., Continue and Cancel). 

    @props  : - BuildContext context : The context in which the Cupertino modal is displayed.
  - String title          : The title displayed at the top of the action sheet.
  - String message        : The message or description displayed below the title.
  - IconData icon         : An icon displayed at the top (e.g., lock icon).
  - String action1        : Label for the first action button (e.g., "Continue").
  - String action2        : Label for the second action button (e.g., "Cancel").


 */

//Define the function that take multiple pharmeter

void forgetActionSheet(
  BuildContext context,
  String title,
  String message,
  IconData icon,
  String action1,
  String action2,
) {
  // popup the modal sheet
  showCupertinoModalPopup<void>(
    context: context,
    builder:
        (BuildContext context) => CupertinoActionSheet(
          //title section of the action sheet
          title: Column(
            children: [
              // display the icon
              Icon(icon, size: 50, color: const Color.fromARGB(255, 3, 9, 110)),
              //add some spacing and disply the title
              Padding(
                padding: const EdgeInsets.only(top: 16.0, bottom: 8),
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          // below the title message
          message: Text(
            message,
            style: const TextStyle(fontSize: 16, color: Colors.black),
          ),
          // Two action Button
          actions: <CupertinoActionSheetAction>[
            //Cancel First action Button
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                action2,
                style: const TextStyle(color: Color.fromARGB(255, 3, 9, 110)),
              ),
            ),
            //Continue Second action Button
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                action1,
                style: const TextStyle(color: Color.fromARGB(255, 3, 9, 110)),
              ),
            ),
          ],
        ),
  );
}
