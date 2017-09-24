function loc = strfind1st(s, target)
loc = strfind(s,target);
if numel(loc)>1
    loc=loc(1);
elseif numel(loc)<1
    loc=0;
end
end

