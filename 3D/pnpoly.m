function c = pnpoly(vertx, verty, testx, testy)
c = false;
j = length(vertx);
for i = 1:length(vertx)
    if ( ((verty(i)>testy) ~= (verty(j)>testy)) &&...
            (testx < (vertx(j)-vertx(i)) * (testy-verty(i)) /...
            (verty(j)-verty(i)) + vertx(i)) )
       c = ~c;
    end
    j=i;
end
end