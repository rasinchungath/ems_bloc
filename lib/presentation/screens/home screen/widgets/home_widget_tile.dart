import 'package:flutter/material.dart';
import '../../../../core/colors/colors.dart';
import '../../../../core/constants/constant.dart';
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
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(23.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: height * 0.048,
                width: width * .55,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFFC9C9CB),
                    width: 0.5,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0XFFE7ECED),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/Lens Icon.png',
                        height: height * 0.05,
                        width: width * 0.04,
                      ),
                      Flexible(
                        child: TextFormField(
                          focusNode: focusNode,
                          keyboardType: TextInputType.number,
                          controller: searchController,
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(
                              left: 8,
                              right: 8,
                              bottom: 13,
                            ),
                            hintText: 'Search',
                            hintStyle: kSearchStyle,
                            border: InputBorder.none,
                          ),
                          style: kSearchStyle,
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
                  height: height * 0.05,
                  width: width * 0.1,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4.0),
                    color: const Color(0XFF556080),
                  ),
                  child: const Icon(
                    Icons.add,
                    size: 35,
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
