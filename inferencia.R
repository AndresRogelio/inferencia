# La prueba t de Student

getwd()

# no hay evidencia suficiente en los datos disponibles 
# para concluir que las dos poblaciones de las que
#  se extraen las muestras son diferentes.
#
library(tidyverse)
library(report)
library(UsingR)
data(blood)
names(blood) <- c("Máquina","Experto")
blood2 <- pivot_longer(blood, cols = 1:2, names_to ="Tipo",
values_to = "Medida")
blood2
# graf1
boxplot(Medida ~ Tipo, data = blood2,
        las = 1, main= "Presión sanguínea")
# graf1
bwplot( Medida ~ Tipo,
	data = blood2, main= "Presión sanguínea")
# graf1
ggplot(blood2) +
  aes(x = Tipo, y = Medida) +
  geom_boxplot() +
  labs(title = "Presión sanguínea", ) +
  theme_minimal()

attach(blood)
t.test(Machine, Expert,  var.equal = TRUE)
mod1 <- t.test(Machine,Expert, var.equal = TRUE)
report(mod1)
detach(blood)
# No hay evidencia suficiente en los datos disponibles 
#   para concluir que las dos poblaciones de las que
#   se extraen las muestras son diferentes.
# El valor p es 0,830, por lo que al nivel de significación
#   del 5 % no rechazamos la hipótesis nula de igualdad de medias.
# No hay suficiente evidencia en los datos 
#   para rechazar la hipótesis nula, que dice que las dos medias 
#   en las poblaciones son similares.

# -----------------------------------------------

pesas <- read.csv("Halterofilia.csv", sep = ";")
pesas
bwplot( Peso ~ Sexo,
	data = pesas, main= "Levantamiento de pesas")

fpesas <- subset(pesas, Sexo == "F", select = 1:6)
mpesas <- subset(pesas, Sexo == "M", select = 1:6)

t.test(fpesas$Peso, mpesas$Peso)
mod2 <- t.test(fpesas$Peso, mpesas$Peso)
report(mod2)

# Hay evidencia suficiente en los datos disponibles 
# para concluir que las dos poblaciones de las que
# se extraen las muestras son diferentes.

t.test(Peso ~ Sexo, data = pesas)
mod3 <- t.test(Peso ~ Sexo, data = pesas)
report(mod3)

# Cargar paquete
library(ggstatsplot)

# gráfico con resultados estadísticos
ggbetweenstats(
  data = pesas,
  x = Sexo,
  y = Peso,
  plot.type = "box", 
  type = "parametric", 
  var.equal = T, 
  centrality.plotting = F)  +  
  labs(caption = NULL)
# prueba de normalidad
 shapiro.test(mpesas$Peso)
 shapiro.test(fpesas$Peso)
# histograma 
 hist(mpesas$Peso)
 hist(fpesas$Peso)
#Graf qqplot 
 qqnorm(fpesas$Peso)
 qqline(fpesas$Peso)
 
 qqnorm(mpesas$Peso)
 qqline(mpesas$Peso)

car::leveneTest(pesas$Peso ~ pesas$Sexo) 
 
 # wilcox.test()
# --------------------------------------
mpesas$Categoria <- factor(mpesas$Categoria,
  levels = c("menos 56",  "menos 62",  "menos 69",  "menos 77", 
"menos 85",  "menos 94",  "menos 105", "mas 105"))

ggplot(mpesas) +
  aes(x = Categoria, y = Arrancada, color = Categoria) +
  geom_jitter() +
  labs(title = "Dispersión de puntos") +
  theme(legend.position = "none")

ggplot(mpesas) +
  aes(x = Categoria, y = Arrancada, color = Categoria) +
  geom_boxplot() +
  labs(title = "Cajas") +
  theme(legend.position = "none")

# kruskal.test(Arrancada ~ Categoria, data = mpesas)

res_aov <- aov(Arrancada ~ Categoria,
  data = mpesas)

summary(res_aov)

report(res_aov)

# comprobar la normalidad
par(mfrow = c(1, 2)) # combine plots

# histogram
hist(res_aov$residuals)

# QQ-plot
car::qqPlot(res_aov$residuals, id = FALSE)
dev.off()


shapiro.test(res_aov$residuals)

# Boxplot
boxplot(Arrancada ~ Categoria,
  data = mpesas, las = 2, xlab = " ")

# Dotplot
dotplot(Arrancada ~ Categoria,
  data = mpesas)

# Levene's test
car::leveneTest(Arrancada ~ Categoria,
  data = mpesas)


par(mfrow = c(1, 2)) # combinar gráficos

# 1. Homogeneidad de varianzas
plot(res_aov, which = 3)

# 2. Normalidad
plot(res_aov, which = 2)

dev.off()

ggplot(mpesas) +
  aes(x = Categoria, y = Arrancada) +
  geom_boxplot()

group_by(mpesas, Categoria) %>%
  summarise(mean = mean(Arrancada, na.rm = TRUE),
    sd = sd(Arrancada, na.rm = TRUE))
# suponiendo varianzas distintas
res_aov <- aov(Arrancada ~ Categoria,
  data = mpesas)

summary(res_aov)
report(res_aov)

# suponiendo varianzas iguales
welch <- oneway.test(Arrancada ~ Categoria,
  data = mpesas, var.equal = TRUE)
welch

# -----------------------

library(multcomp)

# Tukey HSD test:
post_test <- glht(res_aov,
  linfct = mcp(Categoria = "Tukey"))

summary(post_test)

par(mar = c(3, 10, 3, 3))
plot(post_test)

TukeyHSD(res_aov)
plot(TukeyHSD(res_aov), las=1)

# prueba de Dunn
library(FSA)

dunnTest(Arrancada ~ Categoria,
  data = mpesas, method = "holm")
# 
pairwise.t.test(mpesas$Arrancada, mpesas$Categoria,
  p.adjust.method = "holm")

# ----------------------------

ggbetweenstats(
  data = mpesas,
  x = Categoria,
  y = Arrancada,
  type = "parametric", 
  var.equal = TRUE, 
  plot.type = "box",
  pairwise.comparisons = F,
  pairwise.display = "significant",
  centrality.plotting = FALSE,
  bf.message = FALSE
)

# kruskal.test(Arrancada ~ Categoria, data = mpesas)
# car::leveneTest(Arrancada ~ Categoria, data = mpesas)
# oneway.test(Arrancada ~ Categoria,
#  data = mpesas, var.equal = TRUE)


# ------------------------------

ggbetweenstats(
  data = mpesas,
  x = Categoria,
  y = Arrancada,
  type = "nonparametric", 
  plot.type = "box",
  pairwise.comparisons = F,
  pairwise.display = "significant",
  centrality.plotting = FALSE,
  bf.message = FALSE
)
