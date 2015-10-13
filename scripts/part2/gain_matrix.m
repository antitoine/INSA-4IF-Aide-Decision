%   Cette fonction calcule la matrice de gain
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
Q_test = [5 18 0 0 240 93.67;
	5 54.64 38.85 0 181.71 98.43;
	5 5 0 0 56.5 167.5;
	119.08 6.91 42.58 0 119.08 87.24;
	270 5 70 0 0 0;
    %118.2609    8.6602   32.4312    0.0000  121.3665   90.9938]; % Avec resp personnel
    81.5789   24.0602   30.8271    0.0000  141.5789   94.7368]; % Sans resp personnel

[M, N] = size(Q);

% Calcul de l'ecart maximal entre qA et qE
e=0;
for i=1:M
	e_tmp = abs(Q(i,1) - Q(i,5));
	if e_tmp > e
    	e = e_tmp;
	end
end

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

%num2str(Gains_PointsMire)

end