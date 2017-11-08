classdef Voiture < handle
    properties
        masse
        longueur
        largeur
        hauteur
        position
        vitesse
        acceleration
        wAngulaire
        accAngulaire
        angle
        coins
    end
     methods 
         function obj = Voiture(m, lo, la, h, p, vi, w, an)
             obj.masse = m;
             obj.longueur = lo;
             obj.largeur = la;
             obj.hauteur = h;
             obj.position = p;
             obj.vitesse = vi;
             obj.acceleration = 0;
             obj.wAngulaire = w;
             obj.accAngulaire = 0;
             obj.angle = an;
             obj.CalculerCoinsVoiture;
         end
         
         function CalculerCoinsVoiture(v)
             coin1 = [v.position(1) - (v.longueur/2) v.position(2) - (v.hauteur/2)];
             coin2 = [v.position(1) + (v.longueur/2) v.position(2) - (v.hauteur/2)];
             coin3 = [v.position(1) + (v.longueur/2) v.position(2) + (v.hauteur/2)];
             coin4 = [v.position(1) - (v.longueur/2) v.position(2) + (v.hauteur/2)];
             
             matrixRot = rotz(v.angle);
             
             coin1R = coin1 * matrixRot;
             coin2R = coin2 * matrixRot;
             coin3R = coin3 * matrixRot;
             coin4R = coin4 * matrixRot;
             
             v.coins = [coin1R coin2R coin3R coin4R];
         end
     end
end