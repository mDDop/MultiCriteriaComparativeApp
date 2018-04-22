%-------------------------------------------------------------
% plik kre�l�cy wyniki
%-------------------------------------------------------------
% Hubert Gawry�   2014-03-16
% Instytut Zarz�dzania w Budownictwie i Transporcie (L-3)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
% Zij        - macierze ocen po kodowaniu
%-------------------------------------------------------------
Scr2 = get(0,'Screensize');
%-------------------------------------------------------------
wymiarx2=1300;
wymiary2=700;
fig2=figure('Position',[(Scr2(3)-wymiarx2)/2 (Scr2(4)-wymiary2)/2 wymiarx2 wymiary2],...
    'Name','Zestawienie wynik�w - MWAP_2014','Resize','off');
%-------------------------------------------------------------
Scr2 = get(fig2,'Position');
set(fig2,'Name','Metody Wielokryterialnej Analizy Por�wnawczej - Zestawienie wynik�w', ...
    'NumberTitle','off','Color',kol2(1,:));
%-------------------------------------------------------------
clear_fig2(fig2,0)
%-------------------------------------------------------------
ZESTKOL={'WM','WMS','WS','WSS','WA','WAS','�AW','�HW','�GW'};

XXXX=[1:1:11];
for i=1:w411
    for k=1:1
        plot(XXXX,[J1(i,:,k),Fi(i,k),J3(i,k)])
        hold on
    end
end
