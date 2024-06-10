import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

// Audio Visualizer
// SHF December 3 2023
 
// You'll need the Minim Sound Library added to make this work.
// Get this by going to the Nav: Sketch>Import Library> Manage Library; look up Minim then install :)
 
float n4;
float n6;
 
//MUSIC  
import ddf.minim.*;
import ddf.minim.signals.*;
Minim minim;
AudioPlayer myMusic;
 
//MAIN SETUP
void setup () {
  size(800,800,P3D);
  noCursor();
  smooth();
  background (0);
  frameRate(60);
 
  //Add the music you have saved within the saved file of the project; add mp3 ex: ("song.mp3")
  minim = new Minim(this);
  //myMusic = minim.loadFile("The Dead Come Talking.mp3");
  //myMusic = minim.loadFile("Cant Catch Me Now.mp3");
  //myMusic = minim.loadFile("The Cult of Dionysus.mp3");
  //myMusic = minim.loadFile("O Superman.mp3");
  //myMusic = minim.loadFile("For Dallas.mp3");
  //myMusic = minim.loadFile("Off the Wall.mp3");
  //myMusic = minim.loadFile("Strawberry Perfume.mp3");
  //myMusic = minim.loadFile("Washing Machine Heart.mp3");
  myMusic = minim.loadFile("All Things End.mp3");
  //myMusic = minim.loadFile("Chamber Of Reflection.mp3");
  
  
  myMusic.play();
}
 
void draw () {
 
  fill(0,50);  
  noStroke();
  rect(0, 0, width, height);
  translate(width/2, height/2);
 
  for (int i = 0; i < myMusic.bufferSize() - 1; i++) {
 
    float angle = sin(i+n4)* 10; 
    float angle2 = sin(i+n6)* 300; 
 
    float x = sin(radians(i))*(angle2+40); 
    float y = cos(radians(i))*(angle2+40);
 
    float x3 = sin(radians(i))*(600/angle); 
    float y3 = cos(radians(i))*(600/angle);
 
    fill (#ffbf00, 90); //amber
    ellipse(x, y, myMusic.left.get(i)*10, myMusic.left.get(i)*10);
 
   fill ( #ffffff, 60); //white
    rect(x3, y3, myMusic.left.get(i)*20, myMusic.left.get(i)*10);
 
    fill ( #ff9800  , 90); //orange
    rect(x, y, myMusic.right.get(i)*10, myMusic.left.get(i)*10);
 
 
   fill( #ffffff , 70); //whote
    rect(x3, y3, myMusic.right.get(i)*10, myMusic.right.get(i)*20);
  }
 
  n4 += 0.005;
  n6 += 0.05;
 
}
