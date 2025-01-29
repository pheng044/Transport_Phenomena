% Patrick Heng
% 28 Jan. 2025
% Script to solve the Poisson Equation over a rectangular domain,
%   Lu = f,
% where L is the Laplacian, and f is specified.
% Solved using a 2nd order finite difference technique
% with central differencing over a uniform grid.

% -------------------------------------------------------------

close all; clear all; clc;

% --- INPUTS ---

% Number of points to discretize with
% x -> N points, y -> M points
N = 20;
M = 20;

% Limits of domain
x_lim = [0,1];
y_lim = [0,1];

% Right hand side (RHS) function, specified assuming X and Y
% are meshgrid variables, 
% Ex: RHS = @(X,Y) sin(2*pi*X).*sin(2*pi*Y)*(-8*pi^2);

RHS = @(X,Y) 0*X;

% Boundary conditions
% Specify: top and bottom as functions of x,
%          left and right as functions of y

top = @(x) sin(2*pi*x);
bottom = @(x) sin(2*pi*x); 
left = @(y) 2*sin(2*pi*y);
right = @(y) 2*sin(2*pi*y); 




% --- CODE ---

tic

% Generate mesh
x = linspace(x_lim(1),x_lim(2),N);
y = linspace(y_lim(1),y_lim(2),M);
[X,Y] = meshgrid(x,y);
Y = flip(Y,1);

% Number of nodes
k = N*M;

% Generate f
F = RHS(X,Y);

f = zeros(N*M,1);
for i = 1:M
    f((i-1)*N+1:i*N) = F(M-i+1,:);
end

% Boundary conditions
f(1:N) = bottom(x); 
f((M-1)*N+1:(M-1)*N+N) = top(x);
f(1:N:N*M) = left(y); 
f(N:N:N*M) = right(y);

% Get dx and dy values
dx = x(2)-x(1);
dy = y(2)-y(1);

% Numbers to go on the diagonal of the FD matrix
diags = [1/dy^2,1/dx^2,-2/dx^2-2/dy^2,1/dx^2,1/dy^2];
diags = repmat(diags,k,1);

% Generate FD matrix, A
A = spdiags(diags,[-N,-1,0,1,N],k,k);

I = speye(k);

% Fix rows of A matrix to satisfy BC's
A(1:N,:) = I(1:N,:);                                % Bottom
A((M-1)*N:(M-1)*N+N,:) = I((M-1)*N:(M-1)*N+N,:);    % Top
A(1:N:N*M,:) = I(1:N:N*M,:);                        % Left
A(N:N:N*M,:) = I(N:N:N*M,:);                        % Right


% Linear solve for solution, u
u = A\f;

% Reshape u back to mesh dimensions
uu = reshape(u,N,M);
uu = flip(uu',1);

toc

% Surface plot of results
figure
surf(X,Y,uu,FaceAlpha=0.85,LineStyle='none')
xlabel('$x$',Interpreter='latex'); ylabel('$y$',Interpreter='latex');

figure
spy(A);
