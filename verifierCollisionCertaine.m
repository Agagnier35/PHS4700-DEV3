function [isCollision, normalPlan, pointCollision] = verifierCollisionCertaine(voitureA, voitureB)
isCollision =false;
pointCollision = [];
normalPlan = [];
for idxB = 1:size(voitureB.coins)
    coinB = [voitureB.coins(idxB, :) 0];
    collionPossibleCounter = 0;
    normalArray = [];
    distanceArray = [];
    
    for idx = 1:size(voitureA.coins)
        coin1A = [voitureA.coins(idx, :) 0];
        if(idx < numel(voitureA.coins)/2)
            coin2A = [voitureA.coins(idx+1, :) 0];
        else
            coin2A = [voitureA.coins(1,:) 0];
        end
        coin3A = coin1A + [0 0 1];
        vector1 = coin1A - coin2A;
        vector2 = coin1A - coin3A;

        crossCoinA = cross(vector1, vector2);

        normalPlan = crossCoinA / norm(crossCoinA);
        
        distance = dot(normalPlan,(coinB - coin1A));
        distanceArray = [distanceArray distance];
        normalArray = [normalArray; normalPlan];
        
        if(distance <0)
            collionPossibleCounter = collionPossibleCounter + 1;
        end
    end
    if(collionPossibleCounter == numel(voitureA.coins)/2)
        isCollision = true;
        pointCollision = coinB;

        %finding the index of the distance closest to 0 -> surface most
        %likely in collision versus the others
        closestIndex = 1;
        diff = intmax;
        for i = 1:numel(distanceArray)
            abso = abs(distanceArray(i));
            if(abso<diff)
                closestIndex = i;
                diff = abso;
            end
        end
        normalPlan = normalArray(closestIndex,:);
        break;
    end
end
