function I = H2I(H)
global z
[~,I] = ismember(H,z,'rows');
end