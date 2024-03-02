part of 'recipes_cubit.dart';

class RecipesState {
  final UserModel user;
  final bool isLoading;
  final List<String> listUrl;
  final VideoListController videoController;

  const RecipesState({
    required this.user,
    required this.listUrl,
    required this.isLoading,
    required this.videoController,
  });

  factory RecipesState.init() => RecipesState(
        listUrl: [
          "https://firebasestorage.googleapis.com/v0/b/cafesabor-3ac29.appspot.com/o/videos_cafe%2FEL%20MEJOR%20COCTEL%20CON%20CAFE%20Y%20PUNTO!%20%E2%98%95%EF%B8%8F%20Bartender%20%23shorts.mp4?alt=media&token=f58093e2-7107-4dbb-bff0-491580016beb",
          "https://firebasestorage.googleapis.com/v0/b/cafesabor-3ac29.appspot.com/o/videos_cafe%2FEste%20frappe%20de%20cafe%CC%81%20es%20lo%20u%CC%81nico%20que%20necesitas%20en%20la%20vida%20%E2%98%95%EF%B8%8F%20%23shorts%20_%20La%20Mama%CC%81%20De%20Las%20Recetas.mp4?alt=media&token=17e5731f-265d-4987-835a-ea0706b3210c",
          "https://firebasestorage.googleapis.com/v0/b/cafesabor-3ac29.appspot.com/o/videos_cafe%2FFrappuccino%20de%20Cafe%CC%81%20%23recetasfa%CC%81ciles%20%23cafe%CC%81%20%23shorts.mp4?alt=media&token=3b927378-60ca-45cd-8269-325a4ee865b6",
          "https://firebasestorage.googleapis.com/v0/b/cafesabor-3ac29.appspot.com/o/videos_cafe%2FLLUVIA%20CAFE%CC%81%20Y%20GALLETAS%20%F0%9F%8D%AA%20%23shorts.mp4?alt=media&token=8143d050-b493-4912-bf93-698f200d0888",
          "https://firebasestorage.googleapis.com/v0/b/cafesabor-3ac29.appspot.com/o/videos_cafe%2FTomar%20CAFE%CC%81%20sin%20AZU%CC%81CAR%20SUBE%20el%20AZU%CC%81CAR%20%E2%98%95%EF%B8%8F%F0%9F%A9%B8%23shorts.mp4?alt=media&token=0d695ded-f049-402a-9c47-71dde78f50e1",
          "https://firebasestorage.googleapis.com/v0/b/cafesabor-3ac29.appspot.com/o/videos_cafe%2FVASITO%20DE%20CAFE%CC%81%20COMESTIBLE_%20Hecho%20de%20galletitas%20y%20chocolate%20%23shorts.mp4?alt=media&token=5bfbecde-d309-4eee-8ad8-0a1e428fbdf6",
          "https://firebasestorage.googleapis.com/v0/b/cafesabor-3ac29.appspot.com/o/videos_cafe%2F%F0%9F%98%8D%20Co%CC%81cteles%20con%20CAFE%CC%81%20%E2%98%95%EF%B8%8F%20%23shorts%20%C2%BFy%20tu%CC%81%20favorito_.mp4?alt=media&token=aab8a488-41ff-47b4-b68e-be6ca1afac98",
        ],
        videoController: VideoListController(),
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
        videoController: videoController,
        listUrl: listUrl ?? this.listUrl,
        isLoading: isLoading ?? this.isLoading,
      );
}
