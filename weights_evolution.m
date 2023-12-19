%Inputs:
%w:  13 x 1 double  i.e. weights of 12 assets + cash
%r:  n x 13 double  i.e. returns vector

function [SR_annual] = weights_evolution(w,r)
    f = 5e-5;
    Rt = zeros(size(r,1),1); 
    for i = 1:size(r,1)
        if i == 1
             %we assume here f = 0;
             Rt(i) =  w(i,1:end-1)*r(i,:)';
        elseif i > 1
            
            %we take the given cost function
            cost = f*sum( abs( ( w(i-1,1:end-1) .* (1+r(i,:)) )/(1+w(i,1:end-1)*r(i,:)') - w(i,1:end-1)) ) ;
            
            %we take the given return function
            Rt(i) =  w(i,1:end-1)*r(i,:)' - cost ;
            
        end
    end
    SR_annual = - mean(Rt)/std(Rt) * sqrt(365*24) %note the minus sign, we need for the optmisation
end
