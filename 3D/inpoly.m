function c = inpoly(K, xt, yt, zt)
global z;
c = false;
for i = 1:size(K,1)
    px = z(K(i,:),1);
    py = z(K(i,:),2);
    pz = z(K(i,:),3);
    if min(pz) > zt && pnpoly(px, py, xt, yt)
        c = ~c;
    end
end
end