# Pensum Interactivo — Politécnico Colombiano Jaime Isaza Cadavid

Proyecto universitario open-source que mantiene una plataforma web para facilitar la visualización y planificación del pensum académico del Politécnico Colombiano Jaime Isaza Cadavid.

# Índice
1. [Características del pensum](#características-del-pensum)
2. [TODO](#todo)
3. [¿Cómo funciona el pensum?](#cómo-funciona-el-pensum)
4. [Agregar o cambiar un pensum](#agregar-o-cambiar-un-pensum)
5. [Probar pensum](#probar-pensum)
6. [Agradecimientos](#agradecimientos)

# Características del pensum
- Visualiza los créditos de las asignaturas
- Selecciona asignaturas para aprobarlas; a medida que vayas aprobando más, podrás ver cuáles se desbloquean
- Crear un pensum personal que se adecue a tu recorrido en la Universidad
    ![Gif demo de la pensum personalizado](https://media.giphy.com/media/QK448lB7juUF0ftL7g/giphy.gif)
    - Agregar y cambiar los pre-requisitos de las asignaturas, incluyendo las ya existentes
    - Agregar asignaturas que no se encuentren en el pensum oficial pero que hayas cursado
- Cualquier cambio realizado queda guardado para la próxima visita a la página
- Modo oscuro y modo claro automático basado en la configuración del SO o explorador

# TODO
* [ ] Arreglar bugs
* [X] Hacer página más usable en móviles
    * [X] Pensum personal
    * [X] Pensum interactivo
* [ ] Facilitar creación y modificación de pensums oficiales
    * [ ] Crear forma rápida para cambiar solo una asignatura
* [ ] Hacer un mejor uso de las características de GitHub
    * [ ] Definir milestones importantes
    * [ ] Crear pruebas y automatizarlas con GitHub Actions


## ¿Cómo funciona el pensum?

Cada pensum necesita de dos archivos `.json` para que se muestre en el sitio. Estos tienen por nombre
`data_CARR.json` y `colors_CARR.json` y se ubican en el directorio `/data`. `CARR` corresponde a la abreviatura de la carrera (por ej: INF para Ingeniería Informática). El primero (`data_CARR.json`) contiene
la información de cada asignatura y sus características agrupados por semestre. Se sigue la siguiente estructura:

```json5
{
  "s2": [
    ["Cálculo II","MAT-022",3,5,"PC",["MAT-021"],"A"],
    ["Física I","FIS-110",4,6,"PC",["MAT-021"],"A"],
    ["Introducción a la Ingeniería","IWG-101",2,3,"TIN",[],"A"]
  ],
//  ...
}
```

En donde `s2` corresponde al semestre (Semestre II). Cada asignatura tiene 7 items en el siguiente orden:

1. ***Nombre***: El nombre completo de la asignatura.
2. ***Sigla***: Sigla de la asignatura. **Única** para cada asignatura, no se puede repetir y no puede contener espacios. Se pide seguir el formato `sigla-número`.
3. ***Créditos USM***: Entero, la cantidad de créditos USM.
4. ***Créditos SCT***: Entero, la cantidad de créditos SCT. Si su valor es `0`, se calcula basándose en los créditos USM.
5. ***Categoría***: Categoría de la asignatura (por ejemplo, *PC*: Plan Común), se deben agregar o editar en el json `colors_CARR.json`.
6. ***Prerrequisitos***: Lista de strings con las siglas de los prerrequisitos. **Es importante que la sigla ya exista en semestres anteriores**, de lo contrario podría fallar. Esta lista es opcional.
7. ***Indicador Par o Impar***: Puede tener el valor de `"P"`, `"I"`, `"A"` o `""`. Indica si la asignatura se dicta en un semestre **P**ar, **I**mpar, o en **A**mbos. `""` actúa como `"A"` pero significa que no se sabe; por favor evitar dejarlo en blanco.

El segundo archivo es `colors_CARR.json`. Contiene las categorías y colores del pensum:

```json5
{
  "Abreviación": ["Color", "Categoría"],
//  ...
}
```

Ejemplo:

```json5
{
  "PC": ["#00838F", "Plan Común"]
}
```

Para elegir un buen color, busca "Color Picker" en [Google](https://www.google.com/search?q=Color+Picker).

## Agregar o cambiar un pensum

La forma más directa es editar o crear directamente los archivos con el formato ya explicado y realizar un pull request con los archivos en el directorio correcto.

Otra forma es crear o editar un pensum con la [generadora de pensums](personalizar/) (tiene instrucciones integradas) y enviar los datos resultantes mediante el
[formulario de actualización](https://docs.google.com/forms/d/e/1FAIpQLSc7im-tmzXlWhHYb5XmRhIMGTLQ5GUZj4haRq8iSECYsuXU8A/viewform?usp=sf_link).

*Nota*: Es recomendable hacer el proceso en un computador.


## Probar pensum

**NOTA:** Si se editan archivos `.js`, para que los cambios se reflejen ejecute desde una terminal en la carpeta raíz:
```shell
npm run devBuild
```

### Usando Python (preferido)
Levanta un mini servidor HTTP para facilitar la carga en el navegador. Abre una terminal en el directorio del proyecto y ejecuta:

* **Python 3**:
    ```shell
    python -m http.server
    ```
* **Python 2**:
    ```shell
    python -m SimpleHTTPServer
    ```

Luego abre `http://localhost:8000` en tu navegador. Para probar un pensum específico agrega `?m=CARR` a la URL, por ejemplo: `http://localhost:8000/index.html?m=INF`.


### Usando Docker
Requisitos: `docker`, `podman` u otro gestor de contenedores.

Construye la imagen:
```shell
docker build -t pensum-interactivo .
```

* **Correr la imagen**:
    ```shell
    docker run -d -p 8080:8080 --name pensum pensum-interactivo
    ```
    Visita [http://localhost:8080/](http://localhost:8080/).

* **Detener y eliminar**:
    ```shell
    docker rm --force pensum
    ```

### Usando Browser-sync
Con *NPM* instalado, ejecuta desde la carpeta raíz:
```shell
npm install
npx browser-sync -w
```

La dirección por defecto es `http://localhost:3000`.


---
# Agradecimientos

Fork adaptado para el **Politécnico Colombiano Jaime Isaza Cadavid** por [FoxyYTs](https://github.com/FoxyYTs).

Basado en el proyecto original:
* [Sebastián Aedo](https://github.com/etra0) — creador original. [Proyecto original](https://github.com/etra0/ramos)
* [CsarMan](https://github.com/CsarMan) — desarrollo principal de la malla interactiva.
* [booterman98](https://github.com/booterman98) — mantenimiento y mejoras continuas.

Al mismo tiempo se agradece a todos quienes hayan realizado un aporte al proyecto original:
<a href="https://github.com/csarman/malla-interactiva/graphs/contributors">
<img src="https://contrib.rocks/image?repo=csarman/malla-interactiva" />
</a>
