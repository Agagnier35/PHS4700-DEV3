function calculerNouveauxParametre(voiture, deltaT)
voiture.acceleration = calculerForceFrottement(voiture) / voiture.masse;
voiture.vitesse = voiture.vitesse + deltaT * voiture.acceleration;