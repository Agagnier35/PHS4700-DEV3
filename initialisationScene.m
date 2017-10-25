function [voitureA, voitureB] = initialisationScene (rai, vai,rbi,vbi, anA, anB)
voitureA = Voiture(1540, 4.78, 1.82, 1.8, rai, [vai(1) vai(2)], vai(3), anA);
voitureB = Voiture(1010, 4.23, 1.6, 1.8, rbi, [vbi(1) vbi(2)], vbi(3), anB);