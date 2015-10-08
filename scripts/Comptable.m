A = [ 1 2 1 5 0 2; 2 2 1 2 2 1; 1 0 3 2 2 0; 8 15 0 5 0 10; 7 12 2 15 7 12; 8 1 11 0 10 25; 2 10 5 4 13 7; 5 0 8 7 10 25; 5 5 3 12 8 6; 5 3 5 8 0 7];
lb = [5; 5; 0; 0; 0; 0];
b = [350; 620; 485; 4800; 4800; 4800; 4800; 4800; 4800; 4800];

CA = [20 27 26 30 45 40]
ChargesMatiere = [13 14 13 27 12 10]
ChargesTempsMachine1 = [8 15 0 5 0 10] * (2/60)
ChargesTempsMachine2 = [7 12 2 15 7 12] * (2/60)
ChargesTempsMachine3 =[8 1 11 0 10 25] * (1/60)
ChargesTempsMachine4 =[2 10 5 4 13 7] * (1/60)
ChargesTempsMachine5 =[5 0 8 7 10 25] * (2/60)
ChargesTempsMachine6 =[5 5 3 12 8 6] * (3/60)
ChargesTempsMachine7 =[5 3 5 8 0 7] * (1/60)

Benefices = CA - (ChargesMatiere + ChargesTempsMachine1 + ChargesTempsMachine2 + ChargesTempsMachine3 + ChargesTempsMachine4 + ChargesTempsMachine5 + ChargesTempsMachine6 + ChargesTempsMachine7)

linprog(-Benefices, A, b, [], [], lb, [])
