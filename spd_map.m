function [y,params] = spd_map(params)
%SPD_MAP optimizes 2-D signals of blood flow map using Maximum A Posterior.
%Steepest descent optimiation is used.
%
% Optimization of convolution model with dictionary induced prior using
% steepest descent
%
% INPUT:
%       PARAMS - structure of parameters (for detailed field definition,
%       see spd.m)
%
% OUTPUT:
%       Y      - Estimated perfusion map [H x W]
%       PARAMS - structure of parameters with fields f,J,prior,nz updated
%
%
% SPD_MAP calls two functions: SPD_PRIOR and SPD_SD for prior estimation
% and steepest descent optimiztion
%
%
%   Ruogu Fang 4/10/2014
%   Advanced Multimedia Processing (AMP) Lab
%   Department of Electrical and Computer Engineering
%   Cornell University


params.f = params.x; % copy the noisy initial image to f

% Iteration of two steps
for i = 1 : params.round
    params = spd_prior(params);
    params = spd_sd(params);
end

% Output of restored perfusion map
params = spd_prior(params);
y = params.prior;

end