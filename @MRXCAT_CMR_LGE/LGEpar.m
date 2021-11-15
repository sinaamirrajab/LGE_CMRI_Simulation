function LGEpar( MRX, filename,filepath )
% This function is the parameter file for MRXCAT_CMR_LGE.
% Change parameters in section "MRXCAT settings" only
%
% Note: Not all combinations of any parameter values are possible.
%       Some parameter changes require changes in the XCAT files.
%       E.g. if you want to increase the number of segments, you need
%       more XCAT heart phases for the additional segments, 
%       i.e. additional	*.bin files.


% --------------------------------------------------------------------
%   MRXCAT settings
% --------------------------------------------------------------------
RhoMyoMuscle   = 40.0 ;                    % Proton density muscle [%] modified 18
RhoSkMuscle   = 30.0 ;                     % Proton density muscle [%] modified 18
RhoFat      = 70.0;                        % Proton density fat    [%] modified  pericardium is made from fat
RhoBlood    = 80.0;                        % Proton density blood  [%] modified
RhoLiver    = 30.0;                        % Proton density liver  [%] modified
RhoBone     = 8.0 ;                        % Proton density bone   [%]  modified
RhoLung     = 12.0;                        % Proton density bone   [%]
RhoBody     = 135.0;                       % Proton density muscle [%] modified
RhoStomach  = 40.0 ;                       % Proton density muscle [%] modified
RhoBloodA  = 80.0 ;                        % Proton density arterial blood [%] modified 18
RhoBloodV  = 80.0;                         % Proton density venous blood [%] modified 18
RhoKidney  = 45.0;                         % Proton density Kidney cortex and renal medulla [%] modified
RhoCartilage  = 10.0 ;                     % Proton density Cartilage[%] modified
RhoSpleen  = 50.0 ;                        % Proton density Spleen modified
RhoIntestine  = 40.0 ;                     % Proton density small and large intestinge modified
T1MyoMuscle    = 978.8;                    % T1 muscle             [ms]
T1SkMuscle    = 1030.8;                    % T1 muscle             [ms]
T1Fat       = 547.8;                       % T1 fat                [ms]
T1Blood     = 1411.1;                      % T1 blood              [ms]
T1Liver     = 578.6;                       % T1 liver              [ms]
T1Bone      = 281.3;                       % T1 bone               [ms]
T1Lung      = 1111.5;                      % T1 bone               [ms]
T1Body      = 583.1;                       % T1 muscle             [ms]
T1Stomach   = 727.5;                       % T1 bone               [ms]
T1BloodA     = 1611.1;                     % T1 Artetrial blood              [ms]
T1BloodV     = 1611.1;                     % T1 Venous blood              [ms]
T1Kidney     = 1467;                       % T1 Kidney cortex and renal medulla              [ms]
T1Cartilage     = 1128.1;                  % T1 Cartilage              [ms]
T1Spleen     = 1056.5;                     % T1 Spleen             [ms]
T1Intestine  = 343;                        % T1  small and large intestinge modified
T2MyoMuscle    = 64.3;                     % T2 muscle             [ms]
T2SkMuscle    = 40.3;                      % T2 muscle             [ms]
T2Fat       = 84.4;                        % T2 fat                [ms]
T2Blood     = 248.8;                       % T2 blood              [ms]
T2Liver     = 70.7;                        % T2 liver              [ms]
T2Bone      = 58.7;                        % T2 bone               [ms]
T2Lung      = 86.9;                        % T2 bone               [ms]
T2Body      = 20.5;                        % T2 muscle             [ms]
T2Stomach   = 71;                          % T2 muscle             [ms]
T2BloodA     = 248.8;                      % T2 arterial blood              [ms]
T2BloodV     = 248.8;                      % T2 venous blood              [ms]
T2Kidney     = 86.3;                       % T2 Kidney cortex and renal medulla              [ms]
T2Cartilage   =41.4;                       % T2 Cartolage              [ms]
T2Spleen     = 83.5;                       % T2 Spleen              [ms]
T2Intestine  = 58;                         % T2 small and large intestinge modified
T2sMuscle    = 28.8;                       % T2s muscle             [ms]
T2sBlood     = 273;                        % T2s blood              [ms]


TR          = 3;                           % Repetition time       [ms]
TE          = 1.5;                         % Echo time             [ms]
Flip        = 40;                          % Flip                  [deg] modified
Frames      = 1;                           % Number of heart phases (default: 24; 0=use # XCAT frames (.bin files))
Segments    = 1;                           % Number of segments
                                           % Number of segments

% modification for LGE
%%
%   T1post= 1 ./ ((1/Tpre)+gamma*Gd);     gamma=4.5 L mmol-1 s-1    Gd= 0.5 mmol L-1
%   from peter kellman paper
%   Gd is the concentration of the gadolinum in the ectra cellular space ECV. Myocardila Infarcted area has highre ECV than normal myocardium. so more gadolinium is trapped in MI area and therefore greater shortening og T1 so brighter signal in Inversion REcovery 
%%

Sequence = 'IRSSFP';  
% implemented equations for Sequence:
%               'Ernst' : Ernst Equation
%               'FID'   : The FID or S+ signal in unspoiled steady state seqs.
%               'ECHO'  : The ECHO or S- signal in unspoiled steady state seqs.
%               'SSFP'  : fully ballanced steady state free precession
%               'IRSSFP'  : inversion recovery fully ballanced steady state free precession
%               'IRSPGR'  : inversion recovery spoiled gradient echoe
%               'ssfpalt' : bSSFP with sign alternation (more signal > used in practice)
%               'T2p-IRSSFP'  : T2 preparation inversion recovery fully
%               ballanced steady state free precession for Dark Blood late
%               enhancement

% file name to save as Nifiti
Name = ['LGE_' Sequence ];
T2Prep = 20;   
TI= 678;                                 % Inversion time       [ms] T1*log(2) for nulling  678
gammaT1 = 4.1 ;                          % Gd relaxivity L mmol-1 s-1
gammaT2 = 4.6 ;                          % Gd relaxivity L mmol-1 s-1
if strcmp(Name,[date '_CINE_' Sequence])
    GdS = 0 ;
else
    GdS = 0.7 ;                          % Gd concectration mmol L-1
end
T1Scar = 1 ./ ((1/T1MyoMuscle)+gammaT1*GdS*0.001);      % Scar property
T2Scar =1 ./ ((1/T2MyoMuscle)+gammaT2*GdS*0.001) ;   
RhoScar =RhoMyoMuscle;
if strcmp(Name,[date '_CINE_' Sequence])
    GdBZ = 0 ;
else
    GdBZ = 0.3 ;                         % Gd concectration mmol L-1 0.3
end
 
T1BZ = 1 ./ ((1/T1MyoMuscle)+gammaT1*GdBZ*0.001);      % Bourder Zone
T2BZ =1 ./ ((1/T2MyoMuscle)+gammaT2*GdBZ*0.001) ;   
RhoBZ =RhoMyoMuscle;

BoundingBox = [0.15,0.75;0.15,0.75;0.5,0.8];        % BoundingBox in rel. units [0.2,0.7;0.2,0.7;0.2,0.5];
RotationXYZ = [115.0;35.0;240.0];                   % Rotations about x,y,z [deg]  (default: 115/35/240)
                                                    % x=(RL) y=(AP) z=(FH)

LowPassFilt = 1;                                    % low-pass filter images
FilterStr   = [1.4,1.4,6];                          %[FOV,res] [resx , resy, resz]                       % low-pass filter strength (default: 1.2)

SNR         = 35 ;                                  % signal-to-noise ratio 20 6
Coils       = 2;                                    % number coils (Biot-Savart)
CoilDist    = 450;                                  % body radius  450         [mm]    = distance of coil centres from origin
CoilsPerRow = 8;                                    % number of coils on 1 "ring" or row of coil array (default: 8)

Trajectory  = 'Cartesian';                          % k-space trajectory (Cartesian, Radial, GoldenAngle)
Undersample = 1;                                    % undersampling factor (only for Radial/GoldenAngle right now)

% --------------------------------------------------------------------
%   Display title
% --------------------------------------------------------------------
fprintf ( '------------------------------------------\n' );
fprintf ( '        MRXCAT-CMR-CINE (VER %3.1f)      \n' , MRX.Version );
fprintf ( '------------------------------------------\n' );

pathname = filepath;

% % --------------------------------------------------------------------
% %   Open window, select file
% % --------------------------------------------------------------------
% if ~exist('filename','var') || ~exist(filename,'file')
%     [filename,pathname] = uigetfile({'*.bin;*.par','XCAT2 files (*.par,*.bin)'});
% else
%     pathname = pwd;
%     if ispc, pathname = [pathname,'\']; else pathname = [pathname,'/']; end
% end

% --------------------------------------------------------------------
%   Generate XCAT2 *.bin files
% --------------------------------------------------------------------
if strcmp(filename(end-2:end),'par')
    fprintf ('Generating XCAT2 bin files...');
    fname = 'cine'; exe = 'dxcat2 ';
    if ispc  exe = 'dxcat2.exe '; end
    if ismac exe = 'dxcat2mac ';  end
    x = num2str(RotationXYZ(1));
    y = num2str(RotationXYZ(2));
    z = num2str(RotationXYZ(3));
    s = [exe,filename,' --phan_rotx ',x,' --phan_roty ',y,' --phan_rotz ',z,' ',fname];
    cd(pathname); system(s); clear x y z s;
    fprintf ('ok\n');
    filename = [fname,'_act_1.bin'];
    clear x y z s fname;
end

% --------------------------------------------------------------------
%   Read log file
% --------------------------------------------------------------------
MRX.Filename = [pathname filename];
MRX.readLogFile;

% --------------------------------------------------------------------
%   Store tissue, contrast and sequence parameters
% --------------------------------------------------------------------
MRX.Par.tissue.rhomyomuscle    = RhoMyoMuscle ;
MRX.Par.tissue.rhoskmuscle    = RhoSkMuscle ;
MRX.Par.tissue.rhofat       = RhoFat;
MRX.Par.tissue.rhoblood     = RhoBlood;
MRX.Par.tissue.rholiver     = RhoLiver;
MRX.Par.tissue.rhobone      = RhoBone;
MRX.Par.tissue.rhobody      = RhoBody;
MRX.Par.tissue.rholung      = RhoLung;
MRX.Par.tissue.rhostomach      = RhoStomach;
MRX.Par.tissue.rhoblooda     = RhoBloodA;
MRX.Par.tissue.rhobloodv     = RhoBloodV;
MRX.Par.tissue.rhokidney     = RhoKidney;
MRX.Par.tissue.rhocartilage     = RhoCartilage;
MRX.Par.tissue.rhospleen     = RhoSpleen;
MRX.Par.tissue.rhointestine     = RhoIntestine;

MRX.Par.tissue.t1myomuscle     = T1MyoMuscle;
MRX.Par.tissue.t1skmuscle     = T1SkMuscle;
MRX.Par.tissue.t1fat        = T1Fat;
MRX.Par.tissue.t1blood      = T1Blood;
MRX.Par.tissue.t1liver      = T1Liver;
MRX.Par.tissue.t1bone       = T1Bone;
MRX.Par.tissue.t1body       = T1Body;
MRX.Par.tissue.t1lung       = T1Lung;
MRX.Par.tissue.t1stomach       = T1Stomach;
MRX.Par.tissue.t1blooda      = T1BloodA;
MRX.Par.tissue.t1bloodv      = T1BloodV;
MRX.Par.tissue.t1kidney      = T1Kidney;
MRX.Par.tissue.t1cartilage      = T1Cartilage;
MRX.Par.tissue.t1spleen      = T1Spleen;
MRX.Par.tissue.t1intestine      = T1Intestine;

MRX.Par.tissue.t2myomuscle     = T2MyoMuscle;
MRX.Par.tissue.t2skmuscle     = T2SkMuscle;
MRX.Par.tissue.t2fat        = T2Fat;
MRX.Par.tissue.t2blood      = T2Blood;
MRX.Par.tissue.t2liver      = T2Liver;
MRX.Par.tissue.t2bone       = T2Bone;
MRX.Par.tissue.t2body       = T2Body;
MRX.Par.tissue.t2lung       = T2Lung;
MRX.Par.tissue.t2stomach       = T2Stomach;
MRX.Par.tissue.t2blooda      = T2BloodA;
MRX.Par.tissue.t2bloodv      = T2BloodV;
MRX.Par.tissue.t2kidney      = T2Kidney;
MRX.Par.tissue.t2cartilage      = T2Cartilage;
MRX.Par.tissue.t2spleen      = T2Spleen;
MRX.Par.tissue.t2intestine      = T2Intestine;

MRX.Par.tissue.t2smuscle     = T2sMuscle;
MRX.Par.tissue.t2sblood      = T2sBlood;

MRX.Par.scan.tr             = TR;
MRX.Par.scan.te             = TE;
MRX.Par.scan.flip           = pi*Flip/180;
MRX.Par.scan.segments       = Segments;
% LGE
MRX.Par.scan.t2p            = T2Prep;
MRX.Par.scan.ti             = TI;
MRX.Par.tissue.t1scar     = T1Scar;
MRX.Par.tissue.t2scar     = T2Scar;
MRX.Par.tissue.rhoscar     = RhoScar;
MRX.Par.tissue.t1bz     = T1BZ;
MRX.Par.tissue.t2bz     = T2BZ;
MRX.Par.tissue.rhobz     = RhoBZ;

MRX.Par.scan.seq           = Sequence;
MRX.Par.scan.name          = Name;
MRX.Par.scan.bbox           = BoundingBox;
MRX.Par.scan.lowpass        = LowPassFilt;
MRX.Par.scan.lowpass_str    = FilterStr;
MRX.Par.scan.snr            = SNR;
MRX.Par.scan.coils          = Coils;
MRX.Par.scan.coildist       = CoilDist;
MRX.Par.scan.coilsperrow    = CoilsPerRow;
MRX.Par.scan.rotation       = pi*RotationXYZ/180;
if Frames<0 % only overwrite Par.scan.frames, if Frames ~= 0 Sina changed > to <
    MRX.Par.scan.frames     = Frames;
    xcat_segments           = round(MRX.Par.scan.scan_dur/MRX.Par.scan.heartbeat_length);
    frames_max              = MRX.Par.scan.frames_xcat/xcat_segments;
    MRX.Par.scan.phases     = round( linspace(1,frames_max,Frames) );
else
    MRX.Par.scan.frames     = MRX.Par.scan.frames_xcat/MRX.Par.scan.segments;
    MRX.Par.scan.phases     = 1:MRX.Par.scan.frames;
end
MRX.Par.scan.trajectory     = Trajectory;
MRX.Par.scan.undersample    = Undersample;

% --------------------------------------------------------------------
%   Error checks
% --------------------------------------------------------------------
if mod(max(MRX.Par.scan.frames),1)>0 % check if #frames is whole number
    error('Number of frames must be an integer value. Check number of segments in LGEpar.m and number of XCAT .bin files!')
end
if exist('frames_max','var') && frames_max < MRX.Par.scan.frames
    error('Number of XCAT phases < desired number of phases. Set Frames <= %d in LGEpar.m',frames_max)
end

end