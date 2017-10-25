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
         end
     end
end