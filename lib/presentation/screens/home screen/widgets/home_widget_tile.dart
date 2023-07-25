import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/colors/colors.dart';
import '../../../../domain/models/employee_model.dart';
import '../bloc/home_bloc.dart';

class HomeWidgetTile extends StatelessWidget {
  final TextEditingController searchController;

  final Widget listview;
  final HomeBloc homebloc;
  final List<Employee> employees;
  final FocusNode focusNode;

  const HomeWidgetTile({
    super.key,
    required this.searchController,
    required this.listview,
    required this.homebloc,
    required this.employees,
    required this.focusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        BlocBuilder<HomeBloc, HomeState>(
          bloc: homebloc,
          builder: (context, state) {
            switch (state.runtimeType) {
              case HomeSearchEmployeeState:
                return IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: kBackButtonColor,
                      size: 30.sp,
                    ),
                    onPressed: () {
                      homebloc.add(HomeInitialEvent());
                    });
              default:
                return const SizedBox();
            }
          },
        ),
        Padding(
          padding: EdgeInsets.all(10.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 30.h,
                width: 182.w,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFC9C9CB),
                    width: 0.5.sp,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0XFFE7ECED),
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.r,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/Lens Icon.png',
                        height: 13.h,
                        width: 13.w,
                      ),
                      Flexible(
                        child: TextFormField(
                          focusNode: focusNode,
                          keyboardType: TextInputType.number,
                          controller: searchController,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 8.w,
                              right: 8.w,
                              bottom: 13.h,
                            ),
                            hintText: 'Search Employee',
                            hintStyle: TextStyle(
                              color: kSearchTextColor,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            color: kSearchTextColor,
                            fontSize: 12.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () async {
                  focusNode.unfocus();
                  int id = int.parse(searchController.text);
                  homebloc.add(
                    HomeSearchEmployeeButtonClickedEvent(
                      employee: employees,
                      id: id,
                    ),
                  );
                  searchController.clear();
                },
                child: Container(
                  height: 30.h,
                  width: 30.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.r),
                    color: const Color(0XFF556080),
                  ),
                  child: Icon(
                    Icons.search,
                    size: 18.sp,
                    color: kBGcolor,
                  ),
                ),
              ),
            ],
          ),
        ),
        listview, //employee details will list here
      ],
    );
  }
}
