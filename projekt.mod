# Zmienne decyzyjne
var s1 >= 0; # ilość wykorzystanego w tonach surowca 1
var s2 >= 0; # ilość wykorzystanego w tonach surowca 2 
var c1 >= 0 integer; # ilość ciężarówek do transportu surowca 1
var c2 >= 0 integer; # ilość ciężarówek do transportu surowca 2
var p1 >= 0 integer; # ilość przyczep do transportu surowca 1
var sp1 >= 0; # ilość surowca 1 w tonach, przeznaczona do przygotowywalni
var sp2 >= 0; # ilość surowca 2 w tonach, przeznaczona do przygotowywalni
var sz2 >= 0; # ilość surowca 2 w tonach, przeznaczona do zakładu obróbki cieplnej
var sd11 >=0; # ilość surowca 1 przeznaczonego na produkcje półproduktu D1 w tonach
var sd12 >=0; # ilość surowca 1 przeznaczonego na produkcje półproduktu D2 w tonach
var sd21 >=0; # ilość surowca 2 przeznaczonego na produkcje półproduktu D1 w tonach
var sd22 >=0; # ilość surowca 2 przeznaczonego na produkcje półproduktu D2 w tonach
var sd1 >= 0; # ilość wyprodukowanego półproduktu D1 w tonach
var sd2 >= 0; # ilość wyprodukowanego półproduktu D2 w tonach
var w1 >= 0; # ilość wyprodukowanego wyrobu 1 w tonach
var w2 >= 0; # ilość wyprodukowanego wyrobu 2 w tonach
var p >= 0 integer; # ilość zatrudnionych pracowników w przygotowalni
var lpt >= 0 integer; # liczba pełnych wielokrotności 150 ton
var kz1 >= 0; # koszt surowca 1
var kz2 >= 0; # koszt surowca 2
var fz2 >= 0; # koszt pracy zakładu obróbki
var ys21 binary; # zmienna binarne dotycząca kosztu surowca 2
var ys22 binary; # zmienna binarne dotycząca kosztu surowca 2
var ys23 binary; # zmienna binarne dotycząca kosztu surowca 2
var yz1 binary; # zmienne binarna kosztu zakładu obróbki cieplnej
var yz2 binary; # zmienne binarna kosztu zakładu obróbki cieplnej

# Parametry
param M := 200000;

#Funkcja celu
maximize fz:440*w1+536*w2-kz1-kz2-fz2-(1100*c1+670*p1+1500*c2)-(170*p);

# Ograniczenia
subject to o1: s1 <= 11000;
subject to o2: s2 <= 11000;
subject to o3: 24*c1+13*p1 >= s1;
subject to o4: 25*c2 >= s2;
subject to o5: sp1 = s1; 
subject to o6: s2 = sp2+sz2;
subject to o7: sp1+sp2 >= 0;
subject to o8: sp1+sp2 <= 17600;
subject to o9: sz2 <= 8250;
subject to o10: w1 >= 5500;
subject to o11: w2 >= 5500;
subject to o12: w1 = sd1;
subject to o13: w2 = sd2+sz2;
subject to o14: p >= 2;
subject to o15: lpt >= (sp1+sp2)/150;
subject to o16: p >= 2*lpt;
subject to o17: c1 <= 343;
subject to o18: p1 <= c1;
subject to o19: kz1 >= 9*s1;
subject to o20: kz1 >= 9*3200+12*(s1-3200);
subject to o21: kz1 >= 9*3200+12*(6831-3200)+15*(s1-6831);
subject to o22: kz2 >= 11*s2-M*(1-ys21);
subject to o23: kz2 >= 11*2029+8*(s2-2029)-M*(1-ys22);
subject to o24: kz2 >= 11*2029+8*(5618-2029)+5*(s2-5618)-M*(1-ys23);
subject to o25: sz2 <= M*yz1+2750*(1-yz1);
subject to o26: sz2 <= M*yz2+5500*(1-yz2);
subject to o27: sz2 <= 8250;
subject to o28: fz2 = 10000*yz1+30000*yz2;
subject to o29: ys21+ys22+ys23=1;
subject to o30: 0.4*sd11+0.8*sd21=sd1;
subject to o31: 0.6*sd12+0.2*sd22=sd2;
subject to o32: sd11+sd12=sp1;
subject to o33: sd21+sd22=sp2;