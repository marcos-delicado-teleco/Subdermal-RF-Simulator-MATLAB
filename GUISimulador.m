function SimuladorImplantable
    % Crear la ventana principal
    fig = uifigure('Name', 'Simulador de Comunicaciones Subdermales', 'Position', [100 100 800 500]);
    
    % Panel de control (izquierda)
    pnl = uipanel(fig, 'Title', 'Configuración', 'Position', [20 50 250 400]);
    
    % Slider para Profundidad
    uilabel(pnl, 'Text', 'Profundidad Máxima (cm):', 'Position', [10 340 200 22]);
    sld = uislider(pnl, 'Position', [20 320 210 3], 'Limits', [1 30], 'Value', 15);
    
    % Menú para tipo de tejido
    uilabel(pnl, 'Text', 'Tipo de Tejido:', 'Position', [10 260 200 22]);
    drop = uidropdown(pnl, 'Items', {'Músculo', 'Grasa', 'Piel'}, 'Position', [10 230 220 22]);
    
    % Botón de Simulación
    btn = uibutton(pnl, 'push', 'Text', 'EJECUTAR SIMULACIÓN', ...
        'Position', [10 100 220 40], 'BackgroundColor', [0.2 0.6 1], 'FontWeight', 'bold');
    
    % Ejes para la gráfica (derecha)
    ax = uiaxes(fig, 'Position', [300 80 450 380]);
    grid(ax, 'on');
    title(ax, 'Presupuesto de Enlace en Tiempo Real');
    ylabel(ax, 'Potencia Recibida (dBm)');
    xlabel(ax, 'Profundidad (cm)');

    % Función que actualiza la gráfica
    btn.ButtonPushedFcn = @(btn,event) actualizarGrafica(ax, sld.Value, drop.Value);
end

function actualizarGrafica(ax, profMax, tejido)
    % Parámetros según tejido (Simplificado para el ejemplo)
    if strcmp(tejido, 'Músculo')
        er = [57.1, 52.7]; sigma = [0.79, 1.74];
    elseif strcmp(tejido, 'Grasa')
        er = [5.5, 5.2]; sigma = [0.04, 0.1]; % La grasa atenúa MUCHO menos
    else % Piel
        er = [46.7, 38.0]; sigma = [0.69, 1.46];
    end
    
    f = [403e6, 2.4e9];
    d = linspace(0, profMax/100, 100);
    e0 = 8.854e-12; u0 = 4*pi*1e-7;
    Pt = -16; Sens = -100;
    
    cla(ax); % Limpiar gráfica anterior
    hold(ax, 'on');
    
    colores = {'b', 'r'};
    for i = 1:2
        w = 2*pi*f(i);
        e = e0 * er(i);
        alpha = w * sqrt((u0*e)/2 * (sqrt(1 + (sigma(i)/(w*e))^2) - 1));
        PL = (alpha * 8.686) * d;
        Pr = Pt - (PL + 2*randn(size(d)));
        plot(ax, d*100, Pr, colores{i}, 'LineWidth', 1.5);
    end
    
    yline(ax, Sens, '--m', 'Fallo', 'LineWidth', 2);
    legend(ax, {'403 MHz', '2.4 GHz', 'Umbral'});
    ylim(ax, [-160 0]);
end