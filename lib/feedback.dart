import 'package:flutter/material.dart';
import 'service_locator.dart';
import 'messages.dart';

class FeedbackPage extends StatelessWidget {
  static const String routeName = "/feedback";
  final CallsAndMessagesService _service = CallsAndMessagesService();
  final String email = "iitachiu0@gmail.com";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Feedback'),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            SizedBox(height: 20),
            RaisedButton(
              child: Text(
                " Send email to: $email",
              ),
              onPressed: () => _service.sendEmail(email),
            ),
          ],
        ),
      ),
    );
  }
}