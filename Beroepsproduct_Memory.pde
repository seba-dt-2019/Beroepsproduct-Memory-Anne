int aantalSetjes = 20;
int puntenSpeler1 = 0;
int puntenSpeler2 = 0;
int beurtenSpeler1 = 0;
int beurtenSpeler2 = 0;
int puntPerKaartje = 1;
int [] arrayKaartnummers;
int [] arrayKaartnummersOver;
int beginpuntafstandKaartje = 85;
int highscore = 0;
int hoogteBerichtenvak = 20;
int tellerBerichten = 0;
int gekozenPlekjeArray1 = 0;
int gekozenPlekjeArray2 = 0;
int startTijd = 0;
int beginKaartjesPuntX;
int beginKaartjesPuntY;
String highscoreSpelernaam;
String naamSpeler1;
String naamSpeler2;
boolean gestart = false;
boolean kaartenSchudden = false;
boolean isBeurtSpeler1 = true;
boolean kaartje1Gekozen = false;
boolean kaartje2Gekozen = false;
boolean potjeIsAfgelopen = false;
boolean isSinglePlayerMode;
boolean isMultiPlayerMode;
boolean wachten = false;
boolean HoofdmenuLaden = true;
boolean tekenMemoryKaartjes = false;
PImage achterkantKaart, achterkantKaartMouseOver, Kaartje1, Kaartje2;

void setup() 
{
  size(1000, 1050);
  B_Mainform_setup();
}
void draw() 
{ 
  B_Mainform_draw();
}

void mousePressed() 
{
  if (HoofdmenuLaden)
  {
    CheckOfKnopInHoofdmenuWordtIngedrukt();
  }  
}   

void keyPressed() 
{
  TerugNaarHoofdmenu();
}
