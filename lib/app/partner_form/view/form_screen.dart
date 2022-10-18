import 'package:flutter/material.dart';
import 'package:partner_app/app/utilities/view/list.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                toolbarHeight: 100,
                backgroundColor: AppStyle.kBlack,
                expandedHeight: AppStyle.size.height / 4.0,
                floating: false,
                pinned: true,
                snap: false,
                flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: FittedBox(
                    child: Container(
                      color: AppStyle.kWhite,
                      width: AppStyle.size.width,
                      height: 60,
                      child: SizedBox(
                          child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: List.generate(
                            ListChart.formList.length,
                            (index) => Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 150,
                                    height: 100,
                                    color: AppStyle.kWhite,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        CircleAvatar(
                                          radius: 10,
                                          backgroundColor: AppStyle.kGrey,
                                          child: FittedBox(
                                            child: Text(
                                              " ${index + 1}",
                                              style: AppTextStyles.h5,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          ListChart.formList[index].toString(),
                                          style: AppTextStyles.h3,
                                        )
                                      ],
                                    ),
                                  ),
                                )),
                      )),
                    ),
                  ),
                  background: Image.network(
                    "https://images.unsplash.com/photo-1633383718081-22ac93e3db65?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3VyZCUyMHJpY2V8ZW58MHx8MHx8&w=1000&q=80",
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            physics: const ScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Colors.blue,
                  width: AppStyle.size.width,
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
