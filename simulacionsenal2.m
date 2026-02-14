% Constantes universales
e0 = 8.854e-12; % Permitividad del vacío
u0 = 4*pi*1e-7; % Permeabilidad del vacío
c = 3e8;        % Velocidad de la luz

% Configuración de la simulación
f = [403e6, 2.4e9]; % Frecuencias en Hz
er = [57.1, 52.7];  % Permitividad relativa del músculo
sigma = [0.79, 1.74]; % Conductividad del músculo (S/m)

profundidad = linspace(0, 0.20, 133); % De 0 a 15 cm dentro del cuerpo

figure; hold on;

% --- PARTE 1: CÁLCULO FÍSICO ---
PL_results = zeros(2, length(profundidad)); 

for i = 1:2
    w = 2*pi*f(i);
    e = e0 * er(i);
    
    % Cálculo de ALFA
    term1 = (u0 * e) / 2;
    term2 = sqrt(1 + (sigma(i) / (w * e))^2);
    alpha = w * sqrt(term1 * (term2 - 1));
    
    % Guardamos la pérdida en dB/m
    Loss_dB_per_meter = alpha * 8.686;
    PL_results(i, :) = Loss_dB_per_meter * profundidad; 
end

% --- GRÁFICA 1: PÉRDIDA DE PROPAGACIÓN (PATH LOSS) ---
figure(1);
plot(profundidad*100, PL_results(1,:), 'b', 'LineWidth', 2); hold on;
plot(profundidad*100, PL_results(2,:), 'r', 'LineWidth', 2);
grid on;
xlabel('Profundidad (cm)'); ylabel('Pérdida en el tejido (dB)');
title('Pérdida de señal por absorción térmica del tejido');
legend('403 MHz', '2.4 GHz');

% --- PARTE 2: POTENCIA RECIBIDA (LINK BUDGET) ---
Pt_dBm = -16;
Sensibilidad = -100;

Pr1 = Pt_dBm - (PL_results(1,:) + 3 * randn(size(profundidad))); 
Pr2 = Pt_dBm - (PL_results(2,:) + 3 * randn(size(profundidad))); 

% --- GRÁFICA 2: POTENCIA RECIBIDA ---
figure(2);
plot(profundidad*100, Pr1, 'b', 'LineWidth', 1.5); hold on;
plot(profundidad*100, Pr2, 'r', 'LineWidth', 1.5);
yline(Sensibilidad, '--m', 'Umbral de Fallo');
yline(Sensibilidad + 15, '--g', 'Zona Segura');
grid on; ylim([-180, 0]);
xlabel('Profundidad (cm)'); ylabel('Potencia Recibida (dBm)');
title('Comparativa Final: Supervivencia de la señal');
legend('403 MHz', '2.4 GHz');