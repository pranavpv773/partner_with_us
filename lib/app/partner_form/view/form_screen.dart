import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view/widgets/sliver_appbar_widget.dart';
import 'package:partner_app/app/restaurant_detail/view/restaurant_screen.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              const SliverAppBarWidget(),
            ];
          },
          body: const RestaurantDetailScreen(),
        ),
      ),
    );
  }
}
