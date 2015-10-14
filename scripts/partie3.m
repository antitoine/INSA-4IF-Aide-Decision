addpath(genpath('/home/hverlin/Softwares/Matlab/plugins/graphviz4matlab'))

J = [
    6 5 5 5;
    5 2 6 7;
    3 7 5 4;
    5 4 3 9;
    3 5 7 4];

coef = [4 1 2 1];
echMax = 10;

seuilC = 0.7;
seuilD = 0.5;

nbLigne = size(J, 1);
nbCol = size(J, 2);

C = zeros(nbLigne, nbLigne);
sumCoef = sum(coef);

for i = 1:nbLigne
    for j = 1:nbLigne
        if (i ~= j)
           somme = 0;
           for c = 1:nbCol
               if (J(i,c) >= J(j,c))
                somme = somme + coef(c);
               end
           end
           C(i,j) = somme / sumCoef;
        end 
    end
end


D = zeros(nbLigne, nbLigne);
for i=1:nbLigne
    for j=1:nbLigne
        if i~=j
            maxiVect = zeros(nbLigne,1);
            for a=1:nbCol
                maxiVect(a) = (J(j, a)-J(i, a));
            end
            D(i, j) = max(maxiVect)/echMax;
        end
    end
end

adj = zeros(nbLigne);

for i = 1:nbLigne
    for j = 1:nbLigne
        if (D(i, j) <= seuilD && C(i, j) >= seuilC)
            adj(i, j) = 1;
        end 
    end
end

%labels = {'a','b','c','d','e','f','g','h'};
labels = {'a','b','d','e','h'};
s = graphViz4Matlab('-adjMat',adj,'-nodeLabels',labels);
%freeze(s); % convert to an image
