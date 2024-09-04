# GraphQLRickAndMortyTestApp
Esta es una aplicación SwiftUI que muestra personajes del universo de Rick y Morty, utilizando GraphQL para obtener datos de la API de [API de Rick y Morty](https://rickandmortyapi.com/graphql). La app soporta paginación, muestra detalles de los personajes y maneja errores de manera adecuada.

## Características

- **SwiftUI**: Utiliza SwiftUI para la interfaz de usuario.
- **GraphQL**: Obtiene datos utilizando GraphQL con Apollo iOS.
- **FluidGradient y Shimmer**: Para mejoras en la interfaz de usuario.
- **Kingfisher**: Maneja la carga y el almacenamiento en caché de imágenes.


## Requisitos Previos

- **Xcode 14.0**: Asegúrate de tener Xcode instalado en tu Mac.
- **iOS 17.0 o superior**: Asegúrate de tener iOS 17 instalado en tu iPhone o simulador.


## Instalación

1. Clona el repositorio en tu máquina local.
2. Abre el proyecto en Xcode.
3. Xcode manejará automáticamente las dependencias utilizando Swift Package Manager. No es necesario instalar nada adicional.
4. Selecciona el simulador o dispositivo en el que deseas ejecutar la aplicación.
5. Haz clic en el botón "Run" para compilar y ejecutar la aplicación.


## Condiciones especiales

- Asegúrate de tener conexión a internet, ya que la aplicación realiza consultas a la API de Rick y Morty para obtener los datos.
- La aplicación maneja la paginación de los personajes, por lo que podrás cargar más personajes a medida que te desplaces hacia abajo.
