function tempsEcoule = avancerLaScene(voitureA, voitureB, tempsEcoule,tb)
deltaT = 0.01;
oldPositionA = voitureA.position;
oldPositionB = voitureB.position;

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

%--Dessiner la position des auto
plot([oldPositionA(1) voitureA.position(1)], [oldPositionA(2) voitureA.position(2)],'b');
hold on
plot([oldPositionB(1) voitureB.position(1)], [oldPositionB(2) voitureB.position(2)],'r');
hold on
