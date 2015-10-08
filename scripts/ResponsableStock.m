clear;
A = [1 2 1 5 0 2;
	2 2 1 2 2 1;
	1 0 3 2 2 0;
	8 15 0 5 0 10;
	7 12 2 15 7 12;
	8 1 11 0 10 25;
	2 10 5 4 13 7;
	5 0 8 7 10 25;
	5 5 3 12 8 6;
	5 3 5 8 0 7;
    -1 -1 -1 -1 -1 -1]; % On rajoute une contrainte sur le stock min (e dans le vecteur b)

e = -500;

b = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; e];

f = [5 ; 5; 6; 10; 5; 4];

lb = [5;5;0;0;0;0];

CA = [20 27 26 30 45 40];

ChargesMatiere = [13 14 13 27 12 10];
ChargesTempsMachine1 = [8 15 0 5 0 10] * (2/60);
ChargesTempsMachine2 = [7 12 2 15 7 12] * (2/60);
ChargesTempsMachine3 =[8 1 11 0 10 25] * (1/60);
ChargesTempsMachine4 =[2 10 5 4 13 7] * (1/60);
ChargesTempsMachine5 =[5 0 8 7 10 25] * (2/60);
ChargesTempsMachine6 =[5 5 3 12 8 6] * (3/60);
ChargesTempsMachine7 =[5 3 5 8 0 7] * (1/60);

Benefices = CA - (ChargesMatiere + ChargesTempsMachine1 + ChargesTempsMachine2 + ChargesTempsMachine3 + ChargesTempsMachine4 + ChargesTempsMachine5 + ChargesTempsMachine6 + ChargesTempsMachine7);

compteurMax = 379; 

j = 1;
jStock = 1;
jBenef = 1;

for i=1:1:compteurMax
    e = -i;
    b = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; e]; 
    [q, r, exflag] = linprog(f, A, b, [], [], lb, [], [], optimset('Display', 'off') );
    if (exflag == 1) 
        Q(j) = sum(q);
        Stock(j) = 5*q(1) + 5*q(2) + 6*q(3) + 10*q(4) + 5*q(5) + 4*q(6) ;
        
        Ben(j) = Benefices * q;
        
        % Calcul des coefficients directeurs pour les stocks
        if (i ~= 1 && Stock(j) > 51)
            StockStock(jStock) = Stock(j);
            CoefStock(jStock) = (Q(j) - Q(j-1)) / (Stock(j) - Stock(j-1));
            jStock = jStock + 1;
        end
        
        % Calcul des coefficients directeurs pour les benefices
        if (i ~= 1 && Stock(j) > 51)
            StockBen(jBenef) = Stock(j);
            CoefBen(jBenef) = (Ben(j) - Ben(j-1)) / (Stock(j) - Stock(j-1));
            jBenef = jBenef + 1;
        end
        
        j = j+1;
    end
end

figure(1)
plot(Stock, Q)
xlabel('Stock total')
ylabel('Nombre de produits')
title('Nombre de produits crees en fonction du stock total');

figure(2)
plot(StockStock, CoefStock, '*')
xlabel('Stock total')
ylabel('Produits fabriques par unite de stock')
title('Evolution du nombre de produits fabriques par unite de stock, en fonction du stock total');

figure(3) 
plot(Stock, Ben)
xlabel('Stock total')
ylabel('Benefice');
title('Benefice realise en fonction du stock total');

figure(4)
plot(StockBen, CoefBen, '*')
xlabel('Stock total')
ylabel('Benefice realise par unite de stock')
title('Evolution du benefice realise par unite de stock, en fonction du stock total');



