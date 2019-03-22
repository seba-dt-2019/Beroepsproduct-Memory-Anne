void D_RandomKaartjesOmdraaien(int[] array)
{
  boolean isNietNul = false;
  if (!kaartje1Gekozen || !kaartje2Gekozen)
  {
    isNietNul = true;
  }
  while(isNietNul)
  {
    int randomNummer = (int)random(0, array.length);
    if (array[randomNummer] != 0 && randomNummer != gekozenPlekjeArray1)
    {
      if(!kaartje1Gekozen)
      {
        gekozenPlekjeArray1 = randomNummer;
        kaartje1Gekozen = true;
      }
      else
      {
        gekozenPlekjeArray2 = randomNummer;
        kaartje2Gekozen = true;
      }
      isNietNul = false;
    }
  }
}
