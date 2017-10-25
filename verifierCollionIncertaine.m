function bool = verifierCollionIncertaine(voitureA, voitureB)
bool = norm(voitureA.position - voitureB.position) == (CalculerRayonSphereAuto(voitureA) + CalculerRayonSphereAuto(voitureB));
    