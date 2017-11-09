function force = calculerForceFrottement(voiture)
mu = calculerCoefficientFrottement(voiture.vitesse);
force = -mu* voiture.masse * 9.81 * (voiture.vitesse / norm(voiture.vitesse));