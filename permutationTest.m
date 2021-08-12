function p_val = permutationTest(samples,labels,repeats,statistic_func)
% This functon performs a two tail permulation test between to groups. 
% The statistic is the difference between some a statistic function of the
% two groups detemined by the inputs. 
% Inputs:
% samples   - the samples.
% labels - a vector of 1s and 0s representating the group from which the
%          sample was taken. 
% repeats - the number of resamplings. 
% statistic_fun - the statistic function (function handle). 
% Outputs:
% p_val  - The p-value of the test.



true_diff = statistic_func(samples(labels==0)) - statistic_func(samples(labels==1));

permuted_diffs = nan(1,repeats);
for i=1:repeats
    perm_data = samples(randperm(length(samples)));
    permuted_diffs(i) = ...
        statistic_func(perm_data(labels==0))-statistic_func(perm_data(labels==1));
end

p_val = mean(abs(permuted_diffs) >= abs (true_diff)); 


