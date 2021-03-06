import processing.svg.*;
//image menu && initialisation des polices//
PImage julia;
PImage icone;
PImage carte1;
PImage carte2;
PFont f;
PFont f1;
PFont f2;
//variables pour le texte clignotant du menu
float timeInterval;
float timePast;
int textAlpha = 50;

int textFade = 3;
//variable qui permet de switch les différentes phases du programme///
int run = 0;
//Variables pour générer cartes perforée
PGraphics pgr;
PShape getsvg;
String file = "SVG/Julia.svg";
String input0; //texte initial
String input = "textB.txt"; //texte en binaire
//écrire le fichier txt en binaire --> traduction N°1 txt -> txt binaire
PrintWriter output;
//variables de la matrice de la carte////
int colls = 24; //nombre de colonnes
int rows; //nombre de lignes variable en fonction du texte
// taille des cellules de la carte qui définit la taille de la carte
int cellSizeWidth = 13;
int cellSizeHeight = int(cellSizeWidth*1.1);//int(cellSizeWidth*1.1);//hauteur des cellules en focntion de leur largeur coef = 1.1.
//Le coeficient est défini en mésurant les dimensions des cases sur la carte analogique
int H; // taille en fonction du nombre de lignes
int W; // taille en fonction du nombre de colonnes
////variables des cercles////
float C1 = cellSizeWidth*0.6;//taille cercle de perforation et des colonnes exterieures//
float C2 = cellSizeWidth*0.8;//taille cercle d'engagement et de continuité
int interC2 = cellSizeHeight*2; //variables d'espacement entre les C2
///variables texte perforé////
color c;//défnir la couleur des cercles ( Blancs ou noirs)
byte b[];//données du texte
// Declare 2D array
int[][] myArray = new int[colls][rows];
///////////////////
//boolean run carte
boolean run24C = true; //variable bool qui permet de lancer le programme de carte 24 colonnes
boolean run40C = true; //variable bool qui permet de lancer le programme de carte 40 colonnes
boolean run_carte = true;
boolean run_translate = false;
boolean run_findText = false;
//Variable fonction TypeCard
int number;//variable int du chiffre rentré dans consoleText
String typing1 ="";
String saved1 = "";
//variable de la fonction list
int number1;//variable int du chiffre rentré dans TypeCard
String len_data; // String pour eviter les bugs lors de l'entrée du numéro de fichier // à modifier car ne fonctionne pas
String typing = ""; // Variable du texte tapé
String saved = ""; //variable convertie en entier : string -> INT

void settings() {
  H = (rows*cellSizeHeight)+(6*cellSizeHeight);
  W = (colls*cellSizeWidth)+(8*cellSizeWidth);
  size (1000, 800); //P3D n'est pas nécéssaire, de plus il est incompatible avec la derniere version du mac MOnteray
}
void setup() {
  background(0);
  ///iniatialisation pour le menu
  julia = loadImage("img/julia.png");
  icone = loadImage("img/icone.png");
  carte1 = loadImage("img/24C.png");
  carte2 = loadImage("img/40C.png");
  f = loadFont("img/Code-45.vlw");
  f1 = loadFont("img/Code-30.vlw");
  f2 = loadFont("img/Code-20.vlw");
  //variable pour le blinking text du menu0
  timePast = millis();
  timeInterval = 2200.0f;
  //init le fichier SVG
  getsvg = loadShape(file);
}
void draw() {
  background(255);
  //squelette du programme qui lance les différentes fonctions
  switch (run) {
  case 0 :
    menu();
    break;
  case 1 :
    explication();
    break;
  case 2 :
    TypeCard();
    break;
  case 3 :
    consoleText();
    if (run_translate == true) {
      translateText();
    }
    break;
  }
}
void menu() {
  background(0);
  image(julia, 75, 70);
  drawfont(); //fonction menu//
}
void textFade () {
  if (millis() > timeInterval + timePast) {
    timePast = millis();
    textFade *= -1;
  }
  textAlpha += textFade; //Fcontion texte clignotant
}
void drawfont () {
  //textFont (font);
  text("**************************************************************************", 0, 70);
  text("**************************************************************************", 0, 530);
  textFade();
  textFont(f);
  fill(255, 255, 255, textAlpha);
  text ("Appuyez sur ENTER", 200, 650);
  text("pour commencer", 260, 700);
}
///////////////////////////////////////////
//tracer la carte perforée  //Fcontion texte clignotant
void explication() { //fenetre 2 qui donne les explications sur le programme
  background(0);
  textFont(f2);
  fill(255);
  text("Julia est un programme developpé en 2021.\nSon objectif est de traduire le texte de votre choix\nen Jacquard de deux couleurs.\nPlacez votre fichier .txt\ndans le dossier data de l'application.\nAppuyez sur espace pour continuer.", 100, 350);
}
void TypeCard() { //fonction qui permet de choisir le type de carte
  background(0);
  textFont(f1);
  fill(255);
  //display text & images des différents type de carte
  text("1 : carte 24 colonnes", 250, 150);
  image(carte1, 350, 180);
  text("2 : carte 40 colonnes", 250, 430);
  image(carte2, 350, 460);
  text("Type de carte : " +typing1, 520, 50);
  textFont(f2);
  text("Entrez le type de carte que vous souhaitez\net appuyez sur ENTER", 30, 730);
}
void consoleText() { //fonction qui permet de choisir le texte à traduire
  background(0);
  fill(255);
  textFont(f2);
  text("Entrez le numéro de votre fichier\net appuyez sur ENTER pour générer\nvotre carte perforée.", 100, 700);
  if (number1 ==1) { //bool qui definie quel type de carte va etre créee
    run40C = false;
  } else if (number1 ==2) { //bool qui definie quel type de carte va etre créee
    run24C = false;
  }
  //lancer la fonction qui liste tous les fichiers texte
  list();
}
void translateText() { //fonction qui l'écran de fin et lance la réalisation de la carte perforée////
  background(0);
  fill(255);
  textFont(f2);
  image(icone, 0, 330); //display image de mami Julia
  text("Vous avez choisi : "+input0, 70, 80);
  text("Votre carte perforée est dans \nle dossier SVG de l'application.\nLe fichier SVG s'appelle Julia.svg\nVous pouvez utiliser ce fichier pour la découpeuse laser\npour tracer votre carte.\nUtilisez du film polyester en feuille.\nVous en trouverez chez rougié et plé.\nUne fois découpée,\nil faudra insérer la carte dans le métier Jacquard.\nEnfin, demandez à Clément de vous expliquer la suite. ", 70, 120);
  text("Merci d'avoir utilisé Julia !", 300, 370);
  text("Appuez sur ECHAP pour quitter", 540, 30);
  if (run_carte == true) {
    //si 24C est true alors lancer la carte à 24 colonnes
    if (run24C == true) {
      matrix();
    }
    //si 24C est true alors lancer la carte à 24 colonnes
    if (run40C == true) {
      colls = 40;
      cellSizeWidth =14;
      cellSizeHeight =14;
      C1 = cellSizeWidth*0.6;//taille cercle de perforation et des colonnes exterieures//
      C2 = cellSizeWidth*0.8;
      matrix2();
    }
  }
}
///fin des fonction d'interfaces///
///Debut des fonctions de générations///
void list() {//fonction qui liste tout les fichiers présents dans le data
  // we'll have a look in the data folder
  java.io.File folder = new java.io.File(sketchPath("data"));
  // list the files in the data folder
  String[] filenames = folder.list();
  //variable String global qui prend la valeurs de nombre de fichier dans le data
  /*len_data = str(filenames.length);//convertion du length en string
   if (filenames.length >= 9) len_data = "9"; //si le nombre de fichier est supérieur à 9 alors len_data prend comme valeur "9"*/
  //DISPLAY tous les noms des fichiers
  for (int i = 0; i < filenames.length; i++) {
    textFont(f1);
    text(i+" : "+filenames[i], 100, 100+i*40);
  }
  textFont(f1);
  fill(255);
  text("Numéro du fichier : " +typing, 470, 50);
  for (int i = 0; i<filenames.length; i++) {
    if (run_findText) { //booleen qui permet de lancer la condition une seule fois
      if (number == i ) {
        input0 = filenames[i];
        println(input0);
        run_findText = false;
      }
    }
  }
}

void keyPressed() {//tous les keypressed pour utiliser le programme
  //de menu0 -> explication
  if (run==0) {
    if (key=='\n') {
      run=1;
    }
  }
  //de explication -> input
  if (run==1) {
    if (key ==' ') {
      run = 2;
    }
  }
  //à optimiiser utiliser seulement Typing sans typing1
  ///keypressed qui permet de saisir uniquement la carte 24 Colonnes ou 40 colonnes
  if (run==2) {
    if (typing1 !="") { //condition pour rentrer un caractère obligatoirement
      if (key == '\n') { //Si "entrer" -> lancer la fonction pour générer la carte
        saved1 = typing1;//le texte tapé devient le texte enregistré
        number1 = Integer.parseInt(saved1);
        run = 3;
        run_carte = true;
      }
    }
  }
  if (key >='1' && key <= '2') { //permet de ne choisir le type de carte
    typing1 = typing1 + key;
  } else if (key == BACKSPACE && typing1.length() > 0) { // else if qui permet de delete le nombre en cas d'erreur
    typing1 = typing1.substring(0, typing1.length()-1);
  }
  //Keypressed qui permet de saisir le numéro de fichier à traduire
  if (run==3) {
    if (typing !="") { //condition pour rentrer un caractère obligatoirement
      if (key == '\n') { //Si "entrer" -> lancer la fonction pour générer la carte
        run_translate = true;
        saved = typing;//le texte tapé devient le texte enregistré
        number = Integer.parseInt(saved); //convertion string -> int
        run_findText = true; //boolean qui active la recherche du fichier
      }
    }
    if (key >='0' && key <= '9') { //permet de ne taper que des chiffres de 1 au nombre de fichier dans le data
      typing = typing + key;
    } else if (key == BACKSPACE && typing.length() > 0) { // else if qui permet de delete le nombre en cas d'erreur
      typing = typing.substring(0, typing.length()-1);
    }
    //save le fichier SVG
    if (key == 'r') {
      getsvg = loadShape(file);
      println("saved : "+file);
    }
    if (key==ESC) exit();
  }
}
