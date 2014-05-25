function ss = SIRss(theta,ydata)

time = [1:length(ydata)];

I0 = ydata(1,1);

% 3 last parameters are the initial states
y0 = [theta(4) I0 1-theta(4)-I0]';

ymodel = SIRfun(time,theta,y0);
ss = sum((ymodel(:,1) - ydata).^2);

figure
plot(time,ymodel);

end
