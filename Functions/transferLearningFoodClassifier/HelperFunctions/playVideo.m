function playVideo(filename)
    %reader = vision.VideoFileReader(filename);
    reader = VideoReader(filename);
    imgFrame = readFrame(reader);
    f = togglefig('DISPLAY');
    set(f,'windowstyle','normal');
    imgH = imshow(imgFrame);
    %player = vision.VideoPlayer('Position', [50 100 1300 750]);
    %player = VideoPl
    %while ~isDone(reader)
    while hasFrame(reader)
        %imgFrame = reader();
        imgFrame = readFrame(reader);
        set(imgH,'CData',imgFrame);
        %pause(0.05);
        drawnow
        %player(imgFrame)
    end
%     release(reader)
%     release(player)
end