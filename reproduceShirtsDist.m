% Dimension for D-Dimensional Harmonic Oscillator
D = 3

% thermodynamic betas from example
b_1 = 1.3
b_2 = 0.7

% Generate D vectors normally 
x1 = -1:0.01:1
%x2 = -1:0.01:1
%x3 = -1:0.01:1

% Generate D vectors by sampling a harmonic oscillator
x11 = harmonicoscillator(b_1)
x21 = harmonicoscillator(b_1)
x31 = harmonicoscillator(b_1)

x12 = harmonicoscillator(b_2)
x22 = harmonicoscillator(b_2)
x32 = harmonicoscillator(b_2)

% Create matrix for sum operation, will sum across rows
pos1 = horzcat(transpose(x11), transpose(x21), transpose(x31))
pos2 = horzcat(transpose(x12), transpose(x22), transpose(x32))

% To get nice transforms like Fig 2 and picture on front cover of paper
%(x - N)
% https://bit.ly/3gnFO6g
summed1 = sum((pos1), 2)
summed2 = sum((pos2), 2)

% square the sums
% energies, E = 1/2K∑ D i=1 (x i − x i,0 )^2
e1 = (summed1).^2
e2 = (summed2).^2

% probabilities , equation from sec 2.5
% of the form = const*exp((-((x).^2)./2)), which
% in quantum terms if ψ0(x)=const.e^(−αx2/2)
% and generates bell curves 
% https://bit.ly/3gfW1KU , (Chapter 5.20)

% Having a different value of beta will stretch/shrink ( stretch if a > 1, shrink if a < 1) the bell curve,
% but it wont shift it
% Horizontally if within the f(x), e.g. exp(ax)
% Vertically if outside the f(x), e.g. a*exp(x)

% https://bit.ly/3gnFO6g
% Everything about these two fx is identical except for b_1 & b_2
% Since b_1 = 1.3, which is > 1, it should stretch horizontally and
% vertically
% Since b_2 - 0.7, which is < 1, it should shrink horizontally and
% vertically

y1 = ((0.5*b_1/pi)^(D/2))*exp(-(b_1.*e1)./2)
y2 = ((0.5*b_2/pi)^(D/2))*exp(-(b_2.*e2)./2)

hold on
% y1 is indeed stretched vertically, but the negative sign 
% in the exp flips it to < 1 so it shrinks horizontally
scatter(x11, y1)
% y2 is indeed shrunk vertically, and it is shrunk less horizontally
% since it is larger than b_1.
scatter(x21, y2)
