

uvBlue   = [0.1979	0.4058];
uvWhite  = [0.1887	0.4670];
uvGreen  = [0.1423	0.4724];
uvOrange = [0.2490	0.5301];
uvPurple = [0.2109	0.3745];
uvRed    = [0.2341	0.4616];
uvYellow = [0.1765	0.5489];

savepath = 'cube-alpha-i-0_5'
Title = 'Cube illusion \alpha_i=0.5';


uWhite = uvWhite(1);
vWhite = uvWhite(2);




 PC_rgb = zeros(3,1,3);
 %brown alpha =1  (brown)
 PC_rgb(1,:,1) = 115/255;
 PC_rgb(1,:,2) = 59/255;
 PC_rgb(1,:,3) = 71/255;
 %brown alpha =0.7  (brown)
 PC_rgb(2,:,1) = 118/255;
 PC_rgb(2,:,2) = 59/255;
 PC_rgb(2,:,3) = 32/255;
 %brown original  (brown)
 PC_rgb(3,:,1) = 138/255;
 PC_rgb(3,:,2) = 80/255;
 PC_rgb(3,:,3) = 21/255;
 
 %brown alpha =1  (orange)
 PC_rgb(4,:,1) = 145/255;
 PC_rgb(4,:,2) = 76/255;
 PC_rgb(4,:,3) = 5/255;
 %brown alpha =0.7  (orange)
 PC_rgb(5,:,1) = 143/255;
 PC_rgb(5,:,2) = 74/255;
 PC_rgb(5,:,3) = 9/255;
 %brown original  (brown)
 PC_rgb(6,:,1) = 138/255;
 PC_rgb(6,:,2) = 80/255;
 PC_rgb(6,:,3) = 21/255;
 
 text_label = {'1_u','0.7_u','*','1_d','0.7_d','*'};
 %text_label = {'','','*','','','*'};
% 
ut = zeros(size(PC_rgb,1),1);
vt = zeros(size(PC_rgb,1),1);
for i=1:size(PC_rgb,1)
    PC = rgb2XYZ(PC_rgb(i,:,:));
    ut(i)= 4.*PC(:,:,1)./(PC(:,:,1)+15.*PC(:,:,2)+3.*PC(:,:,3));
    vt(i) = 9.*PC(:,:,2)./(PC(:,:,1)+15.*PC(:,:,2)+3.*PC(:,:,3));
end

 Orange = [1,0.5,0];
Yellow = [1,1,0];
Green = [0,1,0];
Cyan = [0,1,1];
Blue = [0,0,1];
 Purple = [0.55,0,0.83];
Magenta = [1,0,1];
Red = [1,0,0];
%plotColors= [Yellow;Green;Cyan;Blue;Purple;Magenta;Red;Orange];
simbol = ['s','d','^','p','o','v','s','d'];

aS = tand(97-180);
bS = vWhite - aS*uWhite;
x = 0:0.0005:0.6;
Sline = aS*x+bS;
aLM = tand(353);
%aRed = (icV-vWhite)./(icU-uWhite);
bLM = vWhite - aLM*uWhite;
%bRed = vWhite -aRed.*uWhite;
LMline = aLM*x+bLM;
%RedLine = aRed*x+bRed;


figure;
hold on;
for c = 1:size(PC_rgb,1)
    color =reshape(PC_rgb(c,:,:),1,3);
    plot(ut(c),vt(c),'o','Color',color,'MarkerFaceColor',color,'MarkerSize',14);
    %text(ut(c),vt(c),text_label(c));
end
%axis([0.16 0.23 0.4 0.55]);
axis([0.16 0.4 0.4 0.6]);
plot(x,Sline,'k');
plot(x,LMline,'k');
%plot(x,RedLine,'b');
%axis([0.19 0.21 0.46 0.48]);
%axis([0.18 0.2 0.445 0.485]);
%axis([0.16 0.24 0.4 0.55]);
%axis([0.0 0.6 0 1]);
title(Title,'fontsize',12);
xlabel('u\prime','fontsize',15);
ylabel('v\prime','fontsize',15);
%legend({'-S','-S-(L-M)','-(L-M)','+S-(L-M)','+S','+S+(L-M)','+(L-M)','-S+(L-M)'},'Location','southeast');
hold off;
saveas(gcf,cat(2,savepath,'.tif'));


