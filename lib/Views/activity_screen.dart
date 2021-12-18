import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class ActivityScreen extends StatelessWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xffF5F5F5),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 11.h,
          backgroundColor: const Color(0xffF5F5F5),
          title: Text(
            'Activity',
            style: GoogleFonts.k2d(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 17.sp),
          ),
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 11.sp),
          child: FutureBuilder(
            builder: (BuildContext ctx, AsyncSnapshot<dynamic> snapshot) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return Material(
                    borderRadius: BorderRadius.circular(10),
                    child: ListTile(
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage('Assets/me.jpg'),
                        ),
                        title: Text(
                          'Sarang liked your post',
                          style: GoogleFonts.k2d(),
                        ),
                        trailing: const Text('17:00'),
                        onTap: null),
                  );
                },
                itemCount: 12,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: 2.h,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
