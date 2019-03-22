int aantalSetjes = 20; // nodig om het aantal setjes kaartjes te tekenen, deze wordt geset in het hoofdmenu
int puntenSpeler1 = 0; // punten van speler 1 worden bijgehouden na elke beurt
int puntenSpeler2 = 0; // punten van speler 2 worden bijgehouden na elke beurt
int beurtenSpeler1 = 0; // beurten van speler 1 worden bijgehouden na elke beurt
int beurtenSpeler2 = 0; // beurten van speler 2 worden bijgehouden na elke beurt
int [] arrayKaartnummers; // dit is de array met gehutselde kaartnummers
int [] arrayKaartnummersOver; // dit is de array waar een 0 komt te staan als het kaartje is gekozen
int beginpuntafstandKaartje = 70; // de afstand van de kaartjes t.o.v. elkaar
int highscore = 0; // highscore wordt bijgehouden
int hoogteBerichtenvak = 20; // het berichtenvak in het spel heeft 2 regels, vandaar hier dit getal
int gekozenPlekjeArray1 = 0; // zodra er op een geldig kaartje wordt geklikt wordt deze variabele gevuld
int gekozenPlekjeArray2 = 0; // zodra er op een geldig kaartje wordt geklikt wordt deze variabele gevuld
int startTijd = 0; // Deze variabele is nodig om te zorgen dat na een beurt het spel 2 seconden wacht
int beginKaartjesPuntX; // deze variebele is nodig om het tekenen van de kaartjes op juiste punt te laten beginnen
int beginKaartjesPuntY; // deze variebele is nodig om het tekenen van de kaartjes op juiste punt te laten beginnen
String naamSpeler1 = "Speler 1"; // naam van speler 1
String naamSpeler2 = "Speler 2"; // naam van speler 1
boolean gestart = false; // deze variabele wordt true wanneer op de knop Start is gedrukt
boolean KaartenSchudden = false; // de kaarten worden geschud als deze variabele true is.
boolean isBeurtSpeler1 = true; // met deze variabele wordt er in de gaten gehouden welke speler aan de beurt is
boolean kaartje1Gekozen = false; // als er op het eerste kaartje is geklikt wordt deze variebele true 
boolean kaartje2Gekozen = false; // als er op het tweede kaartje is geklikt wordt deze variebele true
boolean potjeIsAfgelopen = false; // wanneer de arrayKaartnummerOver alleen maar 0-len bevat wordt deze variabele op true gezet
boolean isSinglePlayerMode; // deze variabele wordt op true gezet wanneer er in het hoofdmenu is gekozen voor SinglePlayer
boolean isMultiPlayerMode; // deze variabele wordt op true gezet wanneer er in het hoofdmenu is gekozen voor MultiPlayer
boolean wachten = false; // deze variabele wordt op true gezet wanneer er een beurt is geweest
boolean HoofdmenuLaden = true; // deze variabele wordt false zodra het spel wordt gespeeld
boolean E_TekenMemoryKaartjes = false; // deze variabele zorgt er bij true voor dat de kaartjes worden getekend
boolean gekliktOpSpeler1; // deze variabele wordt gebruikt in het hoofdmenu om de juiste naam in te kunnen vullen
boolean gekliktOpSpeler2; // deze variabele wordt gebruikt in het hoofdmenu om de juiste naam in te kunnen vullen
PImage achterkantKaart, achterkantKaartMouseOver, Kaartje1, Kaartje2; // Deze variabelen zijn om het juiste plaatje te laten zien

void setup() 
{
  fullScreen();
  B_MainCode_Setup();
}
void draw() 
{ 
  B_MainCode_Draw();
}

void mousePressed() 
{
  if (HoofdmenuLaden)
  {
    A_CheckOfKnopInHoofdmenuWordtIngedrukt();
  }  
}   

void keyPressed() 
{
  // 
  A_TerugNaarHoofdmenu();
  if (gekliktOpSpeler1)
  {
    naamSpeler1 = A_CheckIngedrukteToetsen(naamSpeler1);
  }
  
  if (gekliktOpSpeler2)
  {
    naamSpeler2 = A_CheckIngedrukteToetsen(naamSpeler2);
  }
}
