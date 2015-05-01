clear all; close all; clc
%% Global Variables
global krai z K
%% Inline Functions
% Calculate norm of each row vector in matrix V
normrows = inline('sqrt(sum(V.^2,2))');
%% Loading Data
Gl=load ('iris.txt');
[~, Gl_comp]=princomp(Gl);
z = Gl_comp(1:50,1:3);
%% Part I
% Finding Mean
mu = mean(z);
% Finding First Hook - Farthest point from mean
z1 = bsxfun(@minus, z, mu);
[~,I1] = max(normrows(z1));
% Finding Second Hook - Farthest point from the line connectin mu & I1
z2 = z1;                            % Pre-allocating for faster performance
z2 = (bsxfun(@cross, z1', z1(I1,:)'))';
[~,I2] = max(normrows(z2));
%% Extreme Points
H1 = z(I1,:); H2 = z(I2,:);
krai(end+1,:) = H1; krai(end+1,:) = H2;
recumother(H1,H2);
%% Triangulation
for i =1:size(krai,1)-1
    for j=i+1:size(krai,1)
        p = recu(krai,krai(i,:),krai(j,:),false);
        q = recu(krai, krai(i,:),p,false);
        K(end+1,1) = H2I(krai(i,:));
        K(end,2) = H2I(p);
        K(end,3) = H2I(q);
    end
end
%% Part 2 
figure(2), hold all, grid on, plot3(z(:,1), z(:,2), z(:,3), 'k*');
plot3(krai(:,1),krai(:,2),krai(:,3),'bo', 'LineWidth', 2);
[~,ia,~] = unique(sort(K,2), 'rows');
K= K(ia,:);
figure(2)
for i = 1:size(K,1)
    fill3(z(K(i,:),1),z(K(i,:),2),z(K(i,:),3), 1);
end
alpha(.5)
axis('equal');
%% Test if Point is Inside Polyhedron or Not
% xt = -2.8;
% yt = .7;
% zt = .2;
xt = 5;
yt = 10;
zt = 100;
plot3(xt,yt,zt,'r*');
inpoly(K,xt,yt,zt)
