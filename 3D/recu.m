function p=recu(X,H1,H2,sort)
%% Finding Mean & 3 Hooks
mu = mean(X);
X1 = bsxfun(@minus, X, mu);
% Finding Distance of all points from the plane <mu I1 I2>
H1_n = H1 - mu;
H2_n = H2 - mu;
if sort
    temp=[H1_n;H2_n]; temp = sortrows(temp); 
    H1_n  = temp(1,:); H2_n = temp(2,:);
end
for i=1:size(X1,1)
    prov(i,1) = det([H1_n; H2_n; X1(i,:)]);
end
if sum( abs(prov) < 10^-322 )
    warning('Point too close to boundary. Risk of finite precision error')
end
zzu = X(prov < 0,:);
zzd = X(prov > 0,:);
%% Plotting - Comment out for faster simulation
figure(1), hold all, grid on, plot3(zzd(:,1), zzd(:,2), zzd(:,3), 'g*');
plot3([H1(1),H2(1)], [H1(2),H2(2)], [H1(3),H2(3)], 'bo', 'LineWidth', 2);
fill3([mu(1); [H1(1);H2(1)]; mu(1)], [mu(2); [H1(2);H2(2)]; mu(2)],...
    [mu(3); [H1(3);H2(3)]; mu(3)], 1);
plot3(zzu(:,1), zzu(:,2), zzu(:,3), 'r*');
set(gca,'CameraPosition',[1 1 1]);
% pause
%%
if size(zzu,1)==1
    p = zzu;
else
    p=recu(zzu,H1,H2,sort);
end
clf
end