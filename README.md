# 📡 In-Body RF Propagation Simulator (MATLAB)

[![MATLAB](https://img.shields.io/badge/Made%20with-MATLAB-orange.svg)](https://www.mathworks.com/products/matlab.html)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 📝 Descripción
Este proyecto es un simulador de propagación electromagnética diseñado para analizar la viabilidad de las comunicaciones inalámbricas en dispositivos médicos implantables (IMDs). 

El software compara el rendimiento de la banda **MedRadio (403 MHz)** frente a la banda **ISM (2.4 GHz)**, modelando cómo los tejidos biológicos (músculo, grasa y piel) afectan a la integridad de la señal mediante las ecuaciones de Maxwell para medios disipativos.



## 🚀 Características
- **Interfaz Gráfica (GUI):** Simulador interactivo desarrollado en MATLAB para ajustar parámetros en tiempo real.
- **Modelado Físico Real:** Uso de constantes dieléctricas (permitividad $\epsilon$ y conductividad $\sigma$) basadas en la base de datos de la **IT'IS Foundation**.
- **Análisis de Link Budget:** Cálculo de potencia recibida incluyendo efectos estocásticos de *shadowing* (ruido log-normal) según el modelo de **Sayrafian-Pour**.
- **Comparativa Multitecnología:** Evaluación de estándares IEEE 802.15.6 frente a soluciones comerciales como Bluetooth.
