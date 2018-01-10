% Power Calculator and Run Estimator using a differential equation method
% Date Created 16/9/17
close all; clear all;

%% DATA INPUTS
% Data values accurate for Record Run, 16/4/17 at FPV
rho = 1.19; %Air Density, kg/m^3
CdA = 0.024;
m = 128; % Total Mass
g = 9.80; %Gravity
mu = 0.0068; %Co-efficient of Rolling Resistance
grad = 0.28; %Road Gradient
dtEff = 11.3; %Drivetrain Eff %, is taken off Power Input

%% POWER EQUATIONS
%Defined in separate functions for faster speed
%P_air -> Air Drag
%P_roll -> Rolling Resistance
%P_slope -> Power against gravity when riding up a slope
% P_Input_Easter -> Piecewise polynomial function for the power exerted at
% the easeter event, record run

%% POWER INPUT FUNCTION
RunData = csvread('Run_Data_17_9_26_12_34.csv',1,0);

tLength = length(RunData(:,1));
PowerSection = (RunData(1:tLength,7));
tSection = RunData(:,1);
Func = polyfit(tSection,PowerSection,4);
FuncSuper = d2c(PowerSection)

P_input = @(Func,t) polyval(Func,t);
% figure
% plot(tSectionA,PowerSectionA)
% hold on
% plot(tSectionA,polyval(FuncA,tSectionA))
%% POWER ODE
dvdt = @(t,v) (1/(m*v))*((P_input(Func,t))*(1-dtEff/100) - P_air(rho,CdA,v) - P_roll(m,g,mu,grad,v) - P_slope(m,g,grad,v)) ;

v0 = 5;
tspan = [0,tLength];

%% SOLVING THE ODE

opts = odeset('Refine',10,'RelTol',1e-7); %increases the number of points, better for plotting the power input
[t,v] = ode45(dvdt,tspan,v0,opts); % solve the ode

% Plot velocity vs time and distance

figure
subplot(3,1,1)
plot(t,v)
xlabel('time (s)')
ylabel('velocity (m/s)')
hold on

vActual = (RunData(1:tLength,5))./3.6;
plot(1:tLength,vActual)
hold off

d= [0];
for n = 2:length(t)
    d(n) = d(n-1)+ v(n-1)*(t(n)-t(n-1));
end
    
    
subplot(3,1,2)
plot(d,v(1:length(d)))
xlabel('distance (m)')
ylabel('velocity (m/s)')

%% plot the input power vs distance

for k = 1:length(t)
     Pin(k)=P_input(Func,t(k));
end

subplot(3,1,3)
plot(t,Pin)
xlabel('time (s)')
ylabel('Input Power (W)')
 hold on
 plot(1:tLength,(RunData(1:tLength,7))')