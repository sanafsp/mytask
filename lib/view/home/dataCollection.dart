import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mytask/view/home/viewData.dart';
import 'package:mytask/view/widget/appBar.dart';
import 'package:mytask/view/widget/button.dart';
import 'package:shared_preferences/shared_preferences.dart';
final formKey=GlobalKey<FormState>();
TextEditingController nameController=TextEditingController();
TextEditingController ageController=TextEditingController();
List<String>courseName=["Flutter","Python","Java","UI/UX","PHP"];


class DataCollection extends StatefulWidget {
  const DataCollection({super.key});

  @override
  State<DataCollection> createState() => _DataCollectionState();
}

class _DataCollectionState extends State<DataCollection> {

  login(context){
if(formKey.currentState!.validate()){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewData()));
}
  }

  dateShow(){
    showDatePicker(context: context, firstDate: DateTime(2000), 
    lastDate: DateTime.now()).then((datepick){
      if(datepick==null){
        return null;
      }
      else{
        setState(() {
          dateofbirth=datepick;
          print(DateFormat('dd-MM-yyyy').format(dateofbirth!));
        });
      }
    });
  }
 File? imagedata;
  final image = ImagePicker();

  Future<void> imagePicked() async {
    XFile? pickedimage = await image.pickImage(source: ImageSource.gallery);
    if (pickedimage != null) {
      setState(() {
        imagedata = File(pickedimage.path);
      });
    }
  }

  String InitialValue=courseName.first;
  DateTime? dateofbirth;


Future<void> saveDate(String name,int age,String course,String dob, String photoPath)async{
 SharedPreferences pref=await SharedPreferences.getInstance();
 await pref.setString('name', name);
 await pref.setInt('age', age);
 await pref.setString('course', course);
 await pref.setString('dob', dob);
 await pref.setString('photoPath', photoPath);
 
}

Future<void> getData()async{
  SharedPreferences pref=await SharedPreferences.getInstance();
  String name=pref.getString('name')??'';
  int age=pref.getInt('name')??0;
   String course=pref.getString('course')??'';
    String dob=pref.getString('dob')??'';
     String photoPath=pref.getString('photoPath')??'';

}

// List<String> names=[];
// List<int> ages=[];
// List<String> course=[];
// List<DateTime> dob=[];
// List<File>photo=[];
// Future<void> storedata(yourname,agenum,courses,dobdata,photodata)async{
//   names.add(yourname);
//   ages.add(agenum);
//   course.add(courses);
//   dob.add(dobdata);
//   photo.add(photodata);
  
//   final pref=await SharedPreferences.getInstance();
//   setState(() {
//   names;
//   ages;
//   course;
//   dob;
//   photo;
//   });
//   await pref.setStringList("name", names);
//   await pref.setInt("num", ages as int);
//   await pref.setStringList("class", course);
//   await pref.setStringList("birth", dob.cast<String>());
//   await pref.setStringList("pic", photo.cast<String>());

// }

// Future<void>getData()async{
//   final pref=await SharedPreferences.getInstance();
//   setState(() {
//     names=pref.getStringList("names")!;
//   });
// }


// @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar:  appbar1(context,"Data Collection"),
     body: 
     SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(30.0),
         child: Form(
          key: formKey,
           child: Column(
             children: [
               TextFormField(
                controller: nameController,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter valid name";
                  }
                },
                decoration: InputDecoration(labelText: "Enter your name"),
               ),
                TextFormField(
                  keyboardType: TextInputType.number,
                controller: ageController,
                validator: (value) {
                  if(value!.isEmpty){
                    return "Enter valid age";
                  }
                },
                decoration: InputDecoration(labelText: "Enter your age"),
               ),
              
             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Text("Course:"),
              
             DropdownButton(value: InitialValue,items: courseName.map((String value){
              return DropdownMenuItem(child: Text(value),value: value,);
             }).toList(), onChanged: (String? value){
              setState(() {
                InitialValue=value!;
              });
             })
              ],
             ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            button(text: "Select Your Date of Birth",buttonAction: () {
              dateShow();
            },),
            Text(dateofbirth!=null? DateFormat('dd-mm-yyyy').format(dateofbirth!):"Not Selected"),
      ]),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Add your Photo:"),
              
             button(text: "Select",buttonAction: 
                 imagePicked,
               ),
               ],
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.5,
              width: MediaQuery.of(context).size.height*0.5,
              color: Colors.grey,
              child: imagedata!=null?
              Image.file(imagedata!):
              // TextButton(onPressed: imagePicked, child:Text("Image is not Selected") )
              Center(child: Text("Image is not Selected")),
            ),

              
              button(text: "Save",buttonAction: () {
                 login(context);
                 saveDate(nameController.text,ageController as int,
                 InitialValue,dateofbirth as String,imagedata as String);
                  
               },
               ),

             ],
           ),
         ),
       ),
     ),
      
    );
  }
}