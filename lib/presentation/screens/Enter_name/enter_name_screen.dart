import 'package:flutter/material.dart';
import '../../../constants/components/components.dart';
import '../../layouts/emaiel_layout_screen.dart';

class NameScreen extends StatelessWidget {
  //const NameScreen({Key key}) : super(key: key);
  var nameControler = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Splash.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/emaieogo.png'),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: new Directionality(
                    textDirection: TextDirection.rtl,
                    child: defaultFormText(
                      controller: nameControler,
                      type: TextInputType.name,
                      // lable: 'رقم الهاتف..',
                      hint: 'اسم المستخدم',
                      prefixIcon: Icons.person,
                      validate: (value) {
                        if (value.isEmpty) {
                          showToast(
                              msg: 'من فضلك ادخل الاسم بطريقة صحيحة :)',
                              background: Colors.red);
                          return 'من فضلك ادخل الاسم بطريقة صحيحة :)';
                        }
                        return null;
                      },
                    ),
                  )),
              SizedBox(
                height: 5,
              ),
              defaultButton(
                  width: 300,
                  text: 'استمرار',
                  function: () {
                    if (formKey.currentState!.validate()) {
                      navigateAndFinish(context, AppLayout());
                    }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
