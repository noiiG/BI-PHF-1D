%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The code is related to the following paper:
% Bayesian inversion with open-source codes for various one-dimensional model problems in computational mechanics
% Accepted for publication in Archives of Computational Methods in Engineering

% The authors are:
% Nima Noii, Amirreza Khodadadian, Jacinto Ulloa, Fadi Aldakheel, Thomas Wick, and Peter Wriggers

% This script is related to 1D_elasticity..

% @copyright(2022) LUH Hannover

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Material and model parameters

% [ 1] [ E       ] Young's modulus ........................[MPa]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output:

% To approximate the material property:
% [E]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


load('reference.mat')   
                         
% range of the parameters based on the prior density
inp.range=[1 20];                               

% number of iteration in MCMC
inp.nsamples=1000;     

% initial covariance                          
inp.icov=1;                                   

% initial guesss of the parameters based on the prior
inp.theta0=3;  

% std                               
inp.sigma=0.1;

% measurement/ reference observation                                
inp.measurement=measurement;        

% The starting point of the Kalman MCMC           
inp.Kalmans=100;                              

% assumed measurement error for Kalman MCMC
inp.me=1e-1;                                  

 
% The Metropolis-Hastings technique
[results] = MH(inp);
fprintf('The median of the posterior is:%d\n',median((results.MCMC)'))

% The delayed rejection technique
[results] = MH_DR(inp);
fprintf('The median of the posterior is:%d\n',median((results.MCMC)'))

% The adaptive Metropolis technique
[results] = AMH(inp);
fprintf('The median of the posterior is:%d\n',median((results.MCMC)'))

% The DRAM algorithm 
[results] = DRAM(inp);
fprintf('The median of the posterior is:%d\n',median((results.MCMC)'))

% The EnKF algorithm 
[results] = EnKF(inp);
fprintf('The median of the posterior is:%d\n',median((results.MCMC)'))
 
 
