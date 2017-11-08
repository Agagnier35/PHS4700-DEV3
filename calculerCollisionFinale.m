function calculerCollisionFinale(voitureA, voitureB, normale, pointCollision)
vitesseAP = voitureA.vitesse + (cross(voitureA.wAngulaire, voitureA.position - pointCollision));
vitesseBP = voitureB.vitesse + (cross(voitureB.wAngulaire, voitureB.position - pointCollision));

vitesseRelativeP = vitesseAP - vitesseBP;
vRmoins = vitesseRelativeP * normale;

j = -((1 + 0.8) * vRmoins)/((1/voitureA.masse) + (1/voitureB.masse));

voitureA.vitesse = voitureA.vitesse + (normale * j / voitureA.masse);
voitureB.vitesse = voitureB.vitesse + (normale * j / voitureB.masse);

while( )