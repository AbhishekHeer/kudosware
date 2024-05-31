import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kudosware/bloc/auth_bloc.dart';
import 'package:kudosware/home/home.dart';
import 'package:kudosware/messege.dart';

class AddDetails extends StatefulWidget {
  const AddDetails({super.key});

  @override
  State<AddDetails> createState() => _AddDetailsState();
}

TextEditingController date = TextEditingController();
TextEditingController name = TextEditingController();
String dropdownvalue = "Male";

class _AddDetailsState extends State<AddDetails> {
  @override
  void initState() {
    super.initState();
    date.text = "";
    name.text = "";
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    final bloc = BlocProvider.of<AuthBloc>(context);
    // TextEditingController password = TextEditingController();
    return BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
      if (state is Proccess) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
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
                  onTap: () async {
                    final datepicker = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100));
                    if (datepicker != null) {
                      bloc.add(Calander(date: datepicker.toString()));
                      final format =
                          "${datepicker.day}-${datepicker.month}-${datepicker.year}";
                      date.text = format;
                    } else {
                      // ignore: use_build_context_synchronously
                      Messege.showMessege(context, "Please Select Date");
                    }
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
              SizedBox(height: height * .04),
              DropdownButton(
                  padding: EdgeInsets.symmetric(horizontal: width * .07),
                  value: dropdownvalue,
                  isExpanded: true,
                  icon: const Icon(Icons.arrow_drop_down),
                  items: const [
                    DropdownMenuItem(
                      value: 'Male',
                      child: Text('Male'),
                    ),
                    DropdownMenuItem(
                      value: 'Female',
                      child: Text('Female'),
                    ),
                  ],
                  onChanged: (value) {
                    bloc.add(Dropdown(dropdown: value!));
                  }),
              SizedBox(height: height * .04),
              ElevatedButton(
                onPressed: () async {
                  if (name.text.isEmpty || date.text.isEmpty) {
                    Messege.showMessege(context, "Please Fill All Details");
                  }
                  final id = DateTime.now().microsecondsSinceEpoch.toString();

                  bloc.add(Storedata(
                      uid: id,
                      name: name.text.toString(),
                      dob: date.text.toString(),
                      gender: dropdownvalue.toString()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(width * .3, height * .05),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(width * .03),
                  ),
                ),
                child: Text('Upload',
                    style: GoogleFonts.poppins(fontSize: width * .043)),
              ),
            ],
          ),
        ),
      );
    }, listener: (event, state) {
      if (state is Picked) {
        date.text.substring(0, 10) == state.pickeddate;
      }

      if (state is Proccess) {
        const Center(
          child: CircularProgressIndicator(),
        );
        return;
      }

      if (state is Store) {
        Messege.showMessege(context, "Data Stored");
        Navigator.pop(context);
      }

      if (state is DropD) {
        dropdownvalue = state.dropdown;
      }
      if (state is Store) {
        Messege.showMessege(context, "Data Stored");
        Navigator.pop(context);
      }

      if (state is StoreSuccess) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
        date.text = "";
        name.text = "";
        dropdownvalue = "Male";

        Messege.showMessege(context, "Data Stored");
      }
    });
  }
}
