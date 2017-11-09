function DessinerVoitures(voitureA, voitureB)
autoAX=[];
autoAY=[];
for idx=1:size(voitureA.coins)
    coin = voitureA.coins(idx,:);
    autoAX =  horzcat(autoAX, coin(1));
    autoAY =  horzcat(autoAY, coin(2));
end
patch(autoAX, autoAY, 'b');
hold on

autoBX=[];
autoBY=[];
for idx=1:size(voitureB.coins)
    coin = voitureB.coins(idx, :);
    autoBX =  horzcat(autoBX, coin(1));
    autoBY =  horzcat(autoBY, coin(2));
end
patch(autoBX, autoBY,'r');
hold on