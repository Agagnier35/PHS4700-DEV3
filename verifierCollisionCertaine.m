function [isCollision, normalPlan, pointCollision] = verifierCollisionCertaine(voitureA, voitureB)
for idx = 1:size(voitureA.coins)
    coin1A = [voitureA.coins(idx, :) 0];
    if(idx ~= size(voitureA.coins))
        coin2A = [voitureA.coins(idx+1, :) 0];
    else
        coin2A = [voitureA.coins(1,:) 0];
    end
    coin3A = coin1A + [0 0 1];
    vector1 = coin1A - coin2A;
    vector2 = coin1A - coin3A;
    
    crossCoinA = cross(vector1, vector2);
    
    normalPlan = crossCoinA / norm(crossCoinA);
    
    for idxB = 1:size(voitureB.coins)
        coinB = [voitureB.coins(idxB, :) 0];
        distance = dot(normalPlan,(coinB - coin1A));
        if(distance <= 0)
            isCollision = true;
            pointCollision = coinB;
            break;
        end
    end
end