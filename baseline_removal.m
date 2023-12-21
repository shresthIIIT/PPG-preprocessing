
%Dr. Shresth Gupta

function [ ppg_wf,ppg_type ] = baseline_removal( ppg_wf )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
        base=(linspace(ppg_wf(1),ppg_wf(end),length(ppg_wf)));
        ppg_wf2=(ppg_wf-base)';
        negcheck=find(ppg_wf2<0);
        if(isempty(negcheck))
            if((abs(ppg_wf(1)-ppg_wf(end))<0.1))
                ppg_type=1;
            else
                ppg_type=2;
            end
        else
            [~,lmin]=min(ppg_wf(negcheck));
            lmin=negcheck(1)+lmin-1;
            
            poi=[1 lmin length(ppg_wf)];
            offset=0.01;
            ppg_poi=[ppg_wf(1) ppg_wf(lmin)-offset ppg_wf(end)];
            base = (interp1(poi,ppg_poi,1:length(ppg_wf),'spline'))';
            ppg_wf2=(ppg_wf-base');
            [~,lp]=findpeaks(ppg_wf2);
            lp=find(lp>lmin);
            if(isempty(lp))
                ppg_type=3;
            else
                ppg_type=0;
            end
        end
        
        ppg_wf=abs(ppg_wf2);
        

end

