



f=readtable('features_test.csv');

df = table2array(f);

r=readtable('returns_test.csv');

dr = table2array(r);

options = optimoptions(@fmincon,'Display','iter','MaxFunctionEvaluations',3e5);%,'Algorithm','sqp','MaxFunEvals',20000,'MaxIter',1000,'TolFun',1e-15,'TolX',1e-15);
   
    %nonlcons = @(w) nonlcon(w);
n = size(r2,1); %1728 - 8637
d = size(r,2);
weights3=zeros(8637-1728,d+1);
for j = 8629:1:8637
    nonlcons = @(w) nonlcon(w);
    r3=r2(8629:end,:);
    w0 = repmat(1/(d+1),[8+1,d+1]); %starting weights
    weights3 = fmincon(@(w) wevol(w,r3),w0,[],[],[],[],[],[],nonlcons,options);
end
    

weights(1721:1727,:) = fmincon(@(w) wevol(w,r2),w0,[],[],[],[],[],[],nonlcons,options);
writematrix(weightssub, "submission.txt","Delimiter",' ');

