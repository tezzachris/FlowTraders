function [c,ceq] = weight_contraints(w)
c = [];
ceq = sum ( abs( w ) , 2 ) - 1 ;
end
