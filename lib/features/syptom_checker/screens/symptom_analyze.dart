import 'package:flutter/material.dart';

class AnalyzeSymptom extends StatefulWidget {
  static const String routeName = '/analyze';
  final String name ;
  final String value;
  const AnalyzeSymptom({super.key,required this.name,required this.value});

  @override
  State<AnalyzeSymptom> createState() => _AnalyzeSymptomState();
}

class _AnalyzeSymptomState extends State<AnalyzeSymptom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Analysis"),),
      body : Text('${widget.name}: ${widget.value}'),
    );
  }
}