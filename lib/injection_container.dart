import 'package:cafe_sabor/features/home/presentation/cubit/home_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
final sl = GetIt.instance;

Future<void> init() async {
  sl

    //cubit
    ..registerFactory<HomeCubit>(() => HomeCubit())

    //user Case
    /*..registerFactory<GetMovieListUseCase>(
      () => GetMovieListUseCase(homeRepository: sl()),
    )*/

    //Repository
    /*..registerFactory<HomeRepository>(
      () => HomeRepositoryImpl(homeDataSource: sl()),
    )
    ..registerFactory<DetailMovieRepository>(
      () => DetailMovieRepositoryImpl(detailMovieDataSource: sl()),
    )*/
    //Dara source
    /*..registerFactory<HomeDataSource>(() => HomeDataSourceImpl(db: sl()))
    ..registerFactory<DetailMovieDataSource>(() => DetailMovieDataSourceImpl(db: sl()))*/
    
    
    
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance)
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
}
