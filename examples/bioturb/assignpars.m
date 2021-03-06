function [parMap,parMapTex,rangeMin,rangeMax] = assign_pars
% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% Implicitly define the variables names, classes and sizes by
% assigning them dummy values:

parProperties = cell([0,0]);
parProperties{end+1,1} = {'Cinput','double',[1,1],0.0001,0.01,'Cinput'};
parProperties{end+1,1} = {'CoefCoef1','double',[1,1],0.00005,2,'CoefCoef1'};
parProperties{end+1,1} = {'CoefCoef2','double',[1,1],0.003,2,'CoefCoef2'};
parProperties{end+1,1} = {'width1','double',[1,1],0.1,3000,'width1'};
parProperties{end+1,1} = {'width2','double',[1,1],0.1,5000,'width2'};
parProperties{end+1,1} = {'vertpos2','double',[1,1],0,2,'vertpos2'};
parProperties{end+1,1} = {'DecDec','double',[1,1],0.0001,8,'DecDec'};
parProperties{end+1,1} = {'width1','double',[1,1],-10,10,'extracarbon'};
           
% Cinput=pars(1);         % 0.0001-0.01
% CoefCoef1=pars(2);      % 0.00005-0.05
% CoefCoef2=pars(3);      % 0.003-0.05
% width1=pars(4);         % 0.1-3000
% width2=pars(5);         % 0.1-3000
% vertpos2=pars(6);       % 0-2
% DecDec=pars(7);         % 0.0001-5
% extracarbon=pars(8);    % 0-10


% % % % % % % % % % % % % % % % % % % % % % % % % % % % % %
% start building the mapper:
buildparametermap
