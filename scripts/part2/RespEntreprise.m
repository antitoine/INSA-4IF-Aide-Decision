function [Q, exflag] = RespEntreprise(borneComptable, borneStock, borneCommercial, bornePersonnel)

A = [ 
    1 2 1 5 0 2; 
    2 2 1 2 2 1; 
    1 0 3 2 2 0; 
    8 15 0 5 0 10; 
    7 12 2 15 7 12; 
    8 1 11 0 10 25; 
    2 10 5 4 13 7; 
    5 0 8 7 10 25; 
    5 5 3 12 8 6; 
    5 3 5 8 0 7;
    -5.8333 -11.6167 -12.1667 -1.3000 -31.6500 -27.4833 % Comptable
    -1 0 0 0 1 0; % Commercial
    1 0 0 0 -1 0; % Commercial   
    2 10 5 4 13 7; % Personnel : Sans le personnel, la comptabilite est davantage favorable
    5 5 6 10 5 4; % Stock
    ];

borneComptable = -7285.6;
borneCommercial = 54;
bornePersonnel = 2500;
borneStock = 1717;

lb = [5; 5; 0; 0; 0; 0];
b = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; borneComptable; borneCommercial; borneCommercial; bornePersonnel; borneStock ];
f = [-1; -1; -1; -1; -1; -1];

[Q, r, exflag] = linprog(f, A, b, [], [], lb, [], [], optimset('Display', 'off'));

Q = Q';

end