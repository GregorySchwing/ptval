function [samples] = harmonicoscillator(A0)
%UNTITLED Summary of this function goes delta
%   In order to get the tails we need to 
%   incorporate the thermodynamic betas
%   into the harmonic oscillators themselves.
%   We are using it as the A0 which is
%   the the equilibrium position, x0.
%
%
%   Since we generate x values
%   by sampling the harmonic oscillator
%   using t as the independent variable,
%   this is a simple harmonic oscillator.
%
%   These x values are returned and used
%   as the xi values for the second harmonic
%   oscillator for generating probabilities.
%  
%   In order to get the desired curves
%   we plot the x values this method
%   returns.  This seems wrong.


% Amplitude
A = 2
% period - time for a complete revolution
T = 2
% angular frequency, rad / sec
w = 2*pi/T
% frequency
f = 1 / T

% velocity
% v(t) = dx(t)/dt = -ω A sin(ωt + φ)
%  φ - phase constant 
% ωt + φ - phase
% starting position determines phase constant
% - negative max disp - pi
% - positive max disp - 0
%psi = 0
% - equilibration - pi/2
psi = pi / 2
t = 0:0.001:2
x = A0 + A * cos(w*t + psi)
samples = x
%v = -w * A * sin(w*t + psi)

% hookes law, F = -kx, with k = mω2.
%k = m*w^2
%F = -k*x

% total mechanical energy
%energies = 0.5*(w^2)*(A^2)*(sin(w*t+psi).^2 + cos(w*t+psi).^2)

% potential energy
%energies = 0.5*(w^2)*(A^2)*(cos(w*t+psi).^2)

%probability
%probs = 1 ./ (pi .* sqrt((A^2) - (x.^2)))
%scatter(energies, probs)
%N,edges = histcounts(energies)
%histogram(energies)
end
