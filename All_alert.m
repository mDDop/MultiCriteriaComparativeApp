%-------------------------------------------------------------
% plik wykonuj�cy alarmy/ostrze�enia/b��dy
%-------------------------------------------------------------
% Hubert Gawry�   2014-03-16
% Instytut Zarz�dzania w Budownictwie i Transporcie (L-3)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% nr_alert   - numer alertu
% etc.
%%-------------------------------------------------------------
if nr_alert==1
    if w411==1 & w511==1
        set([s(2,2) s(2,3) s(2,4)],'Enable','off');
    elseif w411>1
        set([s(2,2) s(2,3) s(2,4)],'Enable','on');
    end
elseif nr_alert==2
    komunikat_SD=0
    for i=1:w511
        if (SD(i)~=1)&(SD(i)~=2)
            SD(i)=1
            komunikat_SD=komunikat_SD+1
        end
    end
    if komunikat_SD>0
        uiwait(helpdlg('Wprowadzono b��dn� dan�. Wprowad� "1" dla stymulanty lub "2" dla destymulanty','Uwaga'));
    end
end
