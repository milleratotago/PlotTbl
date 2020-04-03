classdef AxisControl
    % Customize functions for axis control
    %   Detailed explanation goes here
    
    properties
    end
    
    methods (Static)
        
        function [] = XCongruency(~,~)
            xlim([0.5 2.5]);
            xticks([1 2]);
            xticklabels({'Congruent' 'Incongruent'});
        end
        
        function [] = YBounds(x,y,Panel11,Panel12,Panel21,Panel22)
            if (x==1) && (y==1)
                ylim(Panel11);
            elseif (x==1) && (y==2)
                ylim(Panel12);
            elseif (x==2) && (y==1)
                ylim(Panel21);
            elseif (x==2) && (y==2)
                ylim(Panel22);
            end
        end
        
    end
    
end

