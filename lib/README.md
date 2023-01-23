# Pokedex OFD

Se trata de una Pokedex desarrollada en Flutter y Dart haciendo uso de la api oficial de pokemon PokeApi.

## Paginas

-Splash de loading
-Home 
    -Tarjetas de tipo Swiper de pokemons con su información básica: sprite, tipo, nombre e identificador, cada tarjeta toma un color acorde al tipo de pokemon. Al hacer clic se navega al detalle de pokemon.
    -Botón para ver todos los pokemon (lleva a la pantalla de lista de pokemon).
    -Botón para ver todos los ítems pokemon (lleva a la pantalla de lista de ítems).
    -Slider horizontal de ítems con scroll y paginado. Cada tarjeta muestra, sprite del ítem, nombre del ítem, identificador  y categoría del item. Al hacer clic se navega al detalle del ítem.
    -Botón para ver todos los Berries pokemon (lleva a la pantalla de lista de berries).
    -Slider horizontal de berries con scroll y paginado. Cada tarjeta muestra, sprite del berry, nombre del berry e identificador. Al hacer clic se navega al detalle de berry.

-Pokedex (lista de pokemon)
    -Muestra un grid de pokemons de 2xX. Internamente tiene una Tarjeta de pokemon, mostrando la misma información disponible en el swiper. Implementa un slivergrid con scroll y paginado. Al hacer clic, lleva al detalle del pokemon seleccionado.

-Ítems (lista de ítems)
    -Muestra un grid de items de 2xX. Internamente tiene una Tarjeta de item, mostrando la misma información disponible en el slider horizontal del home. Implementa un slivergrid con scroll y paginado. Al hacer clic, lleva al detalle del item seleccionado.

-Berries (lista de items)
    -Muestra un grid de items de 3xX. Internamente tiene una Tarjeta de berry, mostrando la misma información disponible en el slider horizontal del home. Implementa un slivergrid con scroll y paginado. Al hacer clic, lleva al detalle del berry seleccionado.

-Detalle de pokemon: Muestra información del pokemon consultado.
    -About: Card de Descripción del pokemon en sus diferentes versiones. Implementa un slider horizontal.
    -General: Card de información de tamaño y peso del pokemon.
    -Base stats: Card de estadísticas del pokemon.
    -Breeding: card de tipo de huevo del pokemon.
    -Evolution family: Card con familia de evolución básica del pokemon.
    -Sprites: Card de sprites, implementa un slider horizontal.
    -Movement: Lista de card con los movimientos que puede llegar a realizar el pokemon. Implementa un slider horizontal. Al hacer clic, lleva al detalle del movimiento.

-Detalle del Berry: Muestra la información del berry.

-Detalle del Ítem: Muestra la información del ítem.

-Detalle del movimiento: Muestra la información del movimiento.

-About: Muestra información del pokemon es cada versión donde está presente.

### Widgets
1.Berries-Grid
-berry_grid_card_contents.dart
-berry_grid_card.Dart
-berry_grid.dart

2.Berries-slider
-berry_slider_card_data.dart
-berry_slider_card.dart
-berry_slider.dart.dart

3.BerryDetails
-berry_details_contents.dart
-berry_screen_app_bar.dart

4.Berries-generales
-Berry_flavor_type
-generations.dart

5.Items-Grid
-Items_grid_card_contents.dart
-Items_grid_card.Dart
-Item_grid.dart

6.Items-slider
-Items_slider_card_contents.dart
-Items_slider_card.dart
-Items_slider.dart

7.ItemsDetails
-Items_details_contents.dart
-Items_screen_app_bar.dart

8.Berries-generales
-Item_category.dart

9.Movement
-move_card_data.dart
-move_deails_app_bar.dart
-move_details_contents.dart

10.Pokemon-grid
-pokemon_grid_card_contents.dart
-pokemon_grid_card.dartpokemon_grid.dart

11.Pokemon-swiper
-pokemon_swiper_card.dart
-pokemon_swiper.dart

12.Pokemon-otros
-pokemon_screen_app_bar.dart
-pokemon_sprites_card.dart

13.Pokemon Details
-details_contents.dart
-details_header.dart
-pokeball_decorations.dart
-about_slider.dart
-box_decoration.dart
-pokeball_decorations.dart

14.Pokemon Details Card
-card_about.dart
-card_breeding.dart
-card_evolution.dart
-card_general_info.dartcard_stats.dart
-pokemon_sprites_card_data.dart

15.generales
Varios archivos

16.Utis
Varios archivos

17.Models
-pokemon_berry_details.dart
-pokemon_berrys_response.dart
_pokemon_details.dart
-pokemon_evolution_chain.dart
-pokemon_items_details.dart
-pokemon_items_response.dart
-pokemon_move_details.dart
-pokemon_move_response.dart
-pokemon_species.dart
-pokemon.dart
-pokemons_response.dart

18.Provider
-pokedex_provider.dart

### Api Pokemon

Toda la información se consulta de la api oficial de pokemon. Para ello se utiliza Dio e implementa cache de peticiones http para disminuir el tráfico de red.

### Imágenes

Todas las imágenes se consumen de la api, por lo que también se implementa un cache de imágenes para disminuir el tráfico.

## Dependencies 

- cupertino_icons
- card_swiper
- provider
- cached_network_image
- sliding_up_panel
- animate_do
- dio_http_cache
- dio
- shimmer

## Animaciones

-Hero en las imágenes
-Fade en las imágenes
-Loading personalizados
-Shimmer en las pantallas que observé que se tardaban más en cargar.
-Animación en los textos en las páginas de detalle.
-Loading para las estadísticas del pokemon
-Textos numéricos en la pantalla de detalle de pokemon para las estadísticas del pokemon.

## Pruebas realizadas

-Dispositivos físicos: iphone 8. 
-Dispositivos virtuales: Iphone SE, Iphone 14 y 14Pro

Se tomaron en consideración estas dimensiones para los layouts en sus mínimos y máximos. 

