function angle = trouverAngleVoiture(v)
if(v(1)~=0)
    angle = atan(v(2)/v(1));
    if(v(1)< 0)
        angle = angle + pi;
    end
else
    angle = pi/2*sign(v(2));
end
    
