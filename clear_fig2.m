%-------------------------------------------------------------
% plik czyszcz¹cy pole programu
%-------------------------------------------------------------
% Hubert Gawryœ   2014-03-16
% Instytut Zarz¹dzania w Budownictwie i Transporcie (L-3)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
%-------------------------------------------------------------
function clear_fig2(fig,lmenu)
if lmenu>0
    t=get(fig,'Children');
    delete(t(end-lmenu:-1:1));
end
Pos = get(fig,'Position');
color2=get(fig,'Color');
set(fig,'Toolbar','figure');
end
%-------------------------------------------------------------
