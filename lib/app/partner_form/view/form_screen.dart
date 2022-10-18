import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view/widgets/sliver_appbar_widget.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:provider/provider.dart';

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
          body: Consumer<FormProvider>(builder: (context, value, _) {
            return value.pages[value.pageIndex];
          }),
        ),
      ),
    );
  }
}
