import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learning/Login/provider/login_provider.dart';

import '../../Dash_board/view/dash_board_view.dart';
import '../model/login_user_model.dart';

class LoginView extends ConsumerStatefulWidget {
  const LoginView({super.key});

  @override
  ConsumerState<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends ConsumerState<LoginView> {

  final nameController = TextEditingController();
  final emailController = TextEditingController();

  void submitForm() {
    final name = nameController.text;
    final email = emailController.text;

    if (name.isEmpty || email.isEmpty) return;

    final user = LoginUser(name: name, email: email);
    ref.read(loginUserViewModelProvider.notifier).submitUser(user);
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashBoardView()));
  }


  @override
  Widget build(BuildContext context) {
    final state = ref.watch(loginUserViewModelProvider);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login",style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
      ),
      body: Column(
        children: [
      Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(controller: nameController, decoration: InputDecoration(labelText: 'Name')),
          TextField(controller: emailController, decoration: InputDecoration(labelText: 'Email')),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: submitForm,
            child: Text('Submit'),
          ),
          SizedBox(height: 20),
          Text(state.toString())
        ],
      ),
    ),

        ],
      ),
    );
  }
}
