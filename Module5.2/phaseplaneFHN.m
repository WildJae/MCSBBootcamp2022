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

% model definition
%f = @(v,w) v - 1/3*v.^3 -w;
%f_extra = @(v,w,t) v - 1/3*v.^3 -w + I(t);
%g = @(v,w) eps*(v + a -b*w);

vArray = zeros(1:10);
wArray = zeros(1:10);

%modulus by 10
for k = 1:100
    
    wrap1 = mod(k,10); 
      
    f_extra = @(v,w,t) v(k) - 1/3*v(k).^3 -w(k) + I(t) + 0.9*(v(wrap1) -2*v*(k) + v(k+1));
    g = @(v,w) eps*(v(k) + a -b*w(k));

  
    vArray(k) = f_extra;
    wArray(k) = g;

end


%[T X] = ode45(....RAND(20,1))





