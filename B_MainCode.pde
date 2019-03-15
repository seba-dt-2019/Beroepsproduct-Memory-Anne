void B_Mainform_setup()
{  
  background(0,0,0);
}

void B_Mainform_draw()
{
  background(0,0,0);
  
  if (HoofdmenuLaden)
  { 
    KnoppenHoofdmenuMaken();
  }

  if (kaartenSchudden)
  {
    KaartenSchudden();
    kaartenSchudden = !kaartenSchudden;
  }
  
  if (isSinglePlayerMode && !isBeurtSpeler1)
  {
     RandomKaartjesOmdraaien(arrayKaartnummersOver);           
  }
  
  if(tekenMemoryKaartjes && !HoofdmenuLaden)
  {
    if (wachten)
    {      
      int wachtTijd = millis() - startTijd;
      
      if (kaartje1Gekozen && kaartje2Gekozen && wachtTijd > 2000)
      {
        CheckGeklikteKaartjes();
      }
    }
  }
  
  if (potjeIsAfgelopen) 
  {
    background(255, 0, 0);
    fill(255);
    //displays score and lives remaining.
    textSize(30);
    text("Punten Speler 1: " + puntenSpeler1 + " Aantal beurten Speler 1: " + beurtenSpeler1, 50, 50);
    text("Punten Speler 2: " + puntenSpeler2 + " Aantal beurten Speler 2: " + beurtenSpeler2, 50, 85);
    
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
      kaartenSchudden = true;
      background(0,0,0);   
    }  
  }
    
  if (kaartje1Gekozen && kaartje2Gekozen && !wachten)
  {
    wachten = true;
    startTijd = millis();
  }
  
  if(tekenMemoryKaartjes && !HoofdmenuLaden)
  {
    TekenMemoryKaartjes(aantalSetjes, BerekenGeklikteKaart(gekozenPlekjeArray1), BerekenGeklikteKaart(gekozenPlekjeArray2));
    
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
      bericht = bericht + ", Speler 1 is aan de beurt, kies 2 kaartjes";
    }
    else
    {
      if (isSinglePlayerMode)
      {
        bericht = bericht + ", Speler 2, dew computer is aan de beurt";
      }
      if (isMultiPlayerMode)
      {
        bericht = bericht + ", Speler 2 is aan de beurt, kies 2 kaartjes";
      }      
    }
    
    if (!potjeIsAfgelopen)
    {
      VulBerichten(bericht);
    }
  }
  
  if (kaartje1Gekozen == false && kaartje2Gekozen == false)
  {
    wachten = false;
  }
}

void VulBerichten(String bericht)
{
  fill(255,255,255);
  textSize(20);
  textAlign(LEFT);
  text(bericht,75,hoogteBerichtenvak - 2);
  text("Door op Backspace te drukken keert u weer terug naar het hoofdmenu",75,hoogteBerichtenvak + hoogteBerichtenvak - 2);
}
