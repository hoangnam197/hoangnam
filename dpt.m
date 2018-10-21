fs = 44100; 
r = audiorecorder(fs, 16, 1); 
record(r);
stop(r);
b = getaudiodata(r);
sound(b,fs);
audiowrite('hoangnam.wav', b, fs);

%Tao melody

[y, fs] = audioread('hoangnam.wav'); % Doc file am thanh
t = 0 : 1/fs : 0.6;   % %Truc thoi gian
f = 440;
tone = {};
song=[];
for i=1:12
        tone{i}=(0.3/i)*sin(2*pi*f*((2^(i+1)).^(1/12))*t);
end
b1 = tone{1}; b2 = tone{2}; b3 = tone{3};
b4 = tone{4}; b5 = tone{5}; b6 = tone{6}; 
b7 = tone{7}; b8 = tone{8}; b9 = tone{9};
b10= tone{10}; b11 = tone{11}; b12 =tone{12};
b = [ b2 b3 b5 b4 b2 b12 b11 b9 b10 b7 b1 b4 b6 b8 b5 ];
size(k)
Undefined function or variable 'k'.
 

size(k)
Undefined function or variable 'k'.
 
size(y)

ans =

      287744           1

m = y + b(1:length(287744));
for i = 1:1
       for j = 1:287744
                m(j,i) = y(j,i) + b(i+j); 
       end
end
sound(m, fs);
audiowrite('melody.wav', m, fs);   % luu file melody

%test

[a, fs] = audioread('melody.wav');
sound(a, fs);

% Chuyen doi FFT

B = fft(a);
plot(abs(B));
figure(1);
N =length(a);  %Do dai(so diem) FFT
transform = fft(a)/N;
magTransform = abs(transform);
faxis = linspace(-N/2,N/2,N);
figure(2);
plot(faxis,fftshift(magTransform));  %FFT
title('The Spectrum');
xlabel('Frequency (Hz)');

% Spectrogram
win = 128;    %Do dai
hop = win/2;    %So mau tin hieu chong len nhau

%Tao hinh ve
figure(3);
nfft = win;
spectrogram(a,win,hop,nfft,fs,'yaxis');
yt = get(gca,'YTick'); 
set(gca,'YTickLabel', sprintf('%.0f|',yt));
title('Spectrogram');
