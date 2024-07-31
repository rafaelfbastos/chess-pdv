import 'package:chess_pdv/app/core/helpers/environment.dart';
import 'package:chess_pdv/app/core/ui/messages.dart';
import 'package:chess_pdv/app/core/ui/theme_extension.dart';
import 'package:chess_pdv/app/core/widgets/custom_input.dart';
import 'package:chess_pdv/app/modules/auth/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';
import 'package:loader_overlay/loader_overlay.dart';

class LoginPage extends StatefulWidget {
  final LoginStore _loginStore;

  const LoginPage({super.key, required LoginStore LoginStore})
      : _loginStore = LoginStore;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final toDispose = <ReactionDisposer>[];

  @override
  void initState() {
    
   final loadReaction = reaction((__)=> widget._loginStore.loading, (loading){
      if(loading){
        context.loaderOverlay.show();
      }else{
        context.loaderOverlay.hide();
      }
    });

    final errorMessage = reaction((__)=> widget._loginStore.error, (error){
      if(error.isNotEmpty){
        Messages.of(context).showError(error);
        widget._loginStore.setError('');
      }
    });

    final isLogged = reaction((__)=> widget._loginStore.isLogged, (isLogged){
      if(isLogged){
        Navigator.of(context).pushReplacementNamed('/');
      }
    });

    toDispose.addAll([loadReaction, errorMessage, isLogged]);


    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailEC.dispose();
    passwordEC.dispose();
    // ignore: avoid_function_literals_in_foreach_calls
    toDispose.forEach((d) => d());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Row(
          children: [
            Expanded(
                flex: 4,
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Image.asset(Environment.logoUrl)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: CustomInput(
                          controller: emailEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Campo obrigatório'),
                            Validatorless.email('E-mail inválido')
                          ]),
                          label: 'Email',
                          obscureText: false,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        child: CustomInput(
                          controller: passwordEC,
                          validator: Validatorless.multiple([
                            Validatorless.required('Campo obrigatório'),
                          ]),
                          label: 'Senha',
                          obscureText: true,
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 10),
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: ElevatedButton(
                                style: context.primaryButtonStyle,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    widget._loginStore.login(
                                        emailEC.text, passwordEC.text);
                                  }
                                },
                                child: const Text(
                                  'ENTRAR',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w300),
                                ),
                              ),
                            ),
                          )),
                    ],
                  ),
                )),
            Expanded(
              flex: 6,
              child: Container(
                height: double.maxFinite,
                color: Colors.white38,
                child: Image.asset(
                  Environment.backgroudUrl,
                  fit: BoxFit.cover,
                ),
              ),
            )
          ],
        ));
  }
}
