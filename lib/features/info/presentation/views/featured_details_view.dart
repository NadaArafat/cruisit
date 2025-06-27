import 'package:flutter/material.dart';

class FeaturedDetailsView extends StatelessWidget {
  const FeaturedDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Featured Details'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Text(
          'Details of the featured item will be displayed here.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
