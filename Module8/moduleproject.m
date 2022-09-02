%part a

lambda = 1;
theta = 1000;
alpha = 2;

timeArray = [20, 40, 60, 80, 100, 120, 140, 164];

dfdt =@(N) lambda*N * (1-(N/theta)^alpha);

[T, F] = ode45( @(t,x)dfdt(x), timeArray, 0.068);

bacteriaArray = [0.070, 0.121, 0.235, 0.279, 0.373, 0.504, 0.68, 0.802];

SSE = 0;
for i = 1:8
    hold =  (F(i) - bacteriaArray(i))^2;
    SSE = SSE + hold;

end

%result = function1(1, 1000, 2);
%disp(result);



min = fminsearch(@function1,[1, 1, 1]);
disp(min);

lambda = min(2);
theta = min(1);
alpha = min(3);

dfdt =@(N) lambda*N * (1-(N/theta)^alpha);

[T, K] = ode45( @(t,x)dfdt(x), timeArray, 0.068);

hold on;
plot(timeArray, bacteriaArray);
plot(T,K, "r");


function [SSE] = function1(param)

timeArray = [20, 40, 60, 80, 100, 120, 140, 164];
theta = param(1);
lambda = param(2);
alpha = param(3);

dfdt =@(N) lambda*N * (1-(N/theta)^alpha);

[T, F] = ode45( @(t,x)dfdt(x), timeArray, 0.068);

bacteriaArray = [0.070, 0.121, 0.235, 0.279, 0.373, 0.504, 0.68, 0.802];

SSE = 0;
for i = 1:8
    hold =  (F(i) - bacteriaArray(i))^2;
    SSE = SSE + hold;
end

end
