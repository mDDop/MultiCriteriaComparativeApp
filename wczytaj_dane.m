%-------------------------------------------------------------
% plik wczytuj¹cy dane wejœciowe
%-------------------------------------------------------------
% Hubert Gawryœ   2014-03-16
% Instytut Zarz¹dzania w Budownictwie i Transporcie (L-3)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
% Xij        - macierz ocen wariantów dla kryteriów
% SD         - wektor charakteru kryteriów
% Vij        - wektor wag kryteriów
%-------------------------------------------------------------
    s11={get(w1,'String')};
    Xij=str2num(cell2mat(s11));
    %---------------------------------------------------------
    s12={get(w2,'String')};
    SD=str2num(cell2mat(s12));
    %---------------------------------------------------------
    s13={get(w3,'String')};
    Vij=str2num(cell2mat(s13));
    %---------------------------------------------------------
