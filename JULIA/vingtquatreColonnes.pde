void matrix() {//fonction qui génère la carte perforée 24 colonnes
  output = createWriter("textB.txt");
  //Charger les caractères du fichier en Binaire dans un nouveau fichier txt;
  println(input0);
  byte [] str = loadBytes(input0);
  for (int i = 0; i < str.length; i++) {
    output.print(binary(str[i]));
  }
  output.flush();  // Writes the remaining data to the file
  output.close();  // Finishes the file
  //téléchager les données du texte
  b = loadBytes(input);
  //println(b.length);
  //définir le nombre de lignes////
  rows = b.length/colls;
  H = (rows*cellSizeHeight)+(6*cellSizeHeight);
  W = (colls*cellSizeWidth)+(8*cellSizeWidth);
  ///Initialisation du tableau///////////
  char [][] val = new char[colls][rows];
  /////initialisation de la perforation de la carte///////
  int count = 0;
  for (int i = 0; i < colls; i++) {
    for (int j = 0; j < rows; j++) {
      val[i][j] = char(b[count]);
      count++;
      if (count>=b.length)count=0;
    }
  }
  ///////////Dessiner les graphics///////////
  pgr=createGraphics(width, height, SVG, file);
  pgr.beginDraw();
  ///////////Tracage des cercles de la carte perforée)/////////////
  ////double ligne en haut et en bas pour garder la continuité de la carte////
  for ( int i =cellSizeWidth*4; i <W-(cellSizeWidth*4); i+=cellSizeWidth ) {
    pgr.strokeWeight(0.03); //épaisseur de découpe 0.01 mm
    pgr.stroke(255, 0, 0);
    pgr.fill(255);
    pgr.ellipse (i+cellSizeWidth/2, cellSizeHeight/2, C2, C2);
    pgr.ellipse (i+cellSizeWidth/2, cellSizeHeight*1.5, C2, C2);
    pgr.ellipse (i+cellSizeWidth/2, H-(cellSizeHeight/2), C2, C2);
    pgr.ellipse (i+cellSizeWidth/2, H-(cellSizeHeight*1.5), C2, C2);
  }
  //Colonnes de la carte perforée exterieur a la matrice///
  for ( int i =0; i <H-(cellSizeHeight/2); i+=cellSizeHeight) {
    pgr.strokeWeight(0.03); //épaisseur de découpe 0.01 mm
    pgr.stroke(255, 0, 0);
    pgr.fill(255);
    pgr.ellipse (cellSizeWidth*3.3, i+cellSizeHeight/2, C1, C1);
    pgr.ellipse (W-(cellSizeWidth*3.3), i+cellSizeHeight/2, C1, C1);
  }
  //colonnes de points pour engager la carte///
  for ( int i =cellSizeHeight/12; i <H; i+=interC2 ) {
    pgr.strokeWeight(0.03); //épaisseur de découpe 0.01 mm
    pgr.stroke(255, 0, 0);
    pgr.fill(255);
    pgr.ellipse (cellSizeWidth*1.7, i+cellSizeWidth, C2, C2);
    pgr.ellipse (W-cellSizeWidth*1.7, i+cellSizeWidth, C2, C2);
  }
  ////////Perforation de la carte en fonction du texte/////////////
  count = 0;
  for (int i = 0; i < colls; i++) {
    for (int j = 0; j < rows; j++) {
      val[i][j] = char(b[count]);
      if (val[i][j]=='0') {
        c=color(255, 0, 0);
      } else {
        c=color(255, 255, 255);
      }
      count++;
      if (count>=b.length)count=0;
      pgr.strokeWeight(0.03); //épaisseur de découpe 0.01 mm
      pgr.stroke(c);
      pgr.fill(255);
      pgr.ellipse((cellSizeWidth*4.5)+(i*cellSizeWidth), (cellSizeHeight*2.5)+(j*cellSizeHeight), C1, C1);
    }
  }
  /////////////////////////////////////////////////////////
  /////////////Finir de dessinder les graphiques///////////
  pgr.dispose();
  pgr.endDraw();
  run_carte = false;
  ///////////////////////////////////////////////////////
}
