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
             obj.wAngulaire = [0 0 w];
             obj.accAngulaire = 0;
             obj.angle = an;
             obj.coins = [];
             obj.CalculerCoinsVoiture;
         end
         
         function CalculerCoinsVoiture(v)
             v.coins = [];
             coin1 = [v.position(1) - (v.longueur/2) v.position(2) - (v.largeur/2)];
             coin2 = [v.position(1) + (v.longueur/2) v.position(2) - (v.largeur/2)];
             coin3 = [v.position(1) + (v.longueur/2) v.position(2) + (v.largeur/2)];
             coin4 = [v.position(1) - (v.longueur/2) v.position(2) + (v.largeur/2)];
             
             coinsAR = [coin1; coin2; coin3; coin4];
                         
             matrixRot = rotz(rad2deg(v.angle));
             matrixCenter = [v.position(1) v.position(2) 0].';
             
             for idx=1:size(coinsAR)
                coin = [coinsAR(idx,:) 0].';
                coinR = matrixRot * (coin - matrixCenter) + matrixCenter;
                v.coins = [v.coins; coinR([1,2]).'];
             end
         end
     end
end