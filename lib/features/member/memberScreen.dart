import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:kienapp/features/member/memberController.dart';

class MemberScreen extends GetView<MemberController>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("MemberScreeen")
        )
      )
    );
  }

}