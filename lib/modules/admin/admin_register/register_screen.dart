import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/models/add_admin_model.dart';
import 'package:untitled/modules/admin/admin_register/cubit/register_admin_cubit.dart';
import 'package:untitled/modules/teachers/add/cubit/add_teacher_cubit.dart';
import 'package:untitled/shared/components/text_components.dart';
import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';

class RegisterAdmin extends StatelessWidget {
  const RegisterAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var FirstnameController = TextEditingController();
    var LastnameController = TextEditingController();
    var email=TextEditingController();
    var password=TextEditingController();
    var formkey = GlobalKey<FormState>();
    double w = MediaQuery
        .of(context)
        .size
        .width;
    double h = MediaQuery
        .of(context)
        .size
        .height;
    return BlocProvider(
      create: (context) => RegisterAdminCubit(),
      child: BlocConsumer<RegisterAdminCubit, RegisterAdminState>(
        listener: (context, state) {
          if (state is RegisterAdminErrorState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                Text(state.toString(),
                    style: TextStyle(color: Colors.white))));
          }
          if (state is RegisterAdminSuccessgState) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Registered Successfully',
                  style: TextStyle(color: Colors.white),
                ))
            );
            showDialog(
                context: context,
                builder: (ctx) => Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AlertDialog(

                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(
                              Radius.circular(10.0))),

                      title: MyText(name: "Email & Password", size: 25),
                      content: Container(
                        width: w/4,height: h/4,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                           Container(
                             width: w/4,height: h/15,
                             child: Center(child: Text('${RegisterAdminCubit.get(context).addAdminModel!.data!.email!}')),
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                               border: Border.all(
                                 color: kDarkBlue2Color,
                                 width: 2,
                               ),
                             ),
                           ),
                            SizedBox(height: h/80,),
                            Container(
                              width: w/4,height: h/15,
                              child: Center(child: Text('${RegisterAdminCubit.get(context).addAdminModel!.data!.passwordDecoded!}')),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: kDarkBlue2Color,
                                  width: 2,
                                ),
                              ),
                            ),
                            SizedBox(height: h/80,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                  },
                                  child: Text('OK'),


                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      actions: [

                      ],
                    ),
                  ],
                ));
            //todo: Navigate to home
          }
        },
        builder: (context, state) {
          var cubit = RegisterAdminCubit.get(context);
          return Container(
            width: w - (w / 5) - 5,
            decoration: BoxDecoration(
              color: Colors.white24,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MyText(
                      name:"Enter Admin Data : ",

                    ),
                    Form(
                      key: formkey,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Row(
                              children: [
                                Expanded(
                                  child: buildSForm(
                                    controller: FirstnameController,
                                    labeltext: 'First Name',
                                  ),
                                ),
                                SizedBox(
                                  width: w / 30,
                                ),
                                Expanded(
                                    child: buildSForm(
                                        controller: LastnameController,
                                        labeltext: ' Last Name')),
                              ],
                            ),
                          ),



                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(16.0),
                    ),
                    state is! RegisterAdminLoadingState
                        ? defaultButton(
                        text: 'insert',
                        width: w / 5,
                        height: h / 20,
                        onPressed: () {
                          cubit.adminRegister(
                            fname: FirstnameController.text,
                            lname: LastnameController.text,

                          );
                        })
                        : Center(child: CircularProgressIndicator()),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}



