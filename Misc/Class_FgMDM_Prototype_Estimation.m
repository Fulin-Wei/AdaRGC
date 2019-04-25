function [W, Cg, C, Ntrials] = Class_FgMDM_Prototype_Estimation(training_set, training_labels)
%CLASSPROTOTYPEESTIMATION Summary of this function goes here
%   Detailed explanation goes here
unique_labels=unique(training_labels);
Nclass=size(unique_labels, 2);
Ntrials = zeros(1, Nclass);

%% Estimation of W and Cg: Covariance toolbox dependency
[W, Cg] = fgda(training_set, training_labels, 'riemann', {}, 'shcov', {});
%% Geodesic filtering of the training set from the filters W
training_set = geodesic_filter(training_set, Cg, W(:,1:Nclass-1));
%% Estimation of class prototypes
C = cell(Nclass,1);
for i=1:Nclass
	Ntrials(i) = size(training_set(:, :, training_labels==unique_labels(i)),3);
    C{i} = riemann_mean(training_set(:, :, training_labels==unique_labels(i)));
end
end
