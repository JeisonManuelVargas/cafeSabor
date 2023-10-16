// ignore_for_file: depend_on_referenced_packages

import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cafe_sabor/features/home/presentation/cubit/home_cubit.dart';
import 'package:cafe_sabor/features/onboard/presentation/cubit/onboard_cubit.dart';
import 'package:cafe_sabor/features/register_phone_number/presentation/cubit/register_phone_number_cubit.dart';
import 'package:cafe_sabor/features/validate_phone_number/presentation/cubit/validate_phone_number_cubit.dart';
import 'package:cafe_sabor/features/register_create_account/presentation/cubit/register_create_account_cubit.dart';
import 'package:cafe_sabor/features/register_place_residence/presentation/cubit/register_place_residence_cubit.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl

    //cubit
    ..registerFactory<HomeCubit>(() => HomeCubit())
    ..registerFactory<OnboardCubit>(() => OnboardCubit())
    ..registerFactory<RegisterPhoneNumberCubit>(() =>  RegisterPhoneNumberCubit())
    ..registerFactory<ValidatePhoneNumberCubit>(() =>  ValidatePhoneNumberCubit())
    ..registerFactory<RegisterCreateAccountCubit>(() =>  RegisterCreateAccountCubit())
    ..registerFactory<RegisterPlaceResidenceCubit>(() =>  RegisterPlaceResidenceCubit())

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
