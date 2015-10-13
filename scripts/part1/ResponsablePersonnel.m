Aa = [1 2 1 5 0 2; 
    2 2 1 2 2 1; 
    1 0 3 2 2 0; 
    8 15 0 5 0 10; 
    7 12 2 15 7 12; 
    8 1 11 0 10 25; 
    2 10 5 4 13 7; 
    5 0 8 7 10 25; 
    5 5 3 12 8 6; 
    5 3 5 8 0 7
    -1 -1 -1 -1 -1 -1];

e = -500;

ba = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; e];

lb = [5;5;0;0;0;0];

% on part des quantites max optimales calculees par le resp atelier.
lbi = [5;54.64;38.85;0;181.72;98.43];

% pourcentage de quantite qu on garde.

ecart = 0.5;

fp = [2 ; 10; 5; 4; 13; 7];

minutesTotMax = transpose(fp)*lbi
iGraph = 1;

for i=1:400,
    % ecarts(i) = ecart;
    % lb = lbi * ecart;
    
    e = -i;
    ba = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; e];
    
    [q, r, exflag] = linprog(fp, Aa, ba, [], [], lb);
    
    if (exflag == 1) 
        minutesTot(iGraph) = transpose(fp)*q;
        nbProduitsFabriques(iGraph) = sum(q);
        iGraph = iGraph + 1;
    end
    
    % minutesTot(i) = transpose(fp)*lb;
    
    ecart = ecart + 0.05;
    
end

plot(nbProduitsFabriques, minutesTot)
xlabel('Nombre de produits (unite)')
ylabel('Temps d utilisation de la machine 4 (min)')
title('Temps d utilisation de la machine 4 selon le nombre de produits fabriques')
