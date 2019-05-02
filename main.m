
clear all
close all

prompt = 'Choose code length (0::15bit, 1::63bit, 2::128bit)';
str = input(prompt, 's');

if isequal(str, '0')
  disp('MakePNcode16');
  % Initial regoster value, any bit pattern is OK
  InitRegister=[1, 0, 0, 0];  % for MakePNcode16
  for i=1:15
    [PKEY(:,i), tempReg] = MakePNcode16(InitRegister);
    InitRegister = tempReg;
  end
  % if you want to make N*N matrix (N=16,64,128) for Orthogonal matrix
  % be active the following 2 lines to add "0"
  % PKEY(:,16)=0;
  % PKEY(16,:)=0;
elseif isequal(str, '1')
  disp('MakePNcode64');
  % Initial regoster value, any bit pattern is OK
  InitRegister=[1, 0, 0, 0, 0, 0];  % for MakePNcode64
  for i=1:63
    [PKEY(:,i), tempReg] = MakePNcode64(InitRegister);
    InitRegister = tempReg;
  end
  % if you want to make N*N matrix (N=16,64,128) for Orthogonal matrix
  % be active the following 2 lines to add "0"
  % PKEY(:,64)=0;
  % PKEY(64,:)=0;
elseif isequal(str, '2')
  disp('MakePNcode128');
  % Initial regoster value, any bit pattern is OK
  InitRegister=[1, 0, 0, 0, 0, 0, 0];  % for MakePNcode128
  for i=1:127
    [PKEY(:,i), tempReg] = MakePNcode128(InitRegister);
    InitRegister = tempReg;
  end
  % if you want to make N*N matrix (N=16,64,128) for Orthogonal matrix
  % be active the following 2 lines to add "0"
  % PKEY(:,128)=0;
  % PKEY(128,:)=0;
end 


% if you want to make 1/-1 bit battern
% be active the following 2 lines to change 0 to -1
ind=find(PKEY==0); 
PKEY(ind)=(-1)*ones(size(ind));    


% for checking
disp('show pseudorandom_noise_code');
PKEY

disp('show pseudorandom_noise_code at phase diff 2');
PKEY(:,3)
