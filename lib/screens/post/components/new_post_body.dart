import 'package:flutter/material.dart';
import 'package:yarsi/widgets/widgets.dart';

import 'new_post_step_one.dart';
import 'new_post_step_two.dart';
import 'new_post_step_three.dart';
import 'new_post_step_four.dart';

class NewPostBody extends StatefulWidget {
  const NewPostBody({Key? key}) : super(key: key);

  @override
  State<NewPostBody> createState() => _NewPostBodyState();
}

class _NewPostBodyState extends State<NewPostBody> {

  // we have initialized active step to 0 so that
  // our stepper widget will start from first step
  int _activeCurrentStep = 0;

  TextEditingController address = TextEditingController();
  TextEditingController pincode = TextEditingController();

  // Here we have created list of steps
  // that are required to complete the form
  List<Step> stepList() => [
    // This is step1 which is called Account.
    // Here we will fill our personal details
    Step(
      state: _activeCurrentStep <= 0 ? StepState.editing : StepState.complete,
      isActive: _activeCurrentStep >= 0,
      title: const Text('تعریف پست', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),),
      content: NewPostStepOne()
    ),
    // This is Step2 here we will enter our address
    Step(
        state: _activeCurrentStep <= 1 ? StepState.editing : StepState.complete,
        isActive: _activeCurrentStep >= 1,
        title: const Text('پست تبلیغاتی', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),),
        content: NewPostStepTwo()
    ),

    // This is Step3 here we will display all the details
    // that are entered by the user
    Step(
        state: _activeCurrentStep <= 2 ? StepState.editing : StepState.complete,
        isActive: _activeCurrentStep >= 2,
        title: const Text('پست بازاریابی', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),),
        content: NewPostStepThree()
    ),
    Step(
        state: _activeCurrentStep <= 3 ? StepState.editing : StepState.complete,
        isActive: _activeCurrentStep >= 3,
        title: const Text('پرداخت هزینه', style: TextStyle(fontWeight: FontWeight.w800, color: Colors.black),),
        content: NewPostStepFour()
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stepper(
          type: StepperType.vertical,
          controlsBuilder: (context, _) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: <Widget>[
                  _activeCurrentStep != 0 ?
                  NormalButton(
                    text: "مرحله قبل",
                    press: () {
                      if (_activeCurrentStep == 0) {
                        return;
                      }

                      setState(() {
                        _activeCurrentStep -= 1;
                      });
                    },
                  ) : SizedBox.shrink(),
                  SizedBox(width: 5.0,),
                  _activeCurrentStep != 3 ?
                  NormalButton(
                    text: "مرحله بعد",
                    press: () {
                      print(_activeCurrentStep);
                      if (_activeCurrentStep < (stepList().length - 1)) {
                        setState(() {
                          _activeCurrentStep += 1;
                        });
                      }
                    },
                  ) : SizedBox.shrink(),
                ],
              ),
            );
          },
          currentStep: _activeCurrentStep,
          steps: stepList(),

          // onStepTap allows to directly click on the particular step we want
          onStepTapped: (int index) {
            setState(() {
              _activeCurrentStep = index;
            });
          },
        ),
    );
  }
}
