

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:untitled/modules/employee/show/cubit/show_employee_cubit.dart';
import 'package:untitled/shared/components/employee.dart';
import 'package:untitled/shared/components/text_components.dart';

class ShowEmployee extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding=MediaQuery.of(context).size.width/20;
    return BlocProvider(
      create: (BuildContext context) => ShowEmployeeCubit()..getEmployee(),
      child: BlocConsumer<ShowEmployeeCubit, ShowEmployeeState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = ShowEmployeeCubit.get(context);
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              height: h,
              width: 4 / 5 * w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  MyText(name: 'Employee'),
                  SizedBox(
                    height: 30,
                  ),

                  SizedBox(
                    height: 30,
                  ),
                  Container(

                    width: 4 / 5 * w,
                    height: 50,
                    decoration: BoxDecoration(
                        color:  Colors.white ,
                        boxShadow: <BoxShadow>[
                          BoxShadow(
                              color: Color.fromRGBO(0, 0, 0, 0.2),
                              blurRadius: 20) //blur radius of shadow
                        ]),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                                child: ShowText(name:'Id',
                                ),
                              )),
                          Expanded(
                              child: Center(
                                child: ShowText(name:'First Name',
                                ),
                              )),
                          Expanded(
                            child: Center(child: ShowText(name:'Last Name')),
                          ),
                          Expanded(
                              child: Center(
                                child: ShowText(name:'Job Name',
                                ),
                              )),
                          Expanded(
                            child: Center(child: ShowText(name:'Address')),
                          ),
                          Expanded(
                            child: Center(child: ShowText(name:'PhoneNumber')),
                          ),
                          Expanded(
                            child: Center(child: ShowText(name:'Update')),
                          ),

                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ShowEmployeeBuilder(
                          w,
                          cubit.showEmployeeModel?.data,
                          context,
                          state
                      )
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
