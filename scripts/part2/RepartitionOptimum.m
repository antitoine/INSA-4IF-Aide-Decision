clear

maxMoyenne = 0;
ParamMoyenne = zeros(1, 4);

maxEcartType = 0;

tailleGain = 5;

for iComptable = 7000:10:10408
    for iStock = 1600:10:1800
       for iCommercial = 0:5:100
          for iPersonnel = 940:100:3000
              [Q, exflag] = RespEntreprise(-iComptable, iStock, iCommercial, iPersonnel);
              [Gain, GainPM] = gain_matrix(Q);

              if (exflag == 1)
              
                  moyenne = mean(Gain);
                  
                  if (moyenne > maxMoyenne)
                      maxMoyenne = moyenne;
                      QMaxMoyenne = Q;
                      GainPMMaxMoyenne = GainPM;
                      GainMaxMoyenne = Gain;
                      ParamMoyenne(1) = iComptable;
                      ParamMoyenne(2) = iStock;
                      ParamMoyenne(3) = iCommercial;
                      ParamMoyenne(4) = iPersonnel;
                  end
                  
                  % Calcul de l'ecart type
                  somme = 0;
                  for i_EcartType = 1:tailleGain
                      delta = Gain(1, i_EcartType) - moyenne;
                      somme = somme + delta * delta;
                  end
                  
                  ecartType = sqrt(somme / (tailleGain - 1));

                  if (ecartType > maxEcartType)
                      maxEcartType = ecartType;
                      QMaxEcartType = Q;
                      GainMaxPMEcartType = GainPM;
                      GainMaxEcartType = Gain;
                      ParamEcartType(1) = iComptable;
                      ParamEcartType(2) = iStock;
                      ParamEcartType(3) = iCommercial;
                      ParamEcartType(4) = iPersonnel;
                  end
              
              end
          end
       end
       display('stock :')
       iStock
    end
    display('comptable :')
    iComptable
end

QMaxMoyenne
GainMaxMoyenne
ParamMoyenne

QMaxEcartType
GainMaxEcartType
ParamEcartType