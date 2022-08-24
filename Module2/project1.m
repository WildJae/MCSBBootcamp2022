% How much caffeine is there in the jar?

% n - number of days
% x - fraction of caffeinated 

nMax = 21; % max number of days to simulate

N = 10; % number of scoops in each jar
x = zeros(1,nMax); % fraction caffeinated
y = zeros(1,nMax);
x(1) = 0.1; % initial fraction caffeinated
y(1) = 0.1;

for n=1:nMax
    
    x(n+1) = (x(n))^2 - (y(n))^2 - 0.8;
    y(n+1) = 2*x(n) * y(n)+0.156;
    
end % finished loop through days

%figure(1); 
%plot(x,'ok');
%ylabel('fraction caffeinated')
%xlabel('Days')

%figure(2);
%plot(x,y,'ok');

%part d

xStart = -2 + (2+2).*rand(1,100)
yStart = -2 + (2+2).*rand(1,100)

figure(3);
%plot(xStart, yStart, "ok");

%part e

x = zeros(1,22); 
y = zeros(1,22);
figure(4);

for k=1:100
    x = zeros(1,22); 
    y = zeros(1,22);
    x(1) = xStart(k);
    y(1) = yStart(k);

    for n=1:21

        x(n+1) = (x(n))^2 - (y(n))^2 - 0.8;
        y(n+1) = 2*x(n) * y(n)+0.156;

    end
    if (x(22) > 2 || x(22) < -2) || (y(22) > 2 || y(22) < -2) 
        plot(xStart(k),yStart(k),"or");
    else
        plot(xStart(k),yStart(k),"ob");
    end
    hold on
end
