import 'package:flutter/material.dart';
import 'package:supabase_studying/core/theme/app_color.dart';

class AuthGradientButton extends StatelessWidget {
  final String title;
  const AuthGradientButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              AppColor.gradient1,
              AppColor.gradient2,
            ],
          ),
          borderRadius: BorderRadius.circular(22)),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              fixedSize: Size(MediaQuery.of(context).size.width, 55)),
          onPressed: () {},
          child: Text(
            title,
            style: TextStyle(fontSize: 17, color: AppColor.whiteColor),
          )),
    );
  }
}
