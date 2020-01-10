function [J] = CalculJacobienne(alpha, d, theta, r)
%% Question 6 - Calcul de Matrice Jacobienne
% Autheur : Gabriel H. Riqueti
% Arguments :
% alpha         - 
% d             - 
% theta         - 
% r             -
m = 6;
n = length(alpha);
J = zeros(m,n);
Z = [0;0;1];
g_init_i = eye(4,4);
g_i_end = g_init_i;

for i=1:n
    g_init_i = g_init_i*CalculTransformation(alpha(i),d(i),theta(i),r(i));
    g_i_end = CalculTransformation(alpha(n-i+1),d(n-i+1),theta(n-i+1),r(n-i+1))*g_i_end;
    p = g_i_end(1:3,4);
    R = g_init_i(1:3,1:3);
    J(i,1:3) = R*cross(Z,p);
    J(i,4:6) = R*Z
end

end
