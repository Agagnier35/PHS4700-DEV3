function translationVoiture(voiture, deltaT)
voiture.position = voiture.position + voiture.vitesse * deltaT + 0.5*deltaT^2*voiture.acceleration;