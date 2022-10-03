function Beta_chapeau = MCO(x,y)

A = [x.*x x.*y y.*y x y ones(length(x),1)];

b = [zeros(length(A),1); 1];
A = [A; [1 0 1 0 0 0]];

Beta_chapeau = A\b;
end