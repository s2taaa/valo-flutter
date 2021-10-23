part of 'login.dart';

class LoginScreen extends GetView<LoginController> {
  final _phoneInput = TextEditingController();
  final _passwordInput = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.keyboard_backspace_rounded),
            backgroundColor: AppColors.primary,
            onPressed: () {
              Navigator.of(context).pop(true);
            }),
        body: Background(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/icons/logo.svg',
                  width: size.width * 0.5,
                  color: AppColors.light,
                ),
                SizedBox(height: size.height * 0.05),
                RoundedInputField(
                  controller: _phoneInput,
                  hintText: "Enter phone number",
                  labelText: 'Phone number:',
                  keyboardType: TextInputType.phone,
                  inputFormat: [FilteringTextInputFormatter.digitsOnly],
                  textColor: AppColors.light,
                  icon: Icons.phone,
                  onChanged: (value) {},
                ),
                RoundedInputField(
                  controller: _passwordInput,
                  hintText: 'Enter Password',
                  labelText: 'Password:',
                  password: true,
                  icon: Icons.lock,
                  textColor: AppColors.light,
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: 'signin'.tr.toUpperCase(),
                  color: Colors.white,
                  textColor: AppColors.primary,
                  onPressed: () => {
                    controller.login(_phoneInput.text, _passwordInput.text),
                  },
                ),
                SizedBox(height: size.height * 0.03),
                AlreadyHaveAnAccountCheck(press: () {
                  Get.off(() => AuthScreen(), binding: AuthBinding());
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
