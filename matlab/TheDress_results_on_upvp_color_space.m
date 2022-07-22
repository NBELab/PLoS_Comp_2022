

savepath = 'TheDress-black-or-gold-blue-or-white'
Title = '#TheDress';


uWhite = uvWhite(1);
vWhite = uvWhite(2);




 PC_rgb = zeros(6,1,3);
 %blue alpha =1  (white/gray)
 PC_rgb(1,1,1) = 129/255;
 PC_rgb(1,1,2) = 136/255;
 PC_rgb(1,1,3) = 154/255;
 %blue alpha =0.5  (blue)
 PC_rgb(2,1,1) = 114/255;
 PC_rgb(2,1,2) = 122/255;
 PC_rgb(2,1,3) = 155/255;
 %blue original  (blue)
 PC_rgb(3,1,1) = 129/255;
 PC_rgb(3,1,2) = 142/255;
 PC_rgb(3,1,3) = 176/255;
 
 %black alpha =1  (glod)
 PC_rgb(4,1,1) = 117/255;
 PC_rgb(4,1,2) = 85/255;
 PC_rgb(4,1,3) = 6/255;
 %black alpha =0.5  (black)
 PC_rgb(5,1,1) = 73/255;
 PC_rgb(5,1,2) = 61/255;
 PC_rgb(5,1,3) = 45/255;
 %black original  (black)
 PC_rgb(6,1,1) = 88/255;
 PC_rgb(6,1,2) = 75/255;
 PC_rgb(6,1,3) = 52/255;
 
 %text_label = {'1','0.5','Orig','1','0.5','Orig'};
 text_label = {'1','','*','1','','*'};
% 
 %PC = rgb2xyz(PC);
 

 
% 2 deg observer (CIE 1931)

ut = zeros(size(PC,1),1);
vt = zeros(size(PC,1),1);
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
    text(ut(c),vt(c),text_label(c));
end
axis([0.16 0.3 0.4 0.6]);
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
%saveas(gcf,cat(2,savepath,'.tif'));


