# NBA Career Longevity Prediction Model 🏀

Este repositorio contiene una **primera aproximación** a un modelo de regresión logística que utiliza solo el número de partidos jugados (`gp`) por jugadores de la NBA para predecir si tendrán una carrera de al menos cinco años. Este código es una introducción simple y básica para entender los fundamentos de la regresión logística en el contexto de predicciones deportivas.

## Descripción del Proyecto 📜

El modelo se construye utilizando datos de jugadores de la NBA, específicamente enfocándonos en su `gp` (número de partidos jugados) como única variable independiente para predecir la posibilidad (`target_5yrs`) de que su carrera dure al menos cinco años.

## Estructura del Código 🗂

1. **Ajuste de Datos**: Transformamos la variable `target_5yrs` en factor y exploramos la estructura de los datos.
2. **Construcción del Modelo**: Usamos la función `glm()` para ajustar un modelo de regresión logística con la familia binomial.
3. **Interpretación del Modelo**:
   - Identificación y explicación de la ecuación logística.
   - Significado de los coeficientes y el odd ratio.
4. **Cálculo de Probabilidades**: Generamos las probabilidades predichas para cada observación.
5. **Clasificación y Evaluación**:
   - Clasificamos las observaciones basadas en un umbral de probabilidad de 0.5.
   - Evaluamos el modelo usando una matriz de confusión para obtener métricas de sensibilidad y precisión.

## Resultados del Modelo 📊

- **Ecuación**: `log(p/1-p) = -2.524465 + 0.051059(gp)`
- **Odd Ratio de gp**: Por cada partido adicional jugado, las probabilidades de tener una carrera de al menos 5 años aumentan en un factor de 1.05.
- **Matriz de Confusión**:
  - Sensibilidad: 0.8195
  - Precisión: 0.6873

## Instalación y Ejecución 🚀

Para ejecutar este proyecto, necesitarás R y RStudio instalados en tu máquina. Clona este repositorio y abre el archivo del proyecto en RStudio. Asegúrate de instalar las dependencias necesarias:

```R
install.packages("caret")
