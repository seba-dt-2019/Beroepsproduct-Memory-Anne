
void KnoppenHoofdmenuMaken()
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
  
  // Start Knop
  fill(222);
  rect(100, 220, 100, 50);
  fill(22);
  text("Start", 85, 225);
}

void TerugNaarHoofdmenu()
{
  if (key == BACKSPACE)
  {
      HoofdmenuLaden = true;
      tekenMemoryKaartjes = false;
  }
}

void CheckOfKnopInHoofdmenuWordtIngedrukt()
{
  if (mouseX > 50 && mouseX < 150 && mouseY > 45 && mouseY < 95)
  {
    // Selecteer Multiplayer knop
    isSinglePlayerMode = false;
    isMultiPlayerMode = true;
  }
  if (mouseX > 50 && mouseX < 150 && mouseY > 95 && mouseY < 145)
  {
    // Selecteer Singleplayer knop
    isSinglePlayerMode = true;
    isMultiPlayerMode = false;
  }
  if (mouseX > 50 && mouseX < 80 && mouseY > 145 && mouseY < 195)
  {
    //Knop om aantalkaartjes te verlagen
    if (aantalSetjes == 6)
    {
      return;
    }
    aantalSetjes --;
  }
  if (mouseX > 120 && mouseX < 150 && mouseY > 145 && mouseY < 195)
  {
    //Knop om aantalkaartjes te verhogen
    if (aantalSetjes == 37)
    {
      return;
    }
    aantalSetjes++;
  }
  if (mouseX > 50 && mouseX < 150 && mouseY > 195 && mouseY < 245)
  {
    //Startknop
    if (!isSinglePlayerMode && !isMultiPlayerMode)
    {
      isMultiPlayerMode = true;
      return;
    }
    HoofdmenuLaden = false;
    tekenMemoryKaartjes = true;
    kaartenSchudden = true;
    arrayKaartnummers = new int[aantalSetjes*2];
    arrayKaartnummersOver = new int[(aantalSetjes*2)+1];
    
    beginpuntafstandKaartje = constrain(width / (aantalSetjes /2), 80, 150);
    beginKaartjesPuntX = (width - (BerekenVerdeling(aantalSetjes * 2) * beginpuntafstandKaartje) + (beginpuntafstandKaartje - aantalSetjes)) / 2; 
    beginKaartjesPuntY = (height - (BerekenVerdeling(aantalSetjes * 2) * beginpuntafstandKaartje) + (hoogteBerichtenvak *3)) / 2;
  }
}
