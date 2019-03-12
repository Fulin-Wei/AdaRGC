function [detected_trial] = UnsupervisedAdaptationMDM(data,AdaptationParameter)

% A function to predict the label according to Unsupervised adaptation of
% MDM proposed in the paper
%
%Input:
%data: A structure with following fields (In accordance to Barachant toolobox)
%     data.data: The covariance matrices of each EEG trial as [Nc*NC*Nt]
%                Nc: Number of Channels Nt: Number of trials                           
%   data.labels: True labels corresponding to each trial | shape: [1*Nt]
%   data.idxTraining: Indexes corrsponding to training samples in data
%   data.idxTest: Indexes corresponding to testing samples in data
%Output:
%detected_trial: The labels predicted corresponding to evaluation trials
%
%by Satyam Kumar
%   satyamjuve@gmail.com
%

disp('Unsupervised Adaptation MDM')

%% Init
unique_labels=unique(data.labels);
Nclass=size(unique_labels, 2);
NTests = size(data.idxTest, 2);
distances = zeros(NTests, Nclass);	% Preallocation
detected_trial = zeros(1, NTests);	% Preallocation

[C, Ntrials] = ClassPrototypeEstimation(data);	% Estimation of class prototypes

%% Testing
disp('Testing...')
for i=1:NTests

	trial=data.data(:,:,data.idxTest(i));
	[distances(i,:), detected_trial(i)] = Classification(C,trial);
	
	% Updatation of class prototypes as described in the paper
	if(nargin<2)
		[C, Ntrials] = UpdateClass(C, Ntrials, detected_trial(i), trial);
	else
		[C, Ntrials] = UpdateClass(C, Ntrials, detected_trial(i), trial, AdaptationParameter);
	end

end

%% Displays
for i=1:Nclass
	disp(strcat('Class ',int2str(i)));
	disp(C{i});
end

disp('detected_trial');
disp(detected_trial);
disp('distances');
disp(distances);
end