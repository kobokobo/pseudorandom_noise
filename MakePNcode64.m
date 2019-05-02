%--------------------------------------------------------------------------
% MakePNcode64          Create M-squence  (bit length = 63)
%--------------------------------------------------------------------------
function[Out, workRegister] = MakePNcode64(InitRegister)
   
    % Primitive polynomial(6dim)
    % X^6 + X + 1

    % create code squence
    workRegister = zeros(1, 6);    
    OutPNcode    = zeros(1, 63);  %for output
    workRegister = InitRegister;
    
    for i = 1:1:(2^6-1)
        OutPNcode(1,i) = workRegister(1,6);
        
        % feedback
        XorIn_X1 = workRegister(1,5);
        XorIn_X0 = workRegister(1,6);
        
        % shif register
        % set-up for register in next time cycle
        temp = workRegister(1,1:5);
        workRegister(1,2:6)= temp;
        workRegister(1,1) = xor(XorIn_X1, XorIn_X0);
        
        if i==1
            arcReg = workRegister;
        end
        
    end    
    
    Out=OutPNcode';
    workRegister=arcReg; % next cycle init register value
end
