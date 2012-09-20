import processing.serial.*;

import cc.arduino.*;

Arduino arduino;

PFont font;

PImage image1;
PImage image2;
PImage image3;
PImage image4;
PImage image5;
PImage image6;
PImage image7;
PImage image8;

int timerCount=0;

int image1fade=0;
int image2fade=0;
int image3fade=0;
int image4fade=0;
int image5fade=0;
int image6fade=0;
int image7fade=0;
int image8fade=0;

int nextText=0;
int nextImage=0;

int timer=0;

int Rvalue;
int Gvalue;
int Bvalue;

void setup(){
  size(1024,768);
  font = loadFont("Myhandwriting-48.vlw");
  
  println(Arduino.list()); //incase the port changes
  arduino = new Arduino(this, Arduino.list()[0], 57600); //array = port no.
  arduino.pinMode(2, Arduino.INPUT);
  arduino.pinMode(9, Arduino.OUTPUT);
  arduino.pinMode(10, Arduino.OUTPUT);
  arduino.pinMode(11, Arduino.OUTPUT);
  
  
 image1 = loadImage("image1.png");
 image2 = loadImage("image2.png");
 image3 = loadImage("image3.png");
 image4 = loadImage("image4.png");
 image5 = loadImage("image5.png");
 image6 = loadImage("image6.png");
 image7 = loadImage("image7.png");
 image8 = loadImage("image8.png");
}

void draw() {
  background(0,0,0);
  
  if(timer == 1){
  if(arduino.digitalRead(2) == Arduino.HIGH){
    nextImage+=1;
    nextText+=1;
    timer=0;
    timerCount=0;
  }}
  println(nextImage);
  
  //images
  if(nextImage==0){
    //tint(255, image1fade);
    //image(image1, 0,0);
     //image1fade+=10;
  }
  
   if(nextImage==1){
    tint(255, image1fade);
    image(image1, 0,0);
     image1fade+=5;
     Bvalue++;
       if(Bvalue>254){
       Bvalue=255;}
  }
  
   if(nextImage==2){
     tint(255, image2fade);
     image(image2,0,0);
     image2fade+=5;
     Bvalue++;
     if(Bvalue>254){
       Bvalue=255;}
   }
   
   if(nextImage==3){
     tint(255, image3fade);
     image(image3,0,0);
     image3fade+=5;
     tint(255, image4fade);
     if(timerCount>25){
     image(image4,0,0);
     image4fade+=3;}
     Rvalue++;
     if(Rvalue>254){
       Rvalue=255;}
   }
   
   if(nextImage==4){
     tint(255, image5fade);
     image(image5,0,0);
     image5fade+=5;
     tint(255, image6fade);
     image(image6,0,0);
     
   if(timerCount>50){
   image6fade+=1;}
   
   Rvalue=255;
   Bvalue=0;}
   
   if(nextImage==5){
    tint(255,image7fade);
    image(image7,0,0);
    image7fade+=10;
    tint(255,image8fade);
    image(image8,0,0);
    image8fade+=2;
    Rvalue-=2;
    Bvalue--;
   }
  
  
    //text
  if(nextText==0){
    fill(255);
    textFont(font, 80);
    text("I have a rendezvous with Death",100,300);
    text("At some disputed barricade",100,370);
    timerCount++;
    if(timerCount>50){
      timer=1;}
  }
  
  if(nextText==1){
    fill(255);
    textFont(font,50);
    text("When Spring comes back with rustling shade",100,250);
    text("And apple-blossoms fill the air--",100,300);
    text("I have a rendezvous with Death",100,350);
    text("When Spring brings back blue days and fair.", 100, 400);
    timerCount++;
    if(timerCount>100){
      timer=1;}
  }
  
  if(nextText==2){
    fill(255);
    textFont(font,30);
    text("It may be he shall take my hand",550,350);	 
    text("And lead me into his dark land",550,375);	 
    text("And close my eyes and quench my breath—",550,400);	 
    text("It may be I shall pass him still.",550,425);
    timerCount++;
    if(timerCount>100){
      timer=1;}
  }
  
  if(nextText==3){
    fill(255);
    textFont(font,30);
    text("I have a rendezvous with Death",50,350);	 
    text("On some scarred slope of battered hill,",50,375);	 
    text("When Spring comes round again this year", 50,400);	 
    text("And the first meadow-flowers appear.",50,425);
    timerCount++;
    if(timerCount>100){
      timer=1;}
  }
  
  if(nextText==4){
    fill(255);
    textFont(font,50);
    text("God knows 'twere better to be deep",50,350);
    text("Pillowed in silk and scented down,",50,400);	 
    text("Where love throbs out in blissful sleep,",50,450);	 
    text("Pulse nigh to pulse, and breath to breath,",50,500);	 
    text("Where hushed awakenings are dear...",50,550);
    timerCount++;
    if(timerCount>100){
      timer=1;}
  }
  
  if(nextText==5){
    fill(255);
    textFont(font,45);
    text("But I've a rendezvous with Death",50,250);
    text("At midnight in some flaming town,",50,300);	 
    text("When Spring trips north again this year,",50,350);	 
    text("And I to my pledged word am true,",50,400);	 
    text("I shall not fail that rendezvous.",50,450);
    timerCount++;
    if(timerCount>200){
      timer=1;}
  }
  
  if(nextText==6){
    fill(255);
    textFont(font,45);
    text("I Have a Rendezvous with Death. Alan Seeger. 1919.",100,300);
    timerCount++;
  }
        
  
  arduino.analogWrite(9, Rvalue);
  arduino.analogWrite(10, Gvalue);
  arduino.analogWrite(11, Bvalue);
  
  //LED END
  
  }
