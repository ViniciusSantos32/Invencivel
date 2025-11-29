import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:invencivelemtfodasimfdsovinicius/P%C3%A1gina_inicial/email_google.dart';
import 'package:invencivelemtfodasimfdsovinicius/P%C3%A1gina_inicial/pagina_inicial_login.dart';
import 'package:invencivelemtfodasimfdsovinicius/controllers/Customtextfield.dart';
import 'package:invencivelemtfodasimfdsovinicius/controllers/usuario.dart';

class CriacaoDeConta extends StatefulWidget {
  const CriacaoDeConta({super.key});

  

  @override
  State<CriacaoDeConta> createState() => _CriacaoDeContaState();
}

class _CriacaoDeContaState extends State<CriacaoDeConta> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Criação da conta'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFcbbeb3)
        ),
        child: Column(
          children: [
            Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Customtextfield(labeltext: "Nome", controller: _firstNameController, validator:  (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu nome';
                  }
                  return null;
                },),
              const SizedBox(height: 16),
              Customtextfield(labeltext: "Sobrenome", controller: _lastNameController, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu sobrenome';
                  }
                  return null;
                },),
              const SizedBox(height: 16),
              Customtextfield(labeltext: "email", controller: _emailController, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira seu e-mail';
                  }
                  if (!value.contains('@')) {
                    return 'Por favor, insira um e-mail válido';
                  }
                  return null;
                },),
              const SizedBox(height: 16),
              Customtextfield(labeltext: "Senha", controller: _passwordController, validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor, insira sua senha';
                  }
                  if (value.length < 6) {
                    return 'A senha deve ter pelo menos 6 caracteres';
                  }
                  return null;
                },),

              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    // Processar o cadastro
                     final result = await cadastro(_emailController.text, _passwordController.text, _firstNameController.text + _lastNameController.text);

                      if(result["mensagem"] == "Usuário cadastrado com sucesso!"){
                        Get.snackbar("Sucesso", "Conta criada com sucesso!");
                        Get.to(PaginainicialLogin());
                      }else{
                        Get.snackbar("Erro", "Falha no cadastro. Tente novamente.");
                      }

                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processando cadastro...')),
                    );
                  }
                },
                child: const Text('Criar'),
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  Get.to(EmailGoogle());
                },
                child: const Text(
                  'Não tenho um e-mail',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
          ],
        ),
      )
    );
  }
}