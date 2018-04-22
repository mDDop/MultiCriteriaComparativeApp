%-------------------------------------------------------------
% plik wczytuj�cy dane wej�ciowe
%-------------------------------------------------------------
% Hubert Gawry�   2014-03-16
% Instytut Zarz�dzania w Budownictwie i Transporcie (L-3)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% Xij        - macierz ocen wariant�w dla kryteri�w
% SD         - wektor charakteru kryteri�w
% Vij        - wektor wag kryteri�w
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
