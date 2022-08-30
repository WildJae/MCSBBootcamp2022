%w = i, x = k, y = a, z = p 
f =@(w,x,y,z) -10*(1-y*z)*y + 10*(y*z) +100*(w*x); 
g =@(w,x,y,z) 10*(1-y*z)*y -10*(y*z) - 10*(y*z);
h =@(w,x,y,z) -10*(w*(1-w*x)) + 10*(w*x) + 10*(y*z); 
i =@(w,x,y,z) 10*(w*(1-w*x)) - 10*(w*x) -100*(w*x);


%keep equations in order with variables
dxdt = @(t,x)[h(x(1),x(2), x(3), x(4));
              i(x(1),x(2), x(3), x(4));
              f(x(1),x(2), x(3), x(4));
              g(x(1),x(2), x(3), x(4))];


[T, X] = ode45(dxdt, [0,1], [0;0;1;0] );

%plot(T,X)
figure(1)
hold on
set(gca, 'XScale', 'log')
counter = 1;
for u=0.001:0.01:100
    
f =@(w,x,y,z) -10*(1-y*z)*y + 10*(y*z) +100*(w*x); 
g =@(w,x,y,z) 10*(1-y*z)*y -10*(y*z) - 10*(y*z);
h =@(w,x,y,z) -10*(w*(u-w*x)) + 10*(w*x) + 10*(y*z); 
i =@(w,x,y,z) 10*(w*(u-w*x)) - 10*(w*x) -100*(w*x);


%keep equations in order with variables
dxdt = @(t,x)[h(x(1),x(2), x(3), x(4));
              i(x(1),x(2), x(3), x(4));
              f(x(1),x(2), x(3), x(4));
              g(x(1),x(2), x(3), x(4))];


[T, X] = ode45(dxdt, [0,1], [0;0;1;0] );

storeArray(counter) = X(end,3) + X(end,4);
counter = counter + 1;

end
plot(0.001:0.01:100,storeArray);

