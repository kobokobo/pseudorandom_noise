%--------------------------------------------------------------------------
% MakePNcode128          Create M-squence  (bit length = 127)
%--------------------------------------------------------------------------
function[Out, workRegister] = MakePNcode128(InitRegister)
   
    % Primitive polynomial(7dim)
    % X^7 + X^3 + X^2+ X + 1

    % create code squence
    workRegister = zeros(1, 7);    
    OutPNcode    = zeros(1, 127);  %for output
    workRegister = InitRegister;
    
    for i = 1:1:(2^7-1)

        OutPNcode(1,i) = workRegister(1,7);
        
        % feedback
        XorIn_X3 = workRegister(1,4);
        XorIn_X2 = workRegister(1,5);                  
        XorIn_X1 = workRegister(1,6);        
        XorIn_X0 = workRegister(1,7);
        
        % shif register
        % set-up for register in next time cycle
        temp = workRegister(1,1:6);
        workRegister(1,2:7)= temp;
        c1=xor(XorIn_X1, XorIn_X0);
        c2=xor(XorIn_X2, c1);
        workRegister(1,1) =xor(XorIn_X3, c2);
        
        if i==1
            arcReg = workRegister;
        end
        
    end    
    
    Out=OutPNcode';
    workRegister=arcReg; % next cycle init register value

end