%--------------------------------------------------------------------------
% MakePNcode16          Create M-squence  (bit length = 15)
%--------------------------------------------------------------------------
function[Out, workRegister] = MakePNcode16(InitRegister)
   
    % Primitive polynomial(4dim)
    % X^4 + X + 1

    % create code squence
    workRegister = zeros(1, 4);    
    OutPNcode    = zeros(1, 15);  %for output
    workRegister = InitRegister;
    
    for i = 1:1:(2^4-1)
        OutPNcode(1,i) = workRegister(1,4);
        
        % feedback
        XorIn_X1 = workRegister(1,3);
        XorIn_X0 = workRegister(1,4);
        
        % shif register
        % set-up for register in next time cycle
        temp = workRegister(1,1:3);
        workRegister(1,2:4)= temp;
        workRegister(1,1) = xor(XorIn_X1, XorIn_X0);
        
        if i==1
            arcReg = workRegister;
        end
    end    
    
    Out=OutPNcode';
    workRegister=arcReg; % next cycle init register value
end