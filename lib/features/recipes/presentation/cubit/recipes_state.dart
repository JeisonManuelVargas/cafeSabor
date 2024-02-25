part of 'recipes_cubit.dart';

class RecipesState {
  final UserModel user;
  final bool isLoading;
  final List<String> listUrl;

  const RecipesState({
    required this.user,
    required this.listUrl,
    required this.isLoading,
  });

  factory RecipesState.init() => RecipesState(
        listUrl: [
          'https://firebasestorage.googleapis.com/v0/b/flutterfirebaseprueba.appspot.com/o/videos_tiktok%2F4TH%20Dog%20Gangster%20%23dogs%20%23dogsports%20%23flyball.mp4?alt=media&token=333f3ac9-50f3-45a8-b15b-714208a6c6b1',
          'https://firebasestorage.googleapis.com/v0/b/flutterfirebaseprueba.appspot.com/o/videos_tiktok%2FBala%20VS%20100%20metros%20de%20nieve%20%F0%9F%98%B1%20%23shorts.mp4?alt=media&token=0e09a7d0-1df3-4e2a-a1d1-418bb535f222',
          'https://firebasestorage.googleapis.com/v0/b/flutterfirebaseprueba.appspot.com/o/videos_tiktok_fullhd%2Fy2meta.net_1080p-full-hd-1080p-asus-zenfone-display-demo-video-portrait-mode.mp4?alt=media&token=0aeb3319-2055-4f84-a1f7-03d9684b3708',
          'https://firebasestorage.googleapis.com/v0/b/flutterfirebaseprueba.appspot.com/o/videos_tiktok%2FEl%20Mordisco%20del%20Caima%CC%81n%20Estuvo%20Tan%20Cerca.mp4?alt=media&token=0c79e933-0a87-4c4e-95a4-e7d80fae7aa5',
          'https://firebasestorage.googleapis.com/v0/b/flutterfirebaseprueba.appspot.com/o/videos_tiktok%2FEste%20fue%20mi%20primer%20video%20viral%F0%9F%A5%B9%F0%9F%99%8C%F0%9F%8F%BC%F0%9F%A4%AF.mp4?alt=media&token=704e0b24-8d7e-4211-80b1-3a6bc8940564',
          'https://firebasestorage.googleapis.com/v0/b/flutterfirebaseprueba.appspot.com/o/videos_tiktok%2FE%CC%81l%20no%20esperaba%20eso...%20%23parkour%20%23acrobacia%20%23comedia%20%23humor.mp4?alt=media&token=ab76c638-434d-46ab-829c-74ce2eb8bd7c',
          'https://firebasestorage.googleapis.com/v0/b/flutterfirebaseprueba.appspot.com/o/videos_tiktok%2FLAMBORGHINI%20VS%20MONSTER%20Humor%20%23shorts%20%23lambo.mp4?alt=media&token=26334ed5-59fc-49f2-841f-e55ef1c2e191',
          'https://firebasestorage.googleapis.com/v0/b/flutterfirebaseprueba.appspot.com/o/videos_tiktok%2FLAS%20TRAMPAS%20mas%20EFECTIVAS%20%23guerra%20de%20%23vietnam%20Y%20QUE%20DEBES%20CONOCER%20%20%23donferetv%20%23parati.mp4?alt=media&token=214c54c0-deee-49ec-93ef-42d3833dcf9a',
          'https://firebasestorage.googleapis.com/v0/b/flutterfirebaseprueba.appspot.com/o/videos_tiktok%2FNunca%20tires%20Basura%20en%20un%20Volca%CC%81n%E2%9D%97%23shorts%20%23naturaleza.mp4?alt=media&token=53fb8db1-feba-4f33-8a4e-ebebfeebad49',
          'https://firebasestorage.googleapis.com/v0/b/flutterfirebaseprueba.appspot.com/o/videos_tiktok%2FTOP%20SPEED%20Z%20H2%20%F0%9F%94%A5%F0%9F%94%A5%F0%9F%94%A5%20STOCK%20_ORIGINAL_.mp4?alt=media&token=d8a13f51-9fdf-4d20-9fc8-b084feb2a803',
          'https://firebasestorage.googleapis.com/v0/b/flutterfirebaseprueba.appspot.com/o/videos_tiktok%2FUn%20ladro%CC%81n%20entra%20a%20ROBAR%20en%20una%20Apple%20Store%20y%20asi%CC%81%20reaccionan%20los%20empleados%E2%80%A6.mp4?alt=media&token=228b5267-ee0c-4fd3-95ea-37421de4c78a',
          'https://firebasestorage.googleapis.com/v0/b/flutterfirebaseprueba.appspot.com/o/videos_tiktok%2Fvideoplayback.mp4?alt=media&token=d634a8ba-9970-4578-9d26-a52b1905bc48',
        ],
        isLoading: false,
        user: UserModel.init(),
      );

  RecipesState copyWith({
    bool? isLoading,
    UserModel? user,
    List<String>? listUrl,
  }) =>
      RecipesState(
        user: user ?? this.user,
        listUrl: listUrl ?? this.listUrl,
        isLoading: isLoading ?? this.isLoading,
      );
}
