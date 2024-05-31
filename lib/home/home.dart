import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kudosware/Auth/backend.dart';
import 'package:kudosware/Auth/login..dart';
import 'package:kudosware/bloc/auth_bloc.dart';
import 'package:kudosware/home/adddetaills.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              Auth.logout().then((value) => Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const LoginScreen())));
              // Perform logout logic here
            },
            icon: const Icon(Icons.exit_to_app_outlined),
          ),
          SizedBox(width: width * .03, height: 0.0),
        ],
      ),
      body: BlocConsumer<AuthBloc, AuthState>(builder: (context, state) {
        return StreamBuilder(
            stream:
                FirebaseFirestore.instance.collection('student').snapshots(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.data?.docs.isEmpty == true) {
                return Center(
                  child: Text(
                    'No Students Found',
                    style: GoogleFonts.poppins(
                      fontSize: height * .03,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }

              return GridView.builder(
                  itemCount: snapshot.data?.docs.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 2.5, crossAxisCount: 1),
                  itemBuilder: (context, index) {
                    final items = snapshot.data?.docs[index];
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: height * .0, horizontal: width * .02),
                      child: Card(
                        // color: Colors.red,
                        child: Padding(
                          padding: EdgeInsets.only(left: height * .03),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Name : ${items?['name']}",
                                style: GoogleFonts.poppins(
                                    fontSize: width * .04,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: height * .01),
                              Text(
                                "Date of Birth : ${items?['DOB']}",
                                style: GoogleFonts.poppins(
                                    fontSize: width * .04,
                                    fontWeight: FontWeight.w500),
                              ),
                              SizedBox(height: height * .01),
                              Text(
                                "Gender : ${items?['gender']}",
                                style: GoogleFonts.poppins(
                                    fontSize: width * .04,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            });
      }, listener: (context, state) {
        if (state is Dataload) {
          const Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: height * .05),
        child: FloatingActionButton(
            child: const Icon(CupertinoIcons.add),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AddDetails()),
              );
            }),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
