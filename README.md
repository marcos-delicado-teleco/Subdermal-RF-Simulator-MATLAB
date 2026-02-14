# 📡 In-Body RF Propagation Simulator (MATLAB)

[![MATLAB](https://img.shields.io/badge/Made%20with-MATLAB-orange.svg)](https://www.mathworks.com/products/matlab.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[Análisis y Simulación de la Propagación Electromagnética en Comunicaciones Subdermales.pdf](https://github.com/user-attachments/files/25309305/Analisis.y.Simulacion.de.la.Propagacion.Electromagnetica.en.Comunicaciones.Subdermales.pdf)

## 📝 Descripción
Este proyecto es un simulador de propagación electromagnética diseñado para analizar la viabilidad de las comunicaciones inalámbricas en dispositivos médicos implantables (IMDs). 

El software compara el rendimiento de la banda **MedRadio (403 MHz)** frente a la banda **ISM (2.4 GHz)**, modelando cómo los tejidos biológicos (músculo, grasa y piel) afectan a la integridad de la señal mediante las ecuaciones de Maxwell para medios disipativos.



## 🚀 Características
- **Interfaz Gráfica (GUI):** Simulador interactivo desarrollado en MATLAB para ajustar parámetros en tiempo real.
- **Modelado Físico Real:** Uso de constantes dieléctricas (permitividad $\epsilon$ y conductividad $\sigma$) basadas en la base de datos de la **IT'IS Foundation**.
- **Análisis de Link Budget:** Cálculo de potencia recibida incluyendo efectos estocásticos de *shadowing* (ruido log-normal) según el modelo de **Sayrafian-Pour**.
- **Comparativa Multitecnología:** Evaluación de estándares IEEE 802.15.6 frente a soluciones comerciales como Bluetooth.

## Gráficas

**Atenuación específica en tejido muscular. Se observa una pendiente significativamente mayor para la banda de 2.4 GHz debido a las pérdidas dieléctricas.**
<img width="1090" height="708" alt="image" src="https://github.com/user-attachments/assets/a60a4399-f019-406e-8d94-db313e3e8470" />

**Simulación del presupuesto de enlace (Link Budget). El margen de seguridad de la banda MedRadio (403 MHz) garantiza la estabilidad frente al umbral crítico de -100 dBm.**
<img width="1090" height="719" alt="image" src="https://github.com/user-attachments/assets/61381e56-369a-4d48-a28a-77afe414b526" />

## Simulador GUI distintas superficies
<img width="1597" height="1029" alt="image" src="https://github.com/user-attachments/assets/e861e22a-387d-4af7-93f8-c161d4595bbf" />



