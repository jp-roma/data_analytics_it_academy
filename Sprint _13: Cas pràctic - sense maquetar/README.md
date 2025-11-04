<img src="https://www.barcelonactiva.cat/documents/20124/1625465/it_academy_logo.png/859268c9-6aba-5a5c-2dea-980fb2098e5d?version=1.0&t=1662625857883&download=true" alt="logo_IT_Academy" width="300"> 


# <span style="color: rgba(0, 203, 230, 1);"> Analítica del aprendizaje: un enfoque para optimizar el proceso de aprendizaje. 
## Análisis diagnóstico y predictivo de los factores de riesgo del comportamiento y el rendimiento de los estudiantes en entornos virtuales. 📊💻
 </span> 

### Fundamentación 

Actualmente, las universidades cuentan con una mayor variedad de modelos educativos, como el aprendizaje semipresencial y el aprendizaje electrónico. A pesar de las crecientes oportunidades para estudiantes y docentes, el aprendizaje en línea también plantea desafíos debido a la ausencia de contacto humano directo. 

Los entornos virtuales permiten generar grandes cantidades de datos relacionados con los procesos de enseñanza y aprendizaje, lo que ofrece la posibilidad de extraer información valiosa que puede utilizarse para mejorar el rendimiento estudiantil.

### Problema de Investigación y Objetivos

El problema de investigación se centra en la identificación y cuantificación temprana de los estudiantes en riesgo de reprobar un curso o programa. El objetivo fundamental de este estudio fue implementar un modelo de Learning Analytics capaz de monitorear y predecir el desempeño estudiantil, facilitando la intervención oportuna y personalizada.

Los objetivos específicos incluyeron:
Establecer la correlación entre las métricas de comportamiento en el EVA (actividad, persistencia) y el rendimiento académico final.
Desarrollar una segmentación (clustering) de la cohorte estudiantil basada en sus patrones de interacción y desempeño inicial.
Determinar los umbrales críticos de las variables identificadas que actúan como predictores significativos de riesgo de fracaso.

### Introducción
<img src = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTg5ecJUTBB0B1fHWxHHjhmbCYlt6lh7LCyJA&s" alt= 'Open University' width= "300">

#### Contexto

La Open University es una universidad pública británica que cuenta con el mayor número de estudiantes de pregrado del Reino Unido. Es la mayor institución académica del Reino Unido (y una de las mayores de Europa), con 2 millones de estudiantes matriculados desde su fundación en 1969. Como su nombre indica, la mayoría de sus estudiantes estudian a distancia.


#### Contenido

Conjunto de datos de análisis del aprendizaje de la Open University (OULAD). Contiene datos sobre cursos, estudiantes y sus interacciones con el Entorno Virtual de Aprendizaje (EVA) para siete cursos seleccionados (denominados módulos). Las presentaciones de los cursos comienzan en febrero y octubre, y están marcadas con las letras «B» y «J», respectivamente. 

El conjunto de datos consta de tablas conectadas mediante identificadores únicos.

Además, el conjunto de datos incluye información demográfica de los estudiantes, como ubicación, grupo de edad, discapacidad, nivel educativo, género, etc.

También se incluyen las calificaciones de las evaluaciones de los estudiantes y sus interacciones con el Entorno Virtual de Aprendizaje (EVA).

### <span style = "color: rgba(216, 221, 228, 1);">Análisis diagnóstico de factores de riesgo y rendimiento estudiantil</span>📊

### ⚙️ Configuración del proyecto

1. Clonar el repositorio:
    ```
    git@github.com:jp-roma/data_analytics_it_academy/Sprint _13: Cas pràctic - sense maquetar
    
    ````
2. Crear y activar un entorno virtual:
    ```
    python -m venv .venv
    source .venv/bin/activate      # Mac / Linux
    # OR
    .venv\Scripts\activate         # Windows

    ```

3. Instalar las dependencias:
    ```
    pip install -r requirements.txt
    ```
### 💾 Recolección de datos:

El conjunto de datos corresponde al dataset: Open University Learning Analytics Dataset [OULAD](https://www.kaggle.com/datasets/anlgrbz/student-demographics-online-education-dataoulad/data). Pertenciente a la plataforma de aprendizaje en línea de la universidad pública británica Open University, con información demográfica de los estudiantes

Licencia Attribution 4.0 International (CC BY 4.0)
---

En la carpeta `data/processed` del repositorio se alojan los master_data_sets utilizados para las visualizaciones y el agrupamiento por clusters, ejecutado mediante el algoritmo K-means de ML no supervisado.



###· ⚡ Como ejecutar el proyecto

Para reproducir completamente el análisis, se deben seguir estos pasos:

### Paso 1: Ejecutar el notebook del EDA

    ```
    notebooks/EDA_Project_IT_Academy.ipynb
    ```

Este notebook:

- Carga y limpia los datos originales.
- Realiza los merge de las tablas necesarias para el análisis diagnóstico
- Normalización de las variables numéricas y manejo de valores atípicos.
- Realiza agregaciones y métricas para las visualizaciones posteriores.
- Fusiona los datos de las evaluaciones de los estudiantes, con sus acciones en el EVA, y los registros realizados.
- Crea conjuntos de datos agregados, listos para la visualización de los datos.
- Genera las visualizaciones del análisis diagnóstico del dataframe master (df_base)

El conjunto de datos limpios y fusionados, con los dataset finales, tanto del EDA como del agrupamiento por clusters, se alojan en la carpeta: `data/processed`.

### Paso 2: Ejecutar el notebook de ML no supervisado (k-means)

    ```
    notebooks/K_Means_Project_IT_Academy.ipynb
    ```
Este notebook genera la agrupación de los datos en clusters, mediante el algoritmo K-means, para segmentar a la población en cuatro grupos homogéneos (Cluster 0, 1, 2, y 3) según la combinación de sus niveles de actividad, persistencia y score inicial.

Tambien genera los gráficos de los perfiles generados para cada cluster, y su posterior análisis. 

---

Todas las imagenes finales se dejan en la carpeta:

```
visuals/images
```
### 📈 Conclusión y Recomendaciones

El modelo de Learning Analytics implementado logró identificar con precisión los perfiles de riesgo, destacando que el fracaso estudiantil en entornos virtuales es multifactorial, siendo la inactividad temprana el riesgo primario, seguido por el bajo rendimiento inicial en aquellos estudiantes que sí demuestran actividad.

La contribución de este estudio al campo educativo radica en la validación de umbrales de riesgo accionables que permiten a la institución de enseñanza pivotar de un enfoque reactivo a uno predictivo.


### 📑 Presentación del proyecto

En la carpeta `docs/overview` se encuentra la presentación del proyecto, mas un informe resumido y la documentación completa del análisis diagnóstico y predictivo realizado para el dataset (OULAD).


## 🧑‍💻 Autoria

| Nombre         | GitHub |
|----------------|--------|
| Juan Pablo Romagnoli | [@jp-roma](https://github.com/jp-roma)


