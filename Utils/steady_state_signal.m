function S = steady_state_signal(M0,T1,T2,TR,TE,alpha,TYPE,TI,T2p)
%
%S = steady_state_signal(M0,T1,T2,TR,alpha,TYPE)
%
%Compute MR steady state signal amplitude
%
%Input
%       T1,T2 : relaxation times [ms]
%       M0    : equilib. longitudinal magnetization
%       TR    : repetition time [ms]
%       FA    : flip angle [degree]
%       TYPE  : string, describing the signal type, one of
%               'Ernst' : Ernst Equation
%               'FID'   : The FID or S+ signal in unspoiled steady state seqs.
%               'ECHO'  : The ECHO or S- signal in unspoiled steady state seqs.
%               'SSFP'  : fully ballanced steady state free precession
%               'IRSSFP'  : inversion recovery fully ballanced steady state free precession
%               'IRSPGR'  : inversion recovery spoiled gradient echoe
%               'T2p-IRSSFP'  : T2 preparation inversion recovery fully
%               ballanced steady state free precession for Dark Blood late
%               enhancement



     c  = cos(alpha);
 s  = sin(alpha);
 t  = tan(alpha/2);
 E1 = exp(-TR./T1);
 E2 = exp(-TR./T2);
 EE=exp(-TE./T2);
 r = sqrt( (1-E2.^2)./( (1-E1.*c).^2 - E2.^2.*(E1-c).^2 ) );   %sina: page 591 (14.17) handbook of pulse seq

 
 
 switch lower(TYPE)
     case 'ernst'
         S = M0.*s.*(1-E1)./(1-E1.*c);
     case 'fid'
        S = M0.*t.*(1-r.*(E1-c));             
     case 'echo'
        S = M0.*t.*(1-r.*(1-E1.*c));
     case 'ssfpalt'
        S = M0.*s.*(1-E1).*EE./(1-(E1-E2).*c-E1.*E2); %sqrt(E2) <=> echo centered at TR/2 !  sina: bSSFP with sign alternation (more signal > used in practice)
     case 'ssfpnoalt'
        S = M0.*s.*(1-E1).*EE./(1-(E1+E2).*c+E1.*E2); %sqrt(E2) <=> echo centered at TR/2 !  sina: bSSFP without sign alternation (page 593 handbook of pulse seq)
     
     case 'irssfp'
         % Signal equation for IRSSFP
         S=M0.* ( 1 - 2.*exp(-TI./T1)).*s.*(1-E1).*EE./(1-(E1-E2).*c - E1.*E2);
     case 'irspgr' 
         %Signal equation for IRSPGR
          S=M0.* ( 1 - 2.*exp(-TI./T1)).*s.*(1-E1).*EE./(1-E1.*c);
     case 't2p-irssfp'
         %Signal equation for T2 preparation IRSSFP
          S=(exp(-T2p/T2)).*M0.* ( 1 - 2.*exp(-TI./T1)).*s.*(1-E1).*EE./(1-(E1-E2).*c - E1.*E2);
     
         
    
         
  
     otherwise
         error('unkown signal type')

end