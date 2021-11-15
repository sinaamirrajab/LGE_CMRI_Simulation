
clc
clear
out_name = 'Misaligned_Slices' ;
%% load nifti files from different respiratory phases
path = '.\';
filename = 'LGE_IRSSFP_Respiratory_';
extention = '__678_1.4_1.4_6_SNR_35_img.nii.gz';
Respiratory_phase =10;

aligned_image = niftiread([filename num2str(1) extention]); % aligned images for different respirator phases
aligned_image = zeros([size(aligned_image), Respiratory_phase]);
for i = 1:Respiratory_phase
aligned_image(:,:,:,i) = niftiread([filename num2str(i) extention]);
end


%% choose different respirator phase for each simulated slice to create slice misalignment artifact
misaligned_image = zeros(size(niftiread([filename num2str(1) extention]))); % Misaligned image
% combination of respiratory phases for 19 simulated slices
% 10 respiratory phases are simulated, select a respiratory phase for each
% slice as follow:
phase_slice = [1 1 1 1 5 5 6 6 5 5 6 6 5 5 6 6 10 10 10];
% other combinations:
% phase_slice = [1 1 1 1 5 5 6 5 6 5 6 5 6 5 6 6 10 10 10];%[1 1 1 2 2 2 6 6 6 7 7 7 9 9 9 10 10 10 10]; % [1 1 1 2 2 2 5 5 5 6 6 6 9 9 9 10 10 10 10];
 %[1 1 1 2 2 2 6 6 6 7 7 7 9 9 9 10 10 10 10]; % [1 1 1 2 2 2 5 5 5 6 6 6 9 9 9 10 10 10 10];
% phase_slice = [1 1 2 2 3 3 4 4 5 5 6 6 7 7 8 8 9 9 10 10];
for k=1:19
      misaligned_image(:,:,k)=  squeeze(aligned_image(:,:,k,phase_slice(k)));
end
%% save slice misaligned image
imginfo = niftiinfo([filename num2str(1) extention]);
niftiwrite(uint16((misaligned_image)),['.\', out_name ],imginfo,'Compressed',true)
fprintf('Saving misaligned image finished \n');

