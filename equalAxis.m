function equalAxis()

y = ylim; x = xlim;
limits = [min([y(1),x(1)]), max([y(2),x(2)])];
ylim(limits); xlim(limits);
axis square

