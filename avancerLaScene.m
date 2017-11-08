function tempsEcoule = avancerLaScene(voitureA, voitureB, tempsEcoule,tb)
deltaT = 0.1;
calculerNouveauxParametre(voitureA, deltaT);
rotationVoiture(voitureA, deltaT);
translationVoiture(voitureA, deltaT);

if(tempsEcoule > tb)
    calculerNouveauxParametre(voitureB, deltaT);
    rotationVoiture(voitureB, deltaT);
end
translationVoiture(voitureB, deltaT);
voitureA.CalculerCoinsVoiture;
voitureB.CalculerCoinsVoiture;
tempsEcoule = tempsEcoule + deltaT;
