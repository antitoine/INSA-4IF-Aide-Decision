%
%   Cette fonction retourne pour un point max Q et un point de mire PM
%   le score de ce point pour les differentes fonctions objectif des
%   responsables relativement au meilleur score
%
function [ R, RN ] = ad_scores( Q, PM )

% Definition des fonctions objectif de chaque responsable
fobj_comptable = [5.8883; 11.6167; 12.1667; 1.3; 31.65; 27.4833];
         	 
fobj_resp_atelier = [1; 1; 1; 1; 1; 1];
            	 
fobj_resp_stock = [5; 5; 6; 10; 5; 4];
          	 
% On considere l'ecart entre les produits A et E
fobj_resp_co = [1; 0; 0; 0; -1; 0]; 

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
RN(1,5) = ( 1 - ( abs(R(1,5) - PM(1,5)) / (PM(1,5)*10) ) ) * 100;

end






%
%   Cette fonction calcule la matrice de gain
%
%
function [ G ] = gain_matrix()

% Creation de la matrice de points optimaux pour chaque
% responsable :
%
%  Comptable
%  Resp Atelier
%  Resp Stock
%  Resp Commercial
%  Resp Personnel
%
Q = [5 18 0 0 240 93.67;
	5 54.64 38.85 0 181.71 98.43;
	5 5 0 0 56.5 167.5;
	119.08 6.91 42.58 0 119.08 87.24;
	270 5 70 0 0 0];

% Calcul de l'ecart maximal entre qA et qE
e=0;
for i=1:5
	e_tmp = abs(Q(i,1) - Q(i,5));
	if e_tmp > e
    	e = e_tmp;
	end
end

% Point de Mire
PM = [10048 378.63 1003 e 940];

% Initialisation de la matrice de gain
G = zeros(5,5);

% Construction de la matrice de gain
for i=1:5
 	[R,RN] = ad_scores(Q(i,:), PM);
 	G(i,:) = RN;
end

end

