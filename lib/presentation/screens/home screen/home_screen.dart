import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/colors/colors.dart';
import '../../../core/constants/constant.dart';
import '../add employee screen/add_employee_screen.dart';
import '../employee detail screen/employee_detail_screen.dart';
import 'bloc/home_bloc.dart';
import 'widgets/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  final HomeBloc homebloc = HomeBloc();

  // bool isEmpAvailable(int id, List<Employee> employeeList) {
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    homebloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: GestureDetector(
        onTap: () {
          focusNode.unfocus();
        },
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: homeAppbar,
          body: BlocConsumer<HomeBloc, HomeState>(
            bloc: homebloc,
            listener: (context, state) {
              if (state is HomeNavigateToEmployeeDetailPageState) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  EmployeeDetailsScreen(homeBloc: homebloc,)));
              } else if (state is HomeAddEmployeeState) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                             AddEmployeeDetailsScreen(homebloc: homebloc,)));
              }
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case HomeLoadingState:
                  return const Center(child: CircularProgressIndicator());
                case HomeLoadingSuccessState:
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
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
                                  // int id = int.parse(searchController.text);
                                  // searchEmployee(id, controller.employeeList);
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
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: employeeName.length,
                          // controller.employeeList.length,
                          itemBuilder: (context, index) => Padding(
                            padding: EdgeInsets.only(left: width * 0.057),
                            child: ListTile(
                              minLeadingWidth: 7,
                              onTap: () {
                                homebloc
                                    .add(HomeEmployeeDetailPageNavigateEvent());
                                // Get.to(EmployeeDetailsScreen(
                                //     employee:
                                //         controller.employeeList[index]));
                              },
                              onLongPress: () {
                                // showAlertDialog(
                                //   context: context,
                                //   onPressed: () async {
                                //     Get.back();
                                //     await controller.deleteEmployee(
                                //         controller.employeeList[index].id);
                                //     Get.snackbar(
                                //       'Deleted',
                                //       'Employee detail deleted successfully',
                                //       snackPosition: SnackPosition.BOTTOM,
                                //       backgroundColor:
                                //           const Color(0XFF556080),
                                //       colorText: const Color(0XFFE6FAFC),
                                //     );
                                //   },
                                // );
                              },
                              leading: Image.asset(
                                'assets/images/Profile Picture 1.png',
                                height: 32,
                                width: 32,
                              ),
                              title:  Text(
                                employeeName[index],
                                //'${controller.employeeList[index].empFirstName} ${controller.employeeList[index].empLastName}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: Color(0XFF41485F),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                case HomeErrorState:
                  return const Center(
                    child: Text('Error'),
                  );
                default:
                  return const SizedBox();
              }
            },
          ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(right: 12, bottom: 18),
            child: InkWell(
              onTap: () {
                homebloc.add(HomeAddEmployeeButtonClickedEvent());
                // Get.to(
                //   const AddEmployeeDetailsScreen(),
                // );
              },
              child: Container(
                height: height * 0.07,
                width: width * 0.15,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: const Color(0XFF556080),
                ),
                child: const Icon(
                  Icons.add,
                  size: 50,
                  color: kBGcolor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
