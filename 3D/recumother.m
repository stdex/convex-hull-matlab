function recumother(H1,H2)
global krai z K
p = recu(z, H1, H2,1);
if ismember(p,krai,'rows')
    return
end
krai(end+1,:) = p;      % New extreme point found
recumother(p,H1);
recumother(p,H2);
end