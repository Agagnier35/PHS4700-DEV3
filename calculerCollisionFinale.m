function calculerCollisionFinale(voitureA, voitureB, normale, pointCollision)
%--Dessiner les voitures lors de la collision
DessinerVoitures(voitureA, voitureB);

%--Calculer les vitesses apres la collsion--
vitesseAP = [voitureA.vitesse 0] + (cross(voitureA.wAngulaire, [voitureA.position 0] - pointCollision));
vitesseBP = [voitureB.vitesse 0] + (cross(voitureB.wAngulaire, [voitureB.position 0] - pointCollision));

vitesseRelativeP = vitesseAP - vitesseBP;
vRmoins = dot(vitesseRelativeP, normale);

j = -((1 + 0.8) * vRmoins)/((1/voitureA.masse) + (1/voitureB.masse));

voitureA.vitesse = [voitureA.vitesse 0] + (normale * j / voitureA.masse);
voitureB.vitesse = [voitureB.vitesse 0]+ (normale * j / voitureB.masse);

%--Calculer les vitesses angulaires apres rotation
matrixIa = [1/3*voitureA.masse*(voitureA.largeur^2) 0 0;0 1/3*voitureA.masse*(voitureA.longueur^2) 0; 0 0 1];
matrixIb = [1/3*voitureB.masse*(voitureB.largeur^2) 0 0;0 1/3*voitureB.masse*(voitureB.longueur^2) 0; 0 0 1];

voitureA.wAngulaire = voitureA.wAngulaire + (j * inv(matrixIa) * cross([voitureA.position 0] - pointCollision, normale).');
voitureB.wAngulaire = voitureB.wAngulaire + (j * inv(matrixIb) * cross([voitureB.position 0]- pointCollision, normale).');
