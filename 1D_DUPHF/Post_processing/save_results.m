%================================================
% Save the results
%================================================
    % Update the converged value at the end of the step
    % - History variable  , phase values
    H_n1_i = H_n1_new;
    phase_n1 = phase_n1_i;
    P_ext_n1=F_phase;
    % - structure
    u_n1 = u_n1_i;
    alpha_n=alpha_n_i;
    Eplas_n=Eplas_n_i;
    KK_n = KK_n1_i;
    % f_int_n1 = f_int_n1_i;
    %================================================
    react = f_int_n1_i(dof_disp);
    sum_r = sum(react);
    sum_u= u_n1(dof_disp(1));
    
    Plot_P(step+1) =sum_r;         % force in kN
    Plot_U(step+1) = sum_u;        % u_n1(dof_disp(1));
   % disp(['RF = ',num2str(sum_r)]);
    %====================
    % Savre Varaibles
    %====================
    mat_uR{step}=u_n1;
    mat_phaseR{step}=phase_n1;
    mat_alphaR{step}=alpha_n;
%================================================    

