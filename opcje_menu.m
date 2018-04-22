function t=opcje_menu(nr1,nr2)
%-------------------------------------------------------------
% plik zawieraj�cy nazwy pozycji menu
%-------------------------------------------------------------
% Hubert Gawry�   2014-03-16
% Instytut Zarz�dzania w Budownictwie i Transporcie (L-3)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
t='';
switch 1
    case 1
        switch nr1
            case 1
                M={'Dane';...
                    'Warianty i kryteria'};
            case 2
                M={'MWAP';...
                    'Metody matematyczne';...
                    'Metody graficzne';...
                    'Metody taksonomiczne'};
        end
end
t=cell2mat(M(nr2,:));
%-------------------------------------------------------------
