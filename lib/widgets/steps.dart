import 'package:flutter/material.dart';

class Steps extends StatelessWidget {
  final List<String> steps;
  Steps(this.steps);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      child: Column(
        children: steps.map((item) {
          return Column(
            children: [
              ListTile(
                leading: CircleAvatar(
                  child: Text('# ${steps.indexOf(item) + 1}'),
                ),
                title: Text(
                  item,
                ),
              ),
              Divider(
                color: Colors.red,
                thickness: 1,
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
