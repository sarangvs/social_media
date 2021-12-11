import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:sizer/sizer.dart';

class CustomProfileAppBar extends StatelessWidget {
  const CustomProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: Color(0xffF5F5F5),
    );
  }
}

///My profile appBar

class MyCustomProfileAppBar extends StatelessWidget {
  const MyCustomProfileAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      elevation: 0,
      backgroundColor: const Color(0xffF5F5F5),
      actions: [
        IconButton(
            onPressed: (){
              showMaterialModalBottomSheet(
                context: context,
                builder: (context) => Container(
                  height: 30.h,
                ),
              );
            },
            icon: FaIcon(
              FontAwesomeIcons.ellipsisV,
              color: Colors.black,
              size: 12.sp,
            ))
      ],
    );
  }
}
