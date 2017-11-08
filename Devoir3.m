function [Coll, tf, raf, vaf, rbf, vbf] = Devoir3(rai, vai, rbi, vbi, tb)
angleA = acos(dot([vai(1) 0], [0 vai(2)]));
angleB = acos(dot([vbi(1) 0], [0 vbi(2)]));

[voitureA, voitureB] = InitialisationScene(rai, vai, rbi, vbi, angleA, angleB);

tempsEcoule = 0;
while(verifierCollisionIncertaine(voitureA, voitureB) == false || (norm(voitureA.vitesse) < 0.01 && norm(voitureB.vitesse) < 0.01))
    tempsEcoule = avancerLaScene(voitureA, voitureB, tempsEcoule,tb);    
end

[isCollisionA, normaleA, pointCollisionA] = verifierCollisionCertaine(voitureA, voitureB);
[isCollisionB, normaleB, pointCollisionB] = verifierCollisionCertaine(voitureA, voitureB);

while(( isCollisionA == false && isCollisionB == false ) || (norm(voitureA.vitesse) < 0.01 && norm(voitureB.vitesse) < 0.01))
   tempsEcoule = avancerLaScene(voitureA, voitureB, tempsEcoule,tb);  
end

if((norm(voitureA.vitesse) < 0.01 && norm(voitureB.vitesse) < 0.01) == false)
    if(isCollisionA == true)
        calculerCollisionFinale(voitureA, voitureB, normaleA, pointCollisionA);%TODO
    elseif(isCollisionB == true)
        calculerCollisionFinale(voitureA, voitureB, normaleB, pointCollisionB);%TODO
    end
end


%--imprimer les resultats--TODO
%Dessiner les scenes TODO
