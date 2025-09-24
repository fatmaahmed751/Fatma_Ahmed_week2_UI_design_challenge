import 'package:flutter/material.dart';

class InteractiveViewerScreen extends StatelessWidget {
  const InteractiveViewerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: InteractiveViewer(
        minScale: 1.0,
        maxScale: 4.0,
        panEnabled: true,

        boundaryMargin: EdgeInsets.all(50),
        constrained: true,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey, width: 2),
          ),
          child: Image.network(
            'https://picsum.photos/800/600',
            fit: BoxFit.cover,
          ),
        ),
      ),

    );
  }
}