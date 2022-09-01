% model parameters
eps = 0.08;
a = 0.5;
b = 0.2;

% model definition
f = @(v,w) v - 1/3*v.^3 - w;
g = @(v,w) eps*(v + a -b*w);

%% single cell
dxdt =@ (t,x) [f(x(1),x(2)); g(x(1),x(2));];

% solve!
[T,X] = ode45(dxdt,[0,100], [-0,-0.5]);

ylabel('w');
xlabel('v')

figure; hold on;
plot(T,X(:,1),'-r'); % red for RNA
plot(T,X(:,2),'-', 'color', [0.5 0 1]);

%2
% model parameters
eps = 0.08;
a = 1;
b = 0.2;

% model definition
f = @(v,w) v - 1/3*v.^3 - w;
g = @(v,w) eps*(v + a -b*w);

%% single cell
dxdt =@ (t,x) [f(x(1),x(2)); g(x(1),x(2));];

% solve!
[T,X] = ode45(dxdt,[0,100], [-1.5,-0.5]);

ylabel('w');
xlabel('v')

figure(1); hold on;
plot(T,X(:,1),'-r'); % red for RNA
plot(T,X(:,2),'-', 'color', [0.5 0 1]);



%% #3
% model parameters
eps = 0.08;
a = 1.00;
b = 0.2;

%I
I0 = 1.0;
tStart = 40;
tStop = 47;
I = @(t) I0*(t>tStart).*(t<tStop);

% model definition
f = @(v,w) v - 1/3*v.^3 -w;
f_extra = @(v,w,t) f(v,w) + I(t);
g = @(v,w) eps*(v + a -b*w);

dxdt =@ (t,x) [f_extra(x(1),x(2),t); g(x(1),x(2));];

% solve
[T,X] = ode45(dxdt,[0,100], [-1.5,-0.5]);

figure(4); hold on;
plot(T,X(:,1),'-r'); % red for RNA
plot(T,X(:,2),'-', 'color', [0.5 0 1]);

%% #4
% model parameters
eps = 0.08;
a = 1.00;
b = 0.2;

%I
I0 = 1.0;
tStart = 40;
tStop = 47;
I = @(t) I0*(t>tStart).*(t<tStop);

vArray = zeroes(1:10);
wArray = zeroes(1:10);

% model definition
f = @(v,w) v - 1/3*v.^3 -w;
g = @(v,w) eps*(v + a -b*w);

f_extra{1} = @(v,w,t) f(v,w) + I(t)+0.9*(v - 2*v+v);
f_extra{2} = @(v,w,t) f(v,w) + I(t)+0.9*(v - 2*v+v);

vArray = [f1, f2, f3, f4, f5, f6, f7, f8, f9, f10];


wArray = [g1, g2, g3, g4, g5, g6, g7, g8, g9, g10];


dxdt =@ (t,x) [vArray; wArray;];



%[T X] = ode45(....RAND(20,1))





