function [Coll, tf, raf, vaf, rbf, vbf] = Devoir3(rai, vai, rbi, vbi, tb)
angleA = trouverAngleVoiture(vai);
angleB = trouverAngleVoiture(vbi);

[voitureA, voitureB] = initialisationScene(rai, vai, rbi, vbi, angleA, angleB);

tempsEcoule = 0;
Coll =1;

while(norm(voitureA.vitesse) > 0.01 || norm(voitureB.vitesse) > 0.01)
    tempsEcoule = avancerLaScene(voitureA, voitureB, tempsEcoule,tb);
    if(verifierCollisionIncertaine(voitureA, voitureB)==true)
        [isCollisionA, normaleA, pointCollisionA] = verifierCollisionCertaine(voitureA, voitureB);
        [isCollisionB, normaleB, pointCollisionB] = verifierCollisionCertaine(voitureA, voitureB);
        if(isCollisionA == true)
            calculerCollisionFinale(voitureA, voitureB, normaleA, pointCollisionA);
            Coll = 0;
            break;
        elseif(isCollisionB == true)
            calculerCollisionFinale(voitureA, voitureB, normaleB, pointCollisionB);
            Coll = 0;
            break;
        end
    end
end


%--imprimer les resultats--
grid on
axis equal

tf = tempsEcoule;
raf = [voitureA.position(1) voitureA.position(2) voitureA.angle];
vaf = [voitureA.vitesse(1) voitureA.vitesse(2) voitureA.wAngulaire(3)];

rbf = [voitureB.position(1) voitureB.position(2) voitureB.angle];
vbf = [voitureB.vitesse(1) voitureB.vitesse(2) voitureB.wAngulaire(3)];

if(Coll == 0)
    fprintf("Collision! \n");
elseif(Coll == 1)
    fprintf("Aucune collision... \n");
end

fprintf("Temps final de la simulation: ");
    fprintf(num2str(tf));fprintf(" secondes. \n\n");

fprintf("Position Finale de l'auto A (x, y, angle): ");
    fprintf(num2str(raf(1)));fprintf(", ");
    fprintf(num2str(raf(2)));fprintf(", ");
    fprintf(num2str(raf(3)));fprintf(";\n");
fprintf("Vitesse Finale de l'auto A (x, y, w): ");
    fprintf(num2str(vaf(1)));fprintf(", ");
    fprintf(num2str(vaf(2)));fprintf(", ");
    fprintf(num2str(vaf(3)));fprintf(";\n\n");
    
fprintf("Position Finale de l'auto B (x, y, angle): ");
    fprintf(num2str(rbf(1)));fprintf(", ");
    fprintf(num2str(rbf(2)));fprintf(", ");
    fprintf(num2str(rbf(3)));fprintf(";\n");
fprintf("Vitesse Finale de l'auto B (x, y, w): ");
    fprintf(num2str(vbf(1)));fprintf(", ");
    fprintf(num2str(vbf(2)));fprintf(", ");
    fprintf(num2str(vbf(3)));fprintf(";\n");

