import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

class _AddDetailsState extends State<AddDetails> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    TextEditingController date = TextEditingController();
    TextEditingController name = TextEditingController();
    // TextEditingController password = TextEditingController();
    return BlocConsumer(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(),
            body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: height * .04),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .07),
                    child: TextField(
                      controller: name,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(width * .043),
                          ),
                          hintText: 'Student Name',
                          labelText: 'Student Name'),
                    ),
                  ),
                  SizedBox(height: height * .04),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .07),
                    child: TextField(
                      onTap: () {
                        //datepicker
                      },
                      readOnly: true,
                      controller: date,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(width * .043),
                        ),
                        hintText: 'DOB',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (event, state) {});
  }
}
