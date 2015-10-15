%
%   Cette fonction retourne pour un point max Q et un point de mire PM
%   le score de ce point pour les differentes fonctions objectif des
%   responsables relativement au meilleur score
%
function [ R, RN ] = ad_scores( Q, PM )

% Definition des fonctions objectif de chaque responsable
fobj_comptable = [5.8883;11.6167;12.1667;1.3;31.65;27.4833];
         	 
fobj_resp_atelier = [1;1;1;1;1;1];
            	 
fobj_resp_stock = [5;5;6;10;5;4];
          	 
fobj_resp_co = [1;0;0;0;-1;0]; % On considere l'ecart entre les produits A et E

fobj_personnel = [2;10;5;4;13;7];
         	 
% Initialisation des vecteurs de resultats
R = zeros(1,5);
RN = zeros(1,5);

% Calcul du resultat du point Q pour chaque fonction objectif
R(1,1) = Q*fobj_comptable;
R(1,2) = Q*fobj_resp_atelier;
R(1,3) = Q*fobj_resp_stock;
R(1,4) = Q*fobj_resp_co;
R(1,5) = Q*fobj_personnel;

% On normalise les resultats selon chaque colonne
% /!\ Attention, ne pas comparer les colonnes entre elles,
% 	cela n'aurait aucun sens les echelles etant relatives
% 	On peut, par contre, comparer les lignes entre elles
RN(1,1) = ( 1 - (abs(R(1,1) - PM(1,1))/PM(1,1)) ) * 100;
RN(1,2) = ( 1 - (abs(R(1,2) - PM(1,2))/PM(1,2)) ) * 100;
RN(1,3) = ( 1 - (abs(R(1,3) - PM(1,3))/PM(1,3)) ) * 100;
RN(1,4) = (1 -  (abs(Q(1) - Q(5))/PM(1,4)))*100;
RN(1,5) = ( 1 - ( abs(R(1,5) - PM(1,5)) / (PM(1,5)) ) ) * 100;

end