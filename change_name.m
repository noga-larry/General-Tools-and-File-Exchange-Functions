
files = dir(cd); files = files (3:end);

numTrials = cellfun(@str2double,regexp({files.name},'(?<=a.)[0-9]*','match'),'UniformOutput',false);
numTrials = max([numTrials{:}]);

old_tmplate = 'go201917a'
new_tmplate = 'go200917a'

for i = 1:numTrials
    movefile([old_tmplate sprintf('.%04d',i)],[new_tmplate sprintf('.%04d',i)]);
    
end

