import 'package:cubit_form/cubit_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:untitled/models/student_model.dart';
import 'package:untitled/modules/students/register/register_cubit.dart';
import 'package:untitled/shared/components/text_components.dart';

import 'package:untitled/styles/colors.dart';
import '../../../shared/components/components.dart';

class StudentRegisterScreen extends StatelessWidget {
  var FnameController = TextEditingController();

  var LnameController = TextEditingController();

  var FatherController = TextEditingController();

  var fatherPhoneController = TextEditingController();

  var FmotherController = TextEditingController();

  var LmotherController = TextEditingController();

  var motherPhoneController = TextEditingController();

  var nationalitycontroller = TextEditingController();

  var detailsController = TextEditingController();

  var addressController = TextEditingController();

  var email=TextEditingController();

  var password=TextEditingController();

  List<String> YN = ['Don\'t have siblings'];

  var formkey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double padding=MediaQuery.of(context).size.width/20;
    double borderwidth = 1;
    double ddp = 20.0;
     //email.text=RegisterCubit.get(context).student!.data!.email!;
  //  password.text=RegisterCubit.get(context).student!.data!.passwordDecoded.toString();
    // FnameController.text=RegisterCubit.get(context).student!.data!.firstName!;
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterError)
          {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.red,
                content:
                    Text(state.error, style: TextStyle(color: Colors.white))));

          }

          if (state is RegisterSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                backgroundColor: Colors.green,
                content: Text(
                  'Registered Successfully',
                  style: TextStyle(color: Colors.white),
                )));
            (RegisterCubit.get(context).ischeck==0) ?

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
                        width: w/4,height: h/2+h/8,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(name: 'Student\'s Email',size: 20 ),
                            Container(
                              width: w/4,height: h/15,
                              child: Center(child: Text('${RegisterCubit.get(context).studentModel!.data!.studentEmail!}')),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: kDarkBlue2Color,
                                  width: 2,
                                ),
                              ),
                            ),
                            SizedBox(height: h/80,),
                            MyText(name: 'Student\'s Password',size: 20 ),
                            Container(
                              width: w/4,height: h/15,
                              child: Center(child: Text('${RegisterCubit.get(context).studentModel!.data!.studentPasswordDecoded!}')),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: kDarkBlue2Color,
                                  width: 2,
                                ),
                              ),
                            ),

                            SizedBox(height: h/80,),
                            MyText(name: 'Parent\'s Email', size: 20 ),
                            Container(
                              width: w/4,height: h/15,
                              child: Center(child: Text('${RegisterCubit.get(context).studentModel!.data!.parentEmail!}')),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: kDarkBlue2Color,
                                  width: 2,
                                ),
                              ),
                            ),
                            SizedBox(height: h/80,),
                            MyText(name: 'Parent\'s Password',size: 20 ),
                            Container(
                              width: w/4,height: h/15,
                              child: Center(child: Text('${RegisterCubit.get(context).studentModel!.data!.parentPasswordDecoded!}')),

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
                    ),
                  ],
                )) :
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
                        width: w/4,height: h/3,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            MyText(name: 'Student\'s Email',size: 20 ),
                            Container(
                              width: w/4,height: h/15,
                              child: Center(child: Text('${RegisterCubit.get(context).studentModel!.data!.studentEmail!}')),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  color: kDarkBlue2Color,
                                  width: 2,
                                ),
                              ),
                            ),
                            SizedBox(height: h/80,),
                            MyText(name: 'Student\'s Password',size: 20 ),
                            Container(
                              width: w/4,height: h/15,
                              child: Center(child: Text('${RegisterCubit.get(context).studentModel!.data!.studentPasswordDecoded!}')),

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
                    ),
                  ],
                ));
            //todo: Navigate to home
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Stack(
            children: 
            [

              Container(
              width: w - (w / 5) - 5,
              height: h,

              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        MyText(name: 'Enter Student Data :'),
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
                                        controller: FnameController,
                                        labeltext: 'First Name',

                                      ),
                                    ),
                                    SizedBox(
                                      width: w / 30,
                                    ),
                                    Expanded(
                                        child: buildSForm(
                                            controller: LnameController,
                                            labeltext: ' Last Name')),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: buildSForm(
                                            controller: addressController,
                                            labeltext: 'Address')),
                                    SizedBox(
                                      width: w / 30,
                                    ),
                                    Expanded(
                                      child: Container(
                                        height: 50,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            width: borderwidth,
                                            color: kDarkBlue2Color,
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("${cubit.selectedDate}"
                                                .split(' ')[0],

                                            ),

                                            SizedBox(
                                              width: 20,
                                            ),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.white54.withOpacity(0.1),
                                                foregroundColor: kGold1Color,
                                                side: BorderSide(
                                                    width: 1, color: Colors.white),
                                                elevation: 0,
                                              ),
                                              onPressed: () =>
                                                  cubit.selectDate(context),
                                              child: const Text(
                                                'Select date of birth',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                        child: buildSForm(
                                            controller: detailsController,
                                            labeltext: 'Details')),
                                    SizedBox(
                                      width: w / 30,
                                    ),
                                    Expanded(
                                        child: buildSForm(
                                            controller: nationalitycontroller,
                                            labeltext: 'National Id')),
                                    SizedBox(
                                      width: w / 30,
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: w / 7,
                                        child: CheckboxListTile(
                                          checkColor: Colors.white,
                                          activeColor: kDarkBlue2Color,
                                          title: Text(
                                            cubit.currText,
                                            style: TextStyle(
                                              color: kGold1Color,
                                              fontSize: 18,
                                            ),
                                          ),
                                          value: cubit.isChecked,
                                          onChanged: cubit.changeCheck,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: kDarkBlue2Color,
                                            width: borderwidth,
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Visibility(
                                visible: cubit.isChecked,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: buildSForm(
                                              controller: FatherController,
                                              labeltext: 'Father\'s Name')),
                                      SizedBox(
                                        width: w / 30,
                                      ),
                                      Expanded(
                                          child: buildSForm(
                                              controller: fatherPhoneController,
                                              labeltext: 'Father\'s Phone Number')),
                                    ],
                                  ),
                                ),
                              ),
                              Visibility(
                                visible: cubit.isChecked,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                          child: buildSForm(
                                              controller: FmotherController,
                                              labeltext: 'First Mother\'s Name')),
                                      SizedBox(
                                        width: w / 30,
                                      ),
                                      Expanded(
                                          child: buildSForm(
                                              controller: LmotherController,
                                              labeltext: 'Last Mother\'s Name')),
                                      SizedBox(
                                        width: w / 30,
                                      ),
                                      Expanded(
                                          child: buildSForm(
                                              controller: motherPhoneController,
                                              labeltext: 'Mother\'s Phone Number')),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: kDarkBlue2Color,
                                            width: borderwidth,
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: DropdownButton<String>(
                                          value: cubit.dropDownValue,
                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: kGold1Color,
                                          ),
                                          iconSize: 24,
                                          elevation: 40,
                                          borderRadius: BorderRadius.circular(40),
                                          underline: Container(),
                                          hint: Padding(
                                            padding:
                                             EdgeInsets.only(left: padding,right: padding),
                                            child: Text(
                                              'Choose Religion',
                                              style: TextStyle(
                                                  color: kDarkBlue2Color,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          onChanged: (newValue) {
                                            cubit.changeDropDownButton(newValue!);
                                          },
                                          items: cubit.ReligionItems,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w / 30,
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: kDarkBlue2Color,
                                            width: borderwidth,
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: DropdownButton<String>(
                                          value: cubit.gender,

                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: kGold1Color,
                                          ),
                                          iconSize: 24,
                                          elevation: 40,
                                          borderRadius: BorderRadius.circular(40),

                                          underline: Container(),

                                          hint: Padding(
                                            padding:
                                                 EdgeInsets.only(left:padding, right: padding,),
                                            child: Text(
                                              'Choose Gender',
                                              style: TextStyle(
                                                  color: kDarkBlue2Color,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          //  style: ,
                                          onChanged: (ng) {
                                            cubit.changeGenderDropDownButton(ng!);
                                          },

                                          items: cubit.GenderItems,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: w / 30,
                                    ),
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: kDarkBlue2Color,
                                            width: borderwidth,
                                          ),
                                          borderRadius: BorderRadius.circular(20),
                                        ),
                                        child: DropdownButton<String>(
                                          value: cubit.grade,

                                          icon: Icon(
                                            Icons.keyboard_arrow_down,
                                            color: kGold1Color,
                                          ),
                                          iconSize: 24,
                                          elevation: 40,
                                          borderRadius: BorderRadius.circular(40),

                                          underline: Container(),

                                          hint: Padding(
                                            padding:  EdgeInsets.only(
                                              right: padding,
                                              left: padding,
                                            ),
                                            child: Text(
                                              'Choose Grade',
                                              style: TextStyle(
                                                  color: kDarkBlue2Color,
                                                  fontSize: 16),
                                            ),
                                          ),
                                          //  style: ,
                                          onChanged: (gr) {
                                            cubit.changeGradeDropDownButton(gr!);
                                          },

                                          items: cubit.GradeItems,
                                        ),
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(left: padding,right: padding,),
                        ),
                        state is! RegisterLoading
                            ? defaultButton(
                                text: 'insert',
                                width: w / 5,
                                height: h / 20,
                                onPressed: () {

                                cubit.StudentRegister(
                                    first_name: FnameController.text,
                                    last_name: LnameController.text,
                                    father_name: FatherController.text,
                                    father_phone: fatherPhoneController.text,
                                    first_mother_name: FmotherController.text,
                                    last_mother_name: LmotherController.text,
                                    mother_phone: motherPhoneController.text,
                                    address: addressController.text,
                                    detailes: detailsController.text,
                                    religion: cubit.dropDownValue.toString(),
                                    genderr: cubit.gender.toString(),
                                    grade_number: cubit.gradeID,
                                    have_kids: cubit.ischeck,
                                    date_of_birth: cubit.selectedDate.toString(),
                                    national_id: nationalitycontroller.text,



                                  );
                                })
                            : Center(child: CircularProgressIndicator()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
          );
        },
      ),
    );
  }
}
