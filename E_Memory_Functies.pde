void TekenMemoryKaartjes(int aantal, int kaartnummer1, int kaartnummer2)
{
  int KaartjesNummer = 1;
  achterkantKaart = loadImage ("MemoryDefaultVr.png");
  achterkantKaartMouseOver = loadImage ("MemoryDefault.png");
  Kaartje1 = loadImage ("Memory" + kaartnummer1 + ".png");
  Kaartje2 = loadImage ("Memory" + kaartnummer2 + ".png");
  
  imageMode(CORNER);
  
  achterkantKaart.resize((beginpuntafstandKaartje-10),(beginpuntafstandKaartje-10));
  achterkantKaartMouseOver.resize((beginpuntafstandKaartje-10),(beginpuntafstandKaartje-10));
  Kaartje1.resize((beginpuntafstandKaartje-10),(beginpuntafstandKaartje-10));
  Kaartje2.resize((beginpuntafstandKaartje-10),(beginpuntafstandKaartje-10));
  
  for (int y = 0; y < BerekenVerdeling(aantal * 2); y++)
  {
    for (int x = 0; x < (BerekenVerdeling(aantal * 2)) && KaartjesNummer < aantal * 2 +1; x++)
    {
      float positieKaartje = dist(((y * (beginpuntafstandKaartje)) + beginKaartjesPuntX), ((hoogteBerichtenvak + (x * (beginpuntafstandKaartje)) + beginKaartjesPuntY)), mouseX - (beginpuntafstandKaartje/2), mouseY - (beginpuntafstandKaartje/2));
      rectMode(CORNER);
      
      if (arrayKaartnummersOver[KaartjesNummer] != arrayKaartnummers[KaartjesNummer])
      {
        KaartjesNummer++;
        continue;
      }
      
      if (positieKaartje < beginpuntafstandKaartje / 2 && gekozenPlekjeArray1 != KaartjesNummer && gekozenPlekjeArray2 != KaartjesNummer)
      {
        image(achterkantKaartMouseOver, (y * beginpuntafstandKaartje) + beginKaartjesPuntX, (hoogteBerichtenvak + (x * beginpuntafstandKaartje)) + beginKaartjesPuntY);
        
        if (mousePressed == true)
        {
          GekliktKaartjeVerwerken(KaartjesNummer);
        }
      }
      else
      {        
        TekenKaartje(KaartjesNummer, y, x);
      }
      KaartjesNummer++;          
    }
  }
}

int BerekenGeklikteKaart(int Kaartnummer)
{
  if (arrayKaartnummers.length > 0)
  {
    return arrayKaartnummers[Kaartnummer];
  }
  else
  {
    return 0;
  }
}

void TekenKaartje(int kaartjesnummer, int indexI, int indexJ)
{
  if (gekozenPlekjeArray1 == kaartjesnummer)
  {
    image(Kaartje1, (indexI * beginpuntafstandKaartje) + beginKaartjesPuntX, (hoogteBerichtenvak + (indexJ * beginpuntafstandKaartje)) + beginKaartjesPuntY);
  }
  else if (gekozenPlekjeArray2 == kaartjesnummer)
  {
    image(Kaartje2, (indexI * beginpuntafstandKaartje) + beginKaartjesPuntX, (hoogteBerichtenvak + (indexJ * beginpuntafstandKaartje)) + beginKaartjesPuntY);
  }          
  else
  {
    image(achterkantKaart, (indexI * beginpuntafstandKaartje) + beginKaartjesPuntX, (hoogteBerichtenvak + (indexJ * beginpuntafstandKaartje)) + beginKaartjesPuntY);
  }
}

void GekliktKaartjeVerwerken(int kaartjesnummer)
{
  if (!kaartje1Gekozen)
  {
    gekozenPlekjeArray1 = kaartjesnummer;
    kaartje1Gekozen = true;
  }
  else if (!kaartje2Gekozen && (gekozenPlekjeArray1 != kaartjesnummer))
  {
    gekozenPlekjeArray2 = kaartjesnummer;
    kaartje2Gekozen = true;
  }
}

void KaartenSchudden()
{
  arrayKaartnummers = randomIntArrayAanmaken(aantalSetjes);
  for(int i = 0; i < arrayKaartnummers.length; i++)
  {
      arrayKaartnummersOver[i] = arrayKaartnummers[i];
  }
}

void CheckGeklikteKaartjes()
{
  if (BerekenGeklikteKaart(gekozenPlekjeArray1) == BerekenGeklikteKaart(gekozenPlekjeArray2))
  {
    if (isBeurtSpeler1)
    {
      puntenSpeler1++;
      beurtenSpeler1++;
      arrayKaartnummersOver[gekozenPlekjeArray1] = 0;
      arrayKaartnummersOver[gekozenPlekjeArray2] = 0;
    }
    else
    {
      puntenSpeler2++;
      beurtenSpeler2++;
      arrayKaartnummersOver[gekozenPlekjeArray1] = 0;
      arrayKaartnummersOver[gekozenPlekjeArray2] = 0;
    }
    potjeIsAfgelopen = true;
    for(int i = 0; i < arrayKaartnummersOver.length; i++)
    {
      if (arrayKaartnummersOver[i] != 0)
      {
        potjeIsAfgelopen = false;
      }
    }
  }
  else
  {
    if (isBeurtSpeler1)
    {
      beurtenSpeler1++;
      isBeurtSpeler1 = !isBeurtSpeler1;
    }
    else
    {
      beurtenSpeler2++;
      isBeurtSpeler1 = !isBeurtSpeler1;
    }
  }           
  gekozenPlekjeArray1 = 0;
  gekozenPlekjeArray2 = 0;
  kaartje1Gekozen = false;
  kaartje2Gekozen = false;
}

int BerekenVerdeling(int aantal)
{
  return ceil(sqrt(aantal));
}
int[] randomIntArrayAanmaken (int aantal)
{
  int [] halveset1 = randomIntArrayAanmakenHalfSetje(aantal);
  int [] halveset2 = randomIntArrayAanmakenHalfSetje(aantal);
  
  int [] samengevoegdeArray = concat(halveset1, halveset2);
  
  for (int i=0; i < samengevoegdeArray.length; i++) {
    int temp = samengevoegdeArray[i];
    int x = (int)random(0, samengevoegdeArray.length);   
    samengevoegdeArray[i]=samengevoegdeArray[x];
    samengevoegdeArray[x]=temp;
  } 
  int toevoegenNUL[] = new int[1]; // Deze 0 is nodig om een begintoestand te kunnen creeëren.
  samengevoegdeArray = concat(toevoegenNUL, samengevoegdeArray);
  return samengevoegdeArray;
}

int[] randomIntArrayAanmakenHalfSetje (int hoogsteNummer) 
{
  int[] nummersArray = new int [hoogsteNummer];
  int k = 0;
  while (k < hoogsteNummer) 
  {
    int randomNummer = (int)random(0, hoogsteNummer +1);
    if (isInArray(nummersArray, randomNummer))
    {
      nummersArray[k] = (randomNummer);
      k++;
    }
  }
  return nummersArray;
}

boolean isInArray(int[] a, int cijfer)
{
  for (int i = 0; i<a.length;i++)
  {
    if (a[i] == cijfer)
    {
      return false;
    }
  }
  return true;
}
