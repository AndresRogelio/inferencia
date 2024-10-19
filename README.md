# Análisis Estadístico de Datos de Salud y Deporte

Este proyecto realiza un análisis estadístico sobre datos de presión sanguínea y levantamiento de pesas utilizando técnicas como la prueba t de Student y el análisis de varianza (ANOVA). El objetivo es comparar las medias de diferentes grupos y evaluar si existen diferencias significativas en las medidas.

## Contenido del Proyecto

- **Análisis de Presión Sanguínea**: Comparación de medidas entre dos métodos de evaluación (Máquina vs. Experto).
- **Análisis de Levantamiento de Pesas**: Comparación de pesos levantados por diferentes géneros y categorías.
- **Visualizaciones**: Gráficos de cajas y otras visualizaciones para facilitar la interpretación de los datos.
- **Pruebas de Supuestos**: Verificación de normalidad y homogeneidad de varianzas.

## Instalación

Para ejecutar este proyecto, necesitarás tener R y RStudio instalados. Además, se deben instalar las siguientes bibliotecas:

```r
install.packages(c("tidyverse", "report", "UsingR", "ggstatsplot", "car", "FSA", "multcomp"))
```

## Uso
1. Abre RStudio y carga el script principal
   ```r
   source("tu_script.R")
   ```
2. Asegúrate de tener el archivo `Halterofilia.csv` en el directorio correcto, según se indique en el script.
3. Ejecuta las secciones del código según se requiera para realizar los análisis deseados.

## Resultados
- Prueba t de Student: Los resultados indican que no hay evidencia suficiente para concluir que las medias de presión sanguínea son diferentes entre los métodos de evaluación.
- Análisis de Levantamiento de Pesas: Se encontró evidencia suficiente para concluir que hay diferencias significativas en los pesos levantados entre los géneros.
- ANOVA: Se realizaron comparaciones múltiples utilizando la prueba de Tukey y se verificaron los supuestos necesarios para el análisis.

## Contribuciones
Las contribuciones son bienvenidas. Si deseas colaborar, por favor crea un fork del repositorio y envía un pull request con tus mejoras o sugerencias.

## Referencias
- `Tidyverse`: [CRAN](https://cran.r-project.org/web/packages/tidyverse/index.html)
- `ggstatsplot`: [GitHub](https://github.com/IndrajeetPatil/ggstatsplot)
- `car`: [CRAN](https://cran.r-project.org/web/packages/car/index.html)
- `FSA`: [CRAN](https://cloud.r-project.org/web/packages/FSA/index.html)
- `report`: [CRAN](https://cran.r-project.org/web/packages/report/index.html)
- `UsingR`: [GitHub](https://github.com/ckb/UsingR)
- `multcomp`: [CRAN](https://cran.r-project.org/web/packages/multcomp/index.html)
