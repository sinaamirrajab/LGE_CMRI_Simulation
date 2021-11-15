

    [filename,pathname] = uigetfile({'*.bin'});
    fname = [pathname filename];
    
    %-------------------------------------------------------------------------
    % get XCAT data
    %-------------------------------------------------------------------------
    fid  = fopen( fname );
    SA = fread(fid,inf,'float','l');
    fclose(fid);
    SAdata=reshape(SA,384,384,384);
    
    [filename,pathname] = uigetfile({'*.bin'});
    fname = [pathname filename];
    
    fid  = fopen( fname );
    axial = fread(fid,inf,'float','l');
    fclose(fid);
    axialdata=reshape(axial,384,384,384);