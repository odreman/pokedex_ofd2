import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PokemonImageCache extends StatelessWidget {
  //static const Size _cacheMaxSize = Size(700, 700);
  static const String urlImageDefaultError =
      "https://assets.pokemon.com/assets/cms2/img/pokedex/full/10256.png";

  const PokemonImageCache({
    Key? key,
    required this.itemSize,
    required this.imageURL,
  }) : super(key: key);

  final double itemSize;
  final String imageURL;

  @override
  Widget build(BuildContext context) {
    //print(imageURL);
    imageURL.isEmpty ? urlImageDefaultError : imageURL;

    return CachedNetworkImage(
      imageUrl: imageURL,
      width: itemSize,
      height: itemSize,
      //useOldImageOnUrlChange: true,
      //maxWidthDiskCache: _cacheMaxSize.width.toInt(),
      //maxHeightDiskCache: _cacheMaxSize.height.toInt(),
      fadeInDuration: const Duration(milliseconds: 120),
      fadeOutDuration: const Duration(milliseconds: 120),
      fit: BoxFit.cover,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      errorWidget: (context, url, error) =>
          const Icon(Icons.warning_amber_sharp),
    );
  }
}
