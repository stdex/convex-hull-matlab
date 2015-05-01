clc;
clear all;
close all;

X=load ('iris.txt');
[b, Gl_comp]=princomp(X)
z= complex(Gl_comp(1:50,1), Gl_comp(1:50,2))

[V,I]=max(abs(z-mean(z)));
p=recu(z,z(I))
krai=[p]
for i = 1 : 8
    p=recu(z,p)
    krai=[krai p]
end


figure(2)
hold all
plot(z,'g*')
plot([krai, krai(1)],'b-')
axis equal

max_p=z(I);

polygon(:,1) = real(krai);
polygon(:,2) = imag(krai);

xt = -3;
yt = 0;

plot(xt,yt,'r*');
inpoly(polygon,xt,yt)


