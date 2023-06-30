import 'package:ems_bloc/presentation/screens/home%20screen/widgets/home_widget_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/colors/colors.dart';
import '../add employee screen/add_employee_screen.dart';
import '../employee detail screen/employee_detail_screen.dart';
import 'bloc/home_bloc.dart';
import 'widgets/home_appbar.dart';
import 'widgets/list_tile_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController searchController = TextEditingController();

  final HomeBloc homebloc = HomeBloc();

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
                        builder: (context) => EmployeeDetailsScreen(
                              homeBloc: homebloc,
                              employee: state.employee,
                            )));
              } else if (state is HomeAddEmployeeState) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AddEmployeeDetailsScreen(
                              homebloc: homebloc,
                            )));
              } else if (state is HomeSearchEmployeeUnavailableState) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Employee not available')));
              }
            },
            builder: (context, state) {
              switch (state.runtimeType) {
                case HomeLoadingState:
                  return const Center(child: CircularProgressIndicator());
                case HomeLoadingSuccessState:
                  final successState = state as HomeLoadingSuccessState;
                  return SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: HomeWidgetTile(
                      focusNode: focusNode,
                      employees: successState.employees,
                      homebloc: homebloc,
                      searchController: searchController,
                      listview: ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: successState.employees.length,
                        itemBuilder: (context, index) => Padding(
                          padding: EdgeInsets.only(left: width * 0.057),
                          child: ListTileWidget(
                            homebloc: homebloc,
                            employee: successState.employees[index],
                          ),
                        ),
                      ),
                    ),
                  );
                case HomeSearchEmployeeState:
                  final searchState = state as HomeSearchEmployeeState;
                  return HomeWidgetTile(
                    focusNode: focusNode,
                    employees: searchState.employees,
                    homebloc: homebloc,
                    searchController: searchController,
                    listview: ListTileWidget(
                      homebloc: homebloc,
                      employee: searchState.employee,
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
