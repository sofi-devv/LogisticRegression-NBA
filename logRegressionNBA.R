# 1. Ajustar los datos -> variables numéricas y categóricas
  
  df <- nba.players
  names(df)
  str(df)
  
  # volver factor nuestra variables dependiente
  df$target_5yrs <- as.factor(df$target_5yrs)
  levels(df$target_5yrs)

# 2. calcular el modelo
  # glm -> función que permite general modelos lineales generalizados
  
  reglog1 <- glm(df$target_5yrs ~ df$gp, family = binomial)

# 3. Identidicar la ecuación
  # no hay una y si no log(p/1-p)
  # log(p/1-p) = b0 + b1(x1)
  
  summary(reglog1)
  
  # log(p/1-p) = -2.524465  + 0.051059(x1)
  # la variable gp es significativa por que tiene un valor muy pequeño <2e-16 ***
  
  # ¿Qué nos indican los coeficientes?
  exp(reglog1$coefficients)
  # el odd ratio de gp = exp(0.051059) = 1.05 
    # interpretación -> por cada unidad que aumenta la variable gp, el odds de que se presente el evento aumenta 1.05 veces.
  
# 4. ¿Cómo calcular las probabilidades?
  reglog1$fitted.values
  # nos da los valores reemplazados en la ecuación que nos da la P de cada evento
  
# 7. Clasificar
  df$predicho <- as.numeric(reglog1$fitted.values>=0.5)
  df$predicho <- as.factor(df$predicho)
  levels(df$predicho)
  df
  
  
  df$predicho <- factor(df$predicho, levels = c(0, 1))
  df$target_5yrs <- factor(df$target_5yrs, levels = c(0, 1))
  
# 8. Cuán efectivo es el modelo - matriz de confución 
  library(caret)
  caret::confusionMatrix(df$predicho, df$target_5yrs, positive = "1")

  # Sensitivity : 0.8195 -> funciona para predecir los positivos
  # Sensitivity : 0.8195 -> funciona para predecir los negativos
  
  # Accuracy : 0.6873  -> rendimiento general

  

