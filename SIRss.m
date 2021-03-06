function ss = SIRss(theta,ydata)

load debugdata.mat

time = [1:length(ydata)];

I0 = mean(ydata(1,1));

% 3 last parameters are the initial states
y0 = [theta(4) I0 1-theta(4)-I0]';

ymodel = SIRfun(time,theta,y0);
ss = sum(log((abs(ymodel(2:end,2) - ydata(2:end))+1e-10)*2));
%ss = sum(abs((ymodel(2:end,2) - ydata(2:end))));
if (ss < -100000)
    ss
end
ssmat = [ssmat ss];
thetamat = [thetamat theta'];

hold on
plot(time,[ymodel(:,2) ydata])
ylim([0 max(ydata)])

save debugdata.mat ssmat thetamat

end

