function compress_and_save(IMU_name)
    if endsWith(IMU_name, '_compressed') %if already compressed
        evalin('base',['save(''' IMU_name ''',''' IMU_name ''',''-v7.3'');']);
        disp("compressed IMU is saved in the current folder");
    elseif startsWith(IMU_name, 'IMUAligned') && ~endsWith(IMU_name, '_compressed') %if not compressed
        evalin('base',[IMU_name '_compressed = DatasetClass.compressIMU(' IMU_name ');']); %compress
        compressed_name = [IMU_name '_compressed']; %change name variable
        evalin('base',['save(''' compressed_name ''',''' compressed_name ''',''-v7.3'');']); %save as new name
        disp("IMU compressed and saved in the current folder");
    else %invalid argument
        disp("error: enter proper IMU name as an argument, e.g. compress_and_save('IMUAligned')");
    end
end