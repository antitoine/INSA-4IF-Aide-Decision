function [Q, exflag] = RespEntreprise(borneComptable, borneStock, borneCommercial, bornePersonnel)

% Degradation de la fct objectif pour le resp d'atelier : au moins 90%
% de son point de mire, soit 340

% Pour le stock : 1 003 selon le resp stock, au max. On autorise jusqu'e
% 30% au dessus, soit 1 309

% Pour le commercial : Ecart entre qA et qE doit etre inferieur e 50% des
% 119 produits A et 119 produits, soit 60

% Pour le personnel : 910 m selon le resp. on autorise jusqu'e 80% au
% dessus, soit 1 692

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
    -5.8333 -11.6167 -12.1667    -1.3000   -31.6500   -27.4833; % Comptable
    5 5 6 10 5 4; % Stock
    -1 0 0 0 1 0; % Commercial
    1 0 0 0 -1 0; % Commercial
    2 10 5 4 13 7 % Personnel : Sans le personnel, la comptabilite est davantage favorable
    ];

%borneComptable = -7100;
%borneStock = 1800;
%borneCommercial = 60;
%bornePersonnel = 2700;

lb = [5; 5; 0; 0; 0; 0];
b = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800; borneComptable; borneStock; borneCommercial; borneCommercial; bornePersonnel];
f = [-1; -1; -1; -1; -1; -1];

[Q, r, exflag] = linprog(f, A, b, [], [], lb, [], [], optimset('Display', 'off'));

Q = Q';


% Resultats : Avec resp personnel
% 7533.5989       371.7126      1800.0004        -3.1056      2700.0009

% Resultats : Sans resp personnel
% 8219.5773       372.7819      1799.9998            -60      3061.5786

end