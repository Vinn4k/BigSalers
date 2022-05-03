import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jr_up/app/controller/home_controller.dart';
import 'package:jr_up/app/data/model/item_model.dart';
import 'package:jr_up/app/widget/form_edit_page_widget.dart';

class EditItenPage extends StatelessWidget {
  const EditItenPage({Key? key, required this.dataForEdit,required this.isForEdit}) : super(key: key);
  final ItemModel dataForEdit;
  final bool isForEdit;

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descripController = TextEditingController();
    final TextEditingController typeController = TextEditingController();
    final TextEditingController ratinController = TextEditingController();
    final TextEditingController priceController = TextEditingController();
    final TextEditingController withController = TextEditingController();
    final TextEditingController heightController = TextEditingController();
    List<GlobalKey<FormState>> _formKeys = [
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
      GlobalKey<FormState>(),
      GlobalKey<FormState>()
    ];

    HomeController controller = Get.find<HomeController>();

controller.imageUrl.value=dataForEdit.filename!;
    bool shouldPop = true;
    bool clickInSave = false;
    ItemModel data = ItemModel();

    return WillPopScope(
      onWillPop: () async{
        if(isForEdit){
          shouldPop=true;
        }
        else{

          clickInSave? null:await Get.defaultDialog(title: "Aviso",middleText: "As Alterações Serão Perdidas",
              barrierDismissible: false,
              onConfirm: ()async{
            if(controller.imageUrl.value !=dataForEdit.filename){
             await controller.deleteUploadPhoto( url: controller.imageUrl.value);
            }
                shouldPop=true;
                Get.back();
              },
              onCancel: (){
                shouldPop=false;
              }
          );
        }
        return shouldPop;
      },
      child: Scaffold(
        appBar: AppBar(
            title: Text(dataForEdit.title ?? ""),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: Get.width * 0.5,
                  height: Get.height * 0.3,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Obx(() {
                      return Image.network(controller.imageUrl.value);
                    }),
                  ),
                ),
              ),
              Center(
                child: IconButton(
                  onPressed: () async {
                    await controller.uploadImage();
                  },
                  icon: const Icon(Icons.arrow_circle_up),
                ),
              ),
              FormEditPage(
                  titulo: "Title",
                  controller: titleController..text = dataForEdit.title ?? "",
                  kayboard: TextInputType.name,
                  errorVazio: "Não Pode Ser Vazio",
                  hintText: "Title",
                  formKey: _formKeys[0]),
              FormEditPage(
                  titulo: "Description",
                  controller: descripController
                    ..text = dataForEdit.description ?? "",
                  kayboard: TextInputType.name,
                  errorVazio: "Não Pode Ser Vazio",
                  hintText: "Description",
                  formKey: _formKeys[1]),
              FormEditPage(
                  titulo: "Type",
                  controller: typeController..text = dataForEdit.type ?? "",
                  kayboard: TextInputType.name,
                  errorVazio: "Não Pode Ser Vazio",
                  hintText: "Type",
                  formKey: _formKeys[2]),
              FormEditPage(
                  titulo: "Rating",
                  controller: ratinController
                    ..text = dataForEdit.rating.toString(),
                  kayboard: TextInputType.number,
                  errorVazio: "Não Pode Ser Vazio",
                  hintText: "Rating",
                  formKey: _formKeys[3]),
              FormEditPage(
                  titulo: "Price",
                  controller: priceController
                    ..text = dataForEdit.price.toString(),
                  kayboard: TextInputType.number,
                  errorVazio: "Não Pode Ser Vazio",
                  hintText: "Price",
                  formKey: _formKeys[4]),
              FormEditPage(
                  titulo: "height",
                  controller: heightController
                    ..text = dataForEdit.height.toString(),
                  kayboard: TextInputType.number,
                  errorVazio: "Não Pode Ser Vazio",
                  hintText: "height",
                  formKey: _formKeys[5]),
              FormEditPage(
                  titulo: "width",
                  controller: withController..text = dataForEdit.width.toString(),
                  kayboard: TextInputType.number,
                  errorVazio: "Não Pode Ser Vazio",
                  hintText: "width",
                  formKey: _formKeys[6]),


              Obx(() {
                return controller.loading.value
                    ? const CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: () async {
                    List error = [];
                    for (int i = 0; i <= 6; i++) {
                      if (_formKeys[i].currentState!.validate() != true) {
                        error.add("error$i");
                      }
                    }
                    if (error.isEmpty) {
                      data.width = int.tryParse(withController.value.text);
                      data.height = int.tryParse(heightController.value.text);
                      data.title = titleController.value.text;
                      data.description = descripController.value.text;
                      data.price = double.tryParse(priceController.value.text);
                      data.rating = int.tryParse(ratinController.value.text);
                      data.type = typeController.value.text;
                      data.filename = dataForEdit.filename;
                      clickInSave=true;
                     isForEdit? await controller.updateItem(data, dataForEdit.id.toString(),
                     ):controller.newItem(item: data);
                    }
                  },
                  child: const Text("Salvar"),);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
