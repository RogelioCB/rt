// ignore_for_file: non_constant_identifier_names, avoid_print

import 'dart:io';

void main() {
// ------------- Declaración de variables: Las "N" Representan Números y las "R" representan el número que se restará al total de PT -------------



  while (true) {
    


    int Nd12 = 0, RNd12 = 0, resto = 0; 
    int Nd8 = 0, RNd8 = 0;
    int Nd4 = 0, RNd4 = 0;
    bool Standard = false, Caza = false;
    bool Pesca = false, Recursos = false;
    int mode = 4;


    while(mode < 0 || mode > 3){
      
    print(' ');
    print('================== Selecciona el Modo de farmeo ==================');
    print('====== Standard: 0 === Caza: 1 === Pesca: 2 === Recursos: 3 ======');
    print('==================================================================');
    print(' ');

    
    //ª
  

    String? modest = stdin.readLineSync();
    int modea = int.parse(modest!);
    mode = modea;

    if (mode >= 0 && mode <= 3) {
      switch (mode) {
        case 0:
          Standard = true;
          print('============== Modo de farmeo establecido a Standard =============');
          break;
        case 1:
          Caza = true;
          print('================ Modo de farmeo establecido a Caza ===============');
          break;
        case 2:
          Pesca = true;
          print('=============== Modo de farmeo establecido a Pesca ===============');
          break;
        case 3:
          Recursos = true;
          print('============== Modo de farmeo establecido a Recursos =============');
          break;
        default:
      }
    } else {
      print('Eres absolutamente retrasado');
    }
    }









  // ------------- Introducción del valor de la primera tirada y conversión a número entero -------------
    print('~~~~~~~~~ Introduce el valor de la primera tirada de d100 ~~~~~~~~');

    String? PTst = stdin.readLineSync();

    int PT = int.parse(PTst!);
  // ------------- Descomposición Factorial de la Primera tirada para calcular el número de dados -------------
    if (PT >= 20) {
      Nd12 = (PT ~/ 20);
      RNd12 = (Nd12 * 20);
      resto = (PT - RNd12);
    }else if (resto >= 9 || PT >= 9) {
      Nd8 = (resto ~/ 9);
      RNd8 = (Nd8 * 9);
      resto = (resto - RNd8);
    } else if (resto >= 2 || PT >= 2) {
      Nd4 = (resto ~/ 2);
      RNd4 = (Nd4 * 2);
      resto = (resto - RNd4);
    }
  // ------------- Creación de un String para que en el print salgan todos los números de dados a tirar juntos -------------
    String dados = '';

    if (Nd12 != 0) {
      dados += '$Nd12' 'd12';
    }
    if (Nd8 != 0) {
      dados += ', $Nd8' 'd8';
    }
    if (Nd4 != 0) {
      dados += ', y $Nd4' 'd4';
    }

    print('~~~~~~~~~~ Tira $dados ~~~~~~~~~~');

  // ------------- Introducción del valor de la Segunda Tirada -------------
    print('~~~~~~~~~~~~~~~ Introduce el resultado de los dados ~~~~~~~~~~~~~~');

      String? STst = stdin.readLineSync();

      int ST = int.parse(STst!);
  // ------------- Introducción del valor de la Tercera Tirada, que supondrá el porcentaje de ST en el valor final -------------
    print('~~~~~~~~~ Introduce el valor de la segunda tirada de d100 ~~~~~~~~');

      String? TTst = stdin.readLineSync();

      int TT = int.parse(TTst!);

    int totl = (TT * ST) ~/ 100;
  // ------------- Conversión del número de dados tirados para calcular el dado a tirar de los recursos adicionales -------------

    int Nitems = Nd12 + Nd8 + Nd4;
    String items = '';
    int NitemsDice = 0;

    switch (NitemsDice) {
      case >=12:
        NitemsDice = 12;
        break;
      case 11 && 10:
        NitemsDice = 10;
        break;
        case 9 && 8:
        NitemsDice = 8;
        break;
        case 7 && 6:
        NitemsDice = 6;
        break;
        case < 6:
        NitemsDice = 4;
        break;
      default:
    }
    

  // ------------- Configuración de los recursos adicionales determinado por el resto y el número de dados tirados -------------
    if(Standard == true){

      if (resto != 0) {
        items = ', y 1d$NitemsDice de Recursos secundarios o $Nitems Recursos adicionales';
      } else {
        items = '';
      }
      
      print('Has obtenido $totl Unidades de Recurso$items');

    }
    
    int exp = 0;
    int Piel = 0;
    if (Caza == true) {

      exp = Nitems * 10;

      if (resto == 0) {
        Piel = NitemsDice;
      } else {
        Piel = Nitems;
      }

      print('Has obtenido $totl Carnes, $exp de Experiencia y $Piel Pieles.');

    }
    int Peces = totl + Nitems + NitemsDice;
    String GoldFish = '';
    if (Pesca == true) {
      if (resto != 0 && Nitems > 4) {
        GoldFish = ' Además... ¡Encontraste un Pez de Oro!';
      }
      print('Has obtenido $Peces peces.''$GoldFish');
    }


    if (Recursos == true) {
      print('Has obtenido $totl recursos y $NitemsDice recursos de Tier 0');
    }
    
    print(' ');
    print('=========== ¿Deseas hacer otra tirada de farmeo? (y/n) ===========');
    print(' ');

    String yn = '';

    while( yn != 'n' && yn != 'N' && yn != 'y' && yn != 'Y'){

      String? yna = stdin.readLineSync();
      yn = yna!;

      if (yn == 'n' || yn == 'N') {
        exit(0);
      } else if(yn == 'y' || yn == 'Y'){
      
      } else {
        print('Que pongas "y" o "n" gilipollas. Si hasta puedes ponerlos en mayúsculas.');
      }
    }
  }
}

