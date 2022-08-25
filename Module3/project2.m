%a at population size 0 and when it equals K?
%b graph is on ipad

nMax = 200; % max number of days to simulate

x = zeros(1,nMax);
x(1) = 0.2;

for n = 1:nMax
        x(n+1) = x(n) +0.1*(1-(x(n)/0.6))*x(n);

end

%disp(x)

%c
%figure(1)
%time = [1:nMax+1];
%plot(time,x)

%d
x = zeros(1,nMax);
x(1) = 0.2;

for n = 1:nMax
        x(n+1) = x(n) +2.1*(1-(x(n)/0.6))*x(n);

end
%figure(2)
%plot(time,x)

%e
x = zeros(1,nMax);
x(1) = 0.1;

for n = 1:nMax
        x(n+1) = x(n) +2.5*(1-(x(n)/0.6))*x(n);

end
%figure(3)
%plot(time,x)

%g
x = zeros(1,nMax);
r_val = zeros(1,nMax);
x(1) = 0.1;

for k=0.1:0.05:3.0
    x = zeros(1,nMax);
    r_val = zeros(1,nMax);
    x(1) = 0.1;
    for n = 1:nMax
        x(n+1) = x(n) +k*(1-(x(n)/0.6))*x(n);
        r_val(n+1) = k;

    end
    %r_val = r;
    x = x(nMax/2:nMax);
    r_val = r_val(nMax/2:nMax);
    scatter(r_val,x)
    hold on
end
%plot(r_val, x);