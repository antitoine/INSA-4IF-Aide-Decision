% Cette fonction calcule la matrice de gains
function [Gain, Gains_PointsMire] = gain_matrix(Q)

% Creation de la matrice de points optimaux pour chaque
% responsable :
%
%  Comptable
%  Resp Atelier
%  Resp Stock
%  Resp Commercial
%  Resp Personnel
%
Q_test = [
    5 18.16 0 0 240 93.67;
	5 54.64 38.85 0 181.71 98.43;
	5.0000   59.8958    0.0000    0.0000  188.5000  112.6042;
	119.08 6.91 42.58 0 119.08 87.24;
	270 5 70 0 0 0
    
]; % Sans resp personnel

Q = Q_test;

[M, N] = size(Q);

% Calcul de l'ecart maximal entre qA et qE
e=0;
for i=1:M
	e_tmp = abs(Q(i,1) - Q(i,5));
	if e_tmp > e
    	e = e_tmp;
	end
end

e = 270;

% Point de Mire
PM = [10048 378.63 1717 e 940];

% Initialisation de la matrice de gain
Gain = zeros(M,5);
Gains_PointsMire = zeros(M, 5);

% Construction de la matrice de gain
for i=1:M
 	[R,RN] = ad_scores(Q(i,:), PM);
 	Gain(i,:) = RN;
    Gains_PointsMire(i,:) = R;
end

end
