import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_up/shared/themes/text_styles.dart';
class FormEditPage extends StatelessWidget {
  const FormEditPage({Key? key, required this.titulo,
    required this.controller, required this.kayboard, required this.errorVazio,
    required this.hintText, required this.formKey}) : super(key: key);
  final String titulo;
  final TextEditingController controller;
  final TextInputType kayboard;
  final String errorVazio;
  final String hintText;
  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width*0.9,
      child: Form(
        key: formKey,
        child: TextFormField(
          keyboardType: kayboard,
          onChanged: (String value) {
            formKey.currentState!.validate();

          },
          controller: controller,
          style: const TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
              fillColor: Colors.black,
              labelText: titulo,
              labelStyle: TextStyles.titleRegular,
              hintText: hintText,
              focusedBorder: OutlineInputBorder()),
          validator: (String? value) {
            if (value == null || value.isEmpty) {
              return errorVazio;
            }
            if(titulo=="Rating"||titulo=="Price"){
              if(titulo=="Rating"){
                int val=int.parse(value);
                if(val>5){
                  return "Não pode ser Maior que 5";
                }

              }
              if(!value.isNum){
                return "Insira Somente Numeros";
              }
            }



            return null;
          },
          maxLines: 1,
        ),
      ),


    );
  }
}
