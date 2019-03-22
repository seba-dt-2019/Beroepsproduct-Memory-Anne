void A_KnoppenHoofdmenuMaken()
{
  background(111);
  rectMode(CENTER);
  textMode(MODEL);
  textSize(12);
  
  //Multiplayer Knop
  fill(222);
  if (isMultiPlayerMode)
  {
    fill(252);
  }
  else
  {
    fill(222);
  }
  rect(100, 70, 100, 50);
  fill(22);
  text("Multiplayer", 75, 70);
  
  //Singleplayer Knop
  if (isSinglePlayerMode)
  {
    fill(252);
  }
  else
  {
    fill(222);
  }
  rect(100, 120, 100, 50);
  fill(22);
  text("Singleplayer", 70, 125);
  
  //Aantal verlagen Knop
  fill(222);
  rect(65, 170, 30, 50);
  fill(22);
  text("<", 65, 175);
  
  //Aantal verhogen Knop
  fill(222);
  rect(135, 170, 30, 50);
  fill(22);
  text(">", 135, 175);
  
  text(" Kies het aantal kaartjes", 155, 175);
  
  fill(255);
  rect(100, 170, 40, 50);
  fill(22);
  text(aantalSetjes *2, 100, 175);
  
  // Naam Speler 1
  if (gekliktOpSpeler1)
  {
    fill(252);
  }
  else
  {
    fill(222);
  }
  rect(100, 220, 100, 50);
  fill(22);
  text(naamSpeler1, 85, 225);
  text(" Naam Speler 1", 155, 225);
  
  // Naam Speler 2
  if (gekliktOpSpeler2)
  {
    fill(252);
  }
  else
  {
    fill(222);
  }
  rect(100, 270, 100, 50);
  fill(22);
  text(naamSpeler2, 85, 275);
  text(" Naam Speler 2", 155, 275);
  
  // Start Knop
  fill(222);
  rect(100, 320, 100, 50);
  fill(22);
  text("Start", 85, 325);
}

void A_TerugNaarHoofdmenu()
{
  if (key == BACKSPACE)
  {
      HoofdmenuLaden = true;
      E_TekenMemoryKaartjes = false;
  }
}

void A_CheckOfKnopInHoofdmenuWordtIngedrukt()
{
  if (mouseX > 50 && mouseX < 150 && mouseY > 45 && mouseY < 95)
  {
    // Selecteer Multiplayer knop
    isSinglePlayerMode = false;
    isMultiPlayerMode = true;
    gekliktOpSpeler1 = false;
    gekliktOpSpeler2 = false;
  }
  if (mouseX > 50 && mouseX < 150 && mouseY > 95 && mouseY < 145)
  {
    // Selecteer Singleplayer knop
    isSinglePlayerMode = true;
    isMultiPlayerMode = false;
    gekliktOpSpeler1 = false;
    gekliktOpSpeler2 = false;
  }
  if (mouseX > 50 && mouseX < 80 && mouseY > 145 && mouseY < 195)
  {
    //Knop om aantalkaartjes te verlagen
    if (aantalSetjes == 6)
    {
      return;
    }
    aantalSetjes --;
    gekliktOpSpeler1 = false;
    gekliktOpSpeler2 = false;
  }
  if (mouseX > 120 && mouseX < 150 && mouseY > 145 && mouseY < 195)
  {
    //Knop om aantalkaartjes te verhogen
    if (aantalSetjes == 37)
    {
      return;
    }
    aantalSetjes++;
    gekliktOpSpeler1 = false;
    gekliktOpSpeler2 = false;
  }
  if (mouseX > 50 && mouseX < 150 && mouseY > 195 && mouseY < 245)
  {
    // Naam Speler 1
    gekliktOpSpeler1 = true;
    gekliktOpSpeler2 = false;

  }
  if (mouseX > 50 && mouseX < 150 && mouseY > 245 && mouseY < 295)
  {
    // Naam Speler 2
    gekliktOpSpeler1 = false;
    gekliktOpSpeler2 = true;
  }
  if (mouseX > 50 && mouseX < 150 && mouseY > 295 && mouseY < 345)
  {
    //Startknop
    if (!isSinglePlayerMode && !isMultiPlayerMode)
    {
      isMultiPlayerMode = true;
      return;
    }
    gekliktOpSpeler1 = false;
    gekliktOpSpeler2 = false;
    HoofdmenuLaden = false;
    E_TekenMemoryKaartjes = true;
    KaartenSchudden = true;
    arrayKaartnummers = new int[aantalSetjes*2];
    arrayKaartnummersOver = new int[(aantalSetjes*2)+1];
    
    beginpuntafstandKaartje = constrain(width / (aantalSetjes /2), 70, 150);
    beginKaartjesPuntX = (width - (E_BerekenVerdeling(aantalSetjes * 2) * beginpuntafstandKaartje) + (beginpuntafstandKaartje - aantalSetjes)) / 2; 
    beginKaartjesPuntY = (height - (E_BerekenVerdeling(aantalSetjes * 2) * beginpuntafstandKaartje) + (hoogteBerichtenvak *2)) / 2;
  }
}

String A_CheckIngedrukteToetsen(String IngevoerdeTekst)
{
  if (keyCode == DELETE) 
  {
    IngevoerdeTekst = "";
  }
  else if (keyCode == BACKSPACE) 
  {
    if (IngevoerdeTekst.length() > 0) 
    {
      IngevoerdeTekst = IngevoerdeTekst.substring(0, IngevoerdeTekst.length()-1);
    }
  }  
  else 
  {
      IngevoerdeTekst = IngevoerdeTekst + key;
  }
  return IngevoerdeTekst;
}
