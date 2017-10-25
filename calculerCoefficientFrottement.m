function mu = calculerCoefficientFrottement(vitesse)
if(norm(vitesse)<50)
    mu = 0.15 * (1 - (norm(vitesse) / 100));
else
    mu = 0.075;
end