ggplot(ant) +  # Inicia un nuevo gráfico utilizando el dataframe 'ant'
  geom_sf(data=ant, aes(fill = ID_2), color = "black", size = 0.25) +  # Agrega una capa de polígonos según 'ant', con colores y tamaños específicos
  theme(aspect.ratio=1,  # Establece la relación de aspecto del gráfico a 1 para que se vea cuadrado
        axis.text.x = element_blank(),  # Oculta las etiquetas del eje x
        axis.text.y = element_blank(),  # Oculta las etiquetas del eje y
        axis.title.x = element_blank(),  # Oculta el título del eje x
        axis.title.y = element_blank()) +  # Oculta el título del eje y
  scale_fill_distiller(name="Casos", palette = "YlOrRd", breaks = scales::pretty_breaks(n = 5)) +  # Define la leyenda de colores y la paleta de colores
  labs(title=" ", x = " ", y = " ")  # Asigna títulos vacíos al gráfico, eje x e eje y