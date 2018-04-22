%-------------------------------------------------------------
% plik czyszcz�cy pole programu
%-------------------------------------------------------------
% Hubert Gawry�   2014-03-16
% Instytut Zarz�dzania w Budownictwie i Transporcie (L-3)
% Wydzia� In�ynierii L�dowej
% Politechnika Krakowska im. Tadeusza Ko�ciuszki
%-------------------------------------------------------------
%-------------------------------------------------------------
function clear_fig(fig,lmenu)
if lmenu>0
    t=get(fig,'Children');
    delete(t(end-lmenu:-1:1));
end
Pos = get(fig,'Position');
color2=get(fig,'Color');
uicontrol(fig,'Style','text','Units','normalized', ...
    'Position',[13/20 0.5/40 1/2 1/40],'String', ...
    'MWAP_2014',...
    'FontSize',10,'FontWeight','bold', ...
    'ForeGroundColor','w','BackGroundColor',color2, ...
    'HorizontalAlignment','center');
set(fig,'Toolbar','figure');
end
%-------------------------------------------------------------
