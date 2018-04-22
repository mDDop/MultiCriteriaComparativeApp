%-------------------------------------------------------------
% plik podstawowy programu mwap
%-------------------------------------------------------------
% Hubert Gawryœ   2014-03-16
% Instytut Zarz¹dzania w Budownictwie i Transporcie (L-3)
% Wydzia³ In¿ynierii L¹dowej
% Politechnika Krakowska im. Tadeusza Koœciuszki
%-------------------------------------------------------------
%-------------------------------------------------------------
clear all
clc
close all
%-------------------------------------------------------------
Scr = get(0,'Screensize');
%-------------------------------------------------------------
lmenu=2;
lopcja=[1 3];
kol=['b','r','k','m','y','g','r','k'];
kol2=[0.3,0.4,0.5;
    0.5,0.6,0.4;
    0.35,0.45,0.55;
    0.4,0.5,0.6;
    0.9,0.9,0.9;
    1,1,1;
    0.3,0.5,0.5;
    0.2,0.4,0.6;
    0.3,0.4,0.5;];
%-------------------------------------------------------------
wymiarx=800;
wymiary=600;
fig=figure('Position',[(Scr(3)-wymiarx)/2 (Scr(4)-wymiary)/2 wymiarx wymiary],'Name','MWAP_2014','Resize','off');
%-------------------------------------------------------------
Scr = get(fig,'Position');
set(fig,'Name','Metody Wielokryterialnej Analizy Porównawczej', ...
    'NumberTitle','off','Color',kol2(1,:));
%-------------------------------------------------------------
clear_fig(fig,0)
s=zeros(lmenu,max(lopcja+1));
for i=1:lmenu
    s(i,1)=uimenu(fig,'Label',opcje_menu(i,1),...
        'Position',i,'ForegroundColor','b');
    for j=0:lopcja(i)
        if j>0
            s(i,j+1) = uimenu(s(i,1),'Label',opcje_menu(i,j+1), ...
                'Position',j,'ForegroundColor',kol2(1,:));
        end
    end
end
%-------------------------------------------------------------
%set([s(6,4) s(6,5) s(6,6) s(6,8) s(6,9)],'Separator','on');
set([s(1,2)],'CallBack','clear_fig(fig,lmenu); l_dane;');
set([s(2,2)],'CallBack','clear_fig(fig,lmenu);mgr1; l_metody;');
set([s(2,3)],'CallBack','clear_fig(fig,lmenu);mgr2; l_graficzne;');
set([s(2,4)],'CallBack','clear_fig(fig,lmenu);mgr3; l_taksonomiczne;');
%set([s(3,3) s(6,8)],'Enable','off');
%set([s(5,3)],'Enable','off');
%-------------------------------------------------------------
nr_alert=1;
Xij=0;
Vij=1;
SD=1;
w411=1;
w511=1;
m=1;
n=1;
wyznacznikZij=1;
wyznacznikJ1=1;
wyznacznikF1=1;
WWW={'W1','W2','W3','W4','W5','W6','W7','W8','W9','W10','W11','W12','W13','W14','W15','W16','W17','W18','W19','W20','W21','W22','W23','W24','W25','W26','W27','W28','W29','W30','W31','W32','W33','W34','W35','W36','W37','W38','W39','W40','W41','W42','W43','W44','W45','W46','W47','W48','W49','W50','W51','W52','W53','W54','W55','W56','W57','W58','W59','W60','W61','W62','W63','W64','W65','W66','W67','W68','W69','W70','W71','W72','W73','W74','W75','W76','W77','W78','W79','W80','W81','W82','W83','W84','W85','W86','W87','W88','W89','W90','W91','W92','W93','W94','W95','W96','W97','W98','W99','W100'};
KKK={'K1','K2','K3','K4','K5','K6','K7','K8','K9','K10','K11','K12','K13','K14','K15','K16','K17','K18','K19','K20','K21','K22','K23','K24','K25','K26','K27','K28','K29','K30','K31','K32','K33','K34','K35','K36','K37','K38','K39','K40','K41','K42','K43','K44','K45','K46','K47','K48','K49','K50','K51','K52','K53','K54','K55','K56','K57','K58','K59','K60','K61','K62','K63','K64','K65','K66','K67','K68','K69','K70','K71','K72','K73','K74','K75','K76','K77','K78','K79','K80','K81','K82','K83','K84','K85','K86','K87','K88','K89','K90','K91','K92','K93','K94','K95','K96','K97','K98','K99','K100'};
%-------------------------------------------------------------
All_alert;