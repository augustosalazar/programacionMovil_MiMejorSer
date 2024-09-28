import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/Controller/PracticeClass.dart';



class Practicecontroller extends GetxController{
  
  var npractices=0.obs;
  
  int get getnpractices=>npractices.value;

  var practiceslist=<Task>[].obs;


List<Task> get getpracticeslist =>practiceslist;

  void addpractices(Task value){
    practiceslist.add(value);
  }

  void removepractice(String value){
    practiceslist.removeWhere((practice)=>practice.name==value);
  }

Task getpractice(String value){
  for (var practice in practiceslist) {
    if (practice.getname==value){
      return practice;
    }
  }
  return Task(name:"",goal:"",pts:0,state: false);
}

addcounter(String name){
  for (var practice in practiceslist) {
    if (practice.getname==name){
      practice.counter++;
    }
  }
}

  // practices1  
  var p1=7.obs; //Valor meta
  var p1inpractice=0.obs; //Contador
  var p1choosen=false.obs; //Valor para verificar si ha sido eligido
  var p1finish=false.obs; //Valor para verificar si una practica ha sido terminada

  int get  p1Value=>p1.value; 
  int get p1inpracticeValue=>p8inpractice.value; 
  bool get p1choosenValue=>p1choosen.value; 
  bool get p1finishValue=>p1finish.value;

  // practices 2
 var p2 = <String>[].obs;
 var p2inpractice=<bool>[].obs;
 var p2choosen=false.obs;
 var p2finish=false.obs;

 List<String> get p2List =>p2;
 bool get p2ChoosenValue=>p2choosen.value;
 bool get p2FinishValue=>p2finish.value;

 //  practice3
  var p3=10.obs;
  var p3inpractice=0.obs;
  var p3choosen=false.obs;
  var p3finish=false.obs;

  int get  p3Value=>p3.value;
  int get p3inpracticeValue=>p3inpractice.value;
  bool get p3choosenValue=>p3choosen.value;
  bool get p3finishValue=>p3finish.value;

   // practices 4
 var p4 = <String>[].obs;
 var p4inpractice=<bool>[].obs;
 var p4choosen=false.obs;
 var p4finish=false.obs;

 List<String> get p4List =>p4;
 bool get p4ChoosenValue=>p4choosen.value;
 bool get p4FinishValue=>p4finish.value;

  // practices 5
 var p5 = <String,int>{}.obs;
 var p5inpractice=<bool>[].obs;
 var p5choosen=false.obs;
 var p5finish=false.obs;

 Map<String,int> get p5List =>p5;
 bool get p5ChoosenValue=>p5choosen.value;
 bool get p5FinishValue=>p5finish.value;


//  practice6
  var p6=10.obs;
  var p6inpractice=0.obs;
  var p6choosen=false.obs;
  var p6finish=false.obs;

  int get  p6Value=>p6.value;
  int get p6inpracticeValue=>p6inpractice.value;
  bool get p6choosenValue=>p6choosen.value;
  bool get p6finishValue=>p6finish.value;

 //practices7
  var p7=20.obs;
  var p7inpractice=0.obs;
  var p7choosen=false.obs;
  var p7finish=false.obs;

  int get  p7Value=>p7.value;
  int get p7inpracticeValue=>p7inpractice.value;
  bool get p7choosenValue=>p7choosen.value;
  bool get p7finishValue=>p7finish.value;


  //practice8
  var p8=20.obs;
  var p8inpractice=0.obs;
  var p8choosen=false.obs;
  var p8finish=false.obs;

  int get  p8Value=>p8.value;
  int get p8inpracticeValue=>p8inpractice.value;
  bool get p8choosenValue=>p8choosen.value;
  bool get p8finishValue=>p8finish.value;

  increment(int index){
    switch(index){
      case 1:
      if(p1.value!=15){
        p1.value++;
     }
     break;
     case 3:
     if(p3.value!=90){
       p3.value+=5;  
     }
     break;
     case 6:
     if(p6.value!=720){
       p6.value+=10;
     }
     break;
     case 7:
     if(p7.value!=5){
      p7.value++;
     }
     break;
     case 8:
        if(p8.value!=90){
        p8.value+=5;
     }
     break;
     
    }
  }

  decrement(int index){
    switch(index){
      case 1:
        if(p1.value!=7){
        p1.value--;
    }
    case 3:
    if(p3.value!=10){
      p3.value-=5;
    }
      break;
      case 6:
      if(p6.value!=10){
       p6.value-=10;
      }
      break;
    case 7:
    if(p7.value!=1){
      p7.value--;
    }
    case 8:
     if(p8.value!=20){
        p8.value-=5;
    }    
    break;  
    }
    
  }

  reset(int index){
    switch(index){
      case 1:
      p1.value=7;
      break;
      case 3:
      p3.value=10;
      break;
      case 6:
      p6.value=10;
      break;
      case 7:
      p7.value=1;
      break;
      case 8:
      p8.value=20;
      break;
    }
  }

   
   add(int index, String value){
    switch(index){
      case 2:
      p2.add(value);
      break;
      case 4:
      p4.add(value);
      break;
      case 5:
    }
   }

    remove(int n, int index){
    switch(n){
      case 2:
      p2.removeAt(index);
      break;
      case 4:
      p4.removeAt(index);
      break;
    }
   }


   p5modify(String value, int number, int index){
    if(index==1){
     p5[value]=number;
    }else{
      p5.remove(value);
    }
   }

   bool p5hourpass(){
     int n=0;
     p5.forEach((key,value){
      n+=value;
     });
     debugPrint('$n');
    if(n>=13){
      return true;
    }else{
      return false;
    }
   }

    void choosen(int index){
    switch(index){
      case 1: p1choosen.value=true;
      break;
      case 2:p2choosen.value=true;
      break;
       case 3:p3choosen.value=true;
      break;
      case 4:p4choosen.value=true;
      break;
      case 5:p5choosen.value=true;
      break;
      case 6:p6choosen.value=true;
      break;
      case 8:p8choosen.value=true;
      break;
    }
    npractices++;
  }

  void nochoosen(int index){
    switch(index){
      case 1: p1choosen.value=false;
      break;
      case 2:p2choosen.value=false;
      break;
       case 3:p3choosen.value=false;
      break;
      case 4:p4choosen.value=false;
      break;
       case 5:p5choosen.value=false;
      break;
      case 6:p6choosen.value=false;
      break;
      case 8:p8choosen.value=false;
      break;

    }
    npractices--;
  }


 void resetpractice(){
    p1inpractice.value=0;
    p1finish.value=false;

    p4.clear();
    p4finish.value=false;

    
  }

  




}

