%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Calculations for determining magnetorquer parameters
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% The parameters used by reference paper are as follows 
Vbus = 1.25
L= 0.035 %in meters (55 mm for whole thing 35 or wound portion?)
r= 0.0055%radius of core in meters 
R_u =0.17678 %unit resistance; in ohms per meter for 30 gauge copper wire 
u_r = 1453 %relative permeability
N = 966 %number of turns total aka # turns per layer times # of layers --> 35 mm / 0.0114 inches to get number of turns per layer
% (35 because paper used 35 mm and 0.0114 because 30 gauge wire diamter on
% remington wires) then multiply the result of 35 mm / 0.0114 inches by 8
% layers 
I= 0.14 %amperes

%Calculating 
N_d = 4*((log(L/r))-1)/((L/r)^2 - 4*log(L/r))
M_dipole = (pi)*(r^2)*(N)*(I)*(1+(u_r-1)/(1+(u_r-1)*(N_d)))


%Displaying Results:
fprintf('Magnetorquer Parameters from Reference Paper:\n');
fprintf('Magnetic moment: %.6f\n', M_dipole);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Our Magnetorquer Design (Modify these to match your material and design)

%Design Parameters:
Vbus = 5
L= 0.035 %in meters (55 mm for whole thing 35 or wound portion?)
r= 0.0055 %radius of core in meters 
R_u = 0.17678 %unit resistance; in ohms per meter (copper 30 gauge wire) 
u_r = 1453 %relative permeability 
N = 966 %number of turns 
g = 0.00028956 %thickness of 30 gauge wire in meters 

%If permeability but not relative permeability is given use following to
%find relative permeability
%u0 = 4 * pi * 1e-7; % Permeability of free space (H/m)
%u = 
%u_r = u/u0

%Calculating 
%I=  0.56 %amperes (voltage /total resistivity of all of wire = 5/(8.83) 
L_w = (2*pi*r*N) %length of wire in total needed to be wrapped 
W_r= 1.68e-8 * L_w /(pi*(g/2)^2) % resistance of total wire to be wrapped (Using: resistivity * L/ A)
I = Vbus/W_r
N_d = 4*((log(L/r))-1)/((L/r)^2 - 4*log(L/r))
M_dipole = (pi)*(r^2)*(N)*(I)*(1+(u_r-1)/(1+(u_r-1)*(N_d)))

%Displaying Results:
fprintf('Magnetorquer Parameters:\n');
fprintf('Magnetic moment: %.6f\n', M_dipole);
