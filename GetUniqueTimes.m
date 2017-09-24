function [ utimes ] = GetUniqueTimes( times )
%returns new vector of times where each time is unique

utimeindex = 1;
utimes(utimeindex) = times(1);

for i = 2: max(size(times))
    if utimes(utimeindex) ~= times(i)
        utimeindex = utimeindex+1;
        utimes(utimeindex) = times(i);
    end
end

