clear

maxMoyenne = 0;
Param = zeros(1, 4);

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
                      QMax = Q;
                      GainMax = GainPM;
                      Param(1) = iComptable;
                      Param(2) = iStock;
                      Param(3) = iCommercial;
                      Param(4) = iPersonnel;
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

QMax
GainMax
Param