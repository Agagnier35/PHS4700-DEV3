function bool = verifierCollisionIncertaine(voitureA, voitureB)
bool = norm(voitureA.position - voitureB.position) == (CalculerRayonSphereAuto(voitureA) + CalculerRayonSphereAuto(voitureB));
    