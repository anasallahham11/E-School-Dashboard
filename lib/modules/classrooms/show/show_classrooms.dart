import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/material.dart';
import 'package:untitled/modules/classrooms/show/cubit/show_classrooms_cubit.dart';
import 'package:untitled/modules/classrooms/show/cubit/show_classrooms_states.dart';
import 'package:untitled/modules/students/show/cubit/show_students_cubit.dart';
import 'package:untitled/modules/students/show/cubit/show_students_states.dart';
import 'package:untitled/modules/subjects/show/cubit/show_subjects_cubit.dart';
import 'package:untitled/modules/subjects/show/cubit/show_subjects_states.dart';
import 'package:untitled/shared/components/components.dart';
import 'package:untitled/shared/components/search_bar.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';

class ClassroomsShow extends StatelessWidget {
  var searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return BlocProvider(
      create: (BuildContext context) => ShowClassroomsCubit()..getClassrooms(),
      child: BlocConsumer<ShowClassroomsCubit, ShowClassroomsStates>(
        listener: (context, state) {

          if (state is ClearClassroomsSuccessState) {
            if(state.clearClassroom.status == true) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.green,
                  content:
                  Center(
                    child: Text(
                        '${state.clearClassroom.message}',
                        style: TextStyle(color: Colors.white)),
                  )));
            } else  {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  backgroundColor: Colors.red,
                  content: Center(
                    child: Text(
                      '${state.clearClassroom.message}',
                      style: TextStyle(color: Colors.white),
                    ),
                  )));

            }}

        },
        builder: (context, state) {
          var cubit = ShowClassroomsCubit.get(context);
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
                  MyText(name: 'Classrooms'),
                  SizedBox(
                    height: h/16,
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
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                              child: Center(
                                child: ShowText(name:'Id',
                                ),
                              )),
                          Expanded(
                              child: Center(
                                child: ShowText(name:'Room Number',
                                ),
                              )),
                          Expanded(
                            child: Center(child: ShowText(name:'Grade')),
                          ),
                          Expanded(
                            child: Center(child: ShowText(name:'Capacity')),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ShowClassroomsBuilder(
                          w,
                          cubit.classroomModel?.data,
                          context,
                          state
                      )
                  ),
                  Padding(
                    padding:  EdgeInsets.all(h/45),
                  ),
                  state is! ClearClassroomsLoadingState
                      ? defaultButton(
                      text: 'Clear Classrooms',
                      width: w / 5,
                      height: h / 20,
                      buttColor: Colors.orangeAccent,
                      onPressed: () {
                        cubit.clearClassrooms(

                        );
                      })
                      : Center(child: CircularProgressIndicator()),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
