import 'package:flutter/material.dart';
import 'package:partner_app/app/partner_form/view_model/form_provider.dart';
import 'package:partner_app/app/utilities/view/list.dart';
import 'package:partner_app/app_style/app_style.dart';
import 'package:partner_app/app_style/app_text.dart';
import 'package:provider/provider.dart';

class SliverAppBarWidget extends StatelessWidget {
  const SliverAppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 80,
      backgroundColor: AppStyle.kBlack,
      expandedHeight: AppStyle.size.height / 2.0,
      floating: false,
      pinned: true,
      snap: false,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: FittedBox(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: AppStyle.kWhite,
              width: AppStyle.size.width,
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(ListChart.formList.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<FormProvider>(builder: (context, value, _) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CircleAvatar(
                            radius: 10,
                            backgroundColor: value.pageIndex == index
                                ? Colors.amber
                                : index > value.pageIndex
                                    ? AppStyle.kGrey
                                    : AppStyle.primary,
                            child: FittedBox(
                              child: Text(
                                " ${index + 1}",
                                style: AppTextStyles.h5.copyWith(
                                  color: value.pageIndex != index
                                      ? AppStyle.kBlack
                                      : AppStyle.kWhite,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                ListChart.formList[index].toString(),
                                style: AppTextStyles.h3.copyWith(
                                  color: value.pageIndex == index
                                      ? AppStyle.kBlack
                                      : index > value.pageIndex
                                          ? AppStyle.kBlack
                                          : AppStyle.primary,
                                ),
                              ),
                              Icon(
                                Icons.arrow_forward_ios,
                                color: value.pageIndex == index
                                    ? AppStyle.kBlack
                                    : index > value.pageIndex
                                        ? AppStyle.kBlack
                                        : AppStyle.primary,
                              )
                            ],
                          ),
                        ],
                      );
                    }),
                  );
                }),
              ),
            ),
          ),
        ),
        background: Image.network(
          "https://images.unsplash.com/photo-1633383718081-22ac93e3db65?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8Y3VyZCUyMHJpY2V8ZW58MHx8MHx8&w=1000&q=80",
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
