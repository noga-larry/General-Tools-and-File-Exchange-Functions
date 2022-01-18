function alignmentTimes = alignmentTimesFactory(data,ind,alignTo)

alignmentTimes = nan(1,length(ind));


switch alignTo
    
    case 'cue'
        for t=1:length(ind)
            alignmentTimes(t) = data.trials(ind(t)).cue_onset;
        end
        
    case 'targetMovementOnset'
        for t=1:length(ind)
            alignmentTimes(t) = data.trials(ind(t)).movement_onset;
        end
        
    case 'reward'
        for t=1:length(ind)
            if ~ isnan(data.trials(ind(t)).rwd_time_in_extended)
                alignmentTimes(t) = data.trials(ind(t)).rwd_time_in_extended;
            else
                alignmentTimes(t) = nan;
            end
        end 
        
    case  'pursuitLatencyTemplateFit'
        
        % plave nans in filed trials
        bool_fail = [data.trials(ind).fail];        
        [~, latency_tmp, ~, init_time ,~]  =....
            fitTimingDirectionAndGain(data,ind(~bool_fail));
        latency = nan(1,length(ind));
        latency(~bool_fail) = latency_tmp;
        for t=1:length(ind)
             alignmentTimes(t) = data.trials(ind(t)).movement_onset +...
                 latency(t);
        end
        
    case  'pursuitLatencyRMS'
        
        % plave nans in filed trials
        bool_fail = [data.trials(ind).fail];
        [latency_tmp]  =....
            fitPursuitLatencyByRMS(data,ind(~bool_fail));
        latency = nan(1,length(ind));
        latency(~bool_fail) = latency_tmp;
        for t=1:length(ind)
            alignmentTimes(t) = data.trials(ind(t)).movement_onset +...
                latency(t);
        end
    otherwise
        disp('Alignmrnt not found')
end
end