void B_MainCode_Setup()
{  
  background(0,0,0);
}

void B_MainCode_Draw()
{
  background(0,0,0);
  
  if (HoofdmenuLaden)
  { 
    A_KnoppenHoofdmenuMaken();
  }

  if (KaartenSchudden)
  {
    KaartenSchudden();
    KaartenSchudden = !KaartenSchudden;
  }
  
  if (isSinglePlayerMode && !isBeurtSpeler1)
  {
     D_RandomKaartjesOmdraaien(arrayKaartnummersOver);           
  }
  
  if(E_TekenMemoryKaartjes && !HoofdmenuLaden)
  {
    if (wachten)
    {      
      int wachtTijd = millis() - startTijd;
      
      if (kaartje1Gekozen && kaartje2Gekozen && wachtTijd > 2000)
      {
        E_CheckGeklikteKaartjes();
      }
    }
  }
  
  if (potjeIsAfgelopen) 
  {
    B_ToonEindscherm();
  }
    
  if (kaartje1Gekozen && kaartje2Gekozen && !wachten)
  {
    wachten = true;
    startTijd = millis();
  }
  
  if(E_TekenMemoryKaartjes && !HoofdmenuLaden)
  {
    E_TekenMemoryKaartjes(aantalSetjes, E_BerekenGeklikteKaart(gekozenPlekjeArray1), E_BerekenGeklikteKaart(gekozenPlekjeArray2));
    
    String bericht = "";
    if (isMultiPlayerMode)
    {
      bericht = "Multiplayer spel";
    }
    
    if (isSinglePlayerMode)
    {
      bericht = "Singleplayer spel";
    }
    
    if (isBeurtSpeler1)
    {
      bericht = bericht + ", "+ naamSpeler1 + " is aan de beurt, kies 2 kaartjes";
    }
    else
    {
      if (isSinglePlayerMode)
      {
        bericht = bericht + ",  " + naamSpeler2 + " , de computer is aan de beurt";
      }
      if (isMultiPlayerMode)
      {
        bericht = bericht + ",  "+ naamSpeler2 + " is aan de beurt, kies 2 kaartjes";
      }      
    }
    
    if (!potjeIsAfgelopen)
    {
      B_VulBerichten(bericht);
    }
  }
  
  if (kaartje1Gekozen == false && kaartje2Gekozen == false)
  {
    wachten = false;
  }
}


boolean B_IsHoogsteScore(int actueleScore)
{
     
  String[] score  = loadStrings("HoogsteScore.txt");
  int hoogsteScore = int(score[0]);
  if (hoogsteScore > actueleScore)
  {
    return false;
  }
  else
  {
    score[0] = str(actueleScore);
    score[1] = "";
    saveStrings("HoogsteScore.txt", score);
    return true;
  }  
}

void B_VulBerichten(String bericht)
{
  fill(255,255,255);
  textSize(20);
  textAlign(LEFT);
  text(bericht,75,hoogteBerichtenvak - 2);
  text("Door op Backspace te drukken keert u weer terug naar het hoofdmenu",75,hoogteBerichtenvak + hoogteBerichtenvak - 2);
}

void B_ToonEindscherm()
{
  background(255, 0, 0);
    fill(255);
    //displays score and lives remaining.
    textSize(30);
    text("Punten "+ naamSpeler1 + " : " + puntenSpeler1 + " in het aantal beurten: " + beurtenSpeler1, 50, 50);
    text("Punten "+ naamSpeler2 + " : " + puntenSpeler2 + " in het aantal beurten: " + beurtenSpeler2, 50, 85);
    
    int hoogsteScore = puntenSpeler1;
    if (puntenSpeler2 > hoogsteScore)
    {
      hoogsteScore = puntenSpeler2;
    }
    
    if (B_IsHoogsteScore(hoogsteScore))
    {
      text("Gefeliciteerd, u heeft de HOOGSTE SCORE: " + hoogsteScore, 50, 120);
    }
    
    fill(255);
    textSize(80);
    text("GAME OVER", 158, 300);
    fill(0);
    textSize(40);
    text("Klik om opnieuw te starten", 150, 500);
    text("Druk op Backspace voor het hoofdmenu", 50, 800);
    
    if (mousePressed)
    {
      potjeIsAfgelopen = false;
      KaartenSchudden = true;
      background(0,0,0);   
    }  
}
