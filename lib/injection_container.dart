// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/features/detail_product/presentation/cubit/detail_product_cubit.dart';
import 'package:cafe_sabor/features/my_products/presentation/cubit/my_products_cubit.dart';
import 'package:cafe_sabor/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:cafe_sabor/features/validate_phone_number/data/data_sources/validate_phone_number_data_source.dart';
import 'package:cafe_sabor/features/validate_phone_number/data/repositories/validate_phone_number_repository_impl.dart';
import 'package:cafe_sabor/features/validate_phone_number/domain/repositories/validate_phone_number_repository.dart';
import 'package:cafe_sabor/features/validate_phone_number/domain/use_case/create_data_user_use_case.dart';
import 'package:cafe_sabor/features/validate_phone_number/domain/use_case/register_with_email_password_use_case.dart';
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
    ..registerFactory<ProfileCubit>(() =>  ProfileCubit())
    ..registerFactory<OnboardCubit>(() => OnboardCubit())
    ..registerFactory<MyProductsCubit>(() => MyProductsCubit())
    ..registerFactory<DetailProductCubit>(() => DetailProductCubit())
    ..registerFactory<RegisterPhoneNumberCubit>(() =>  RegisterPhoneNumberCubit())
    ..registerFactory<ValidatePhoneNumberCubit>(() =>  ValidatePhoneNumberCubit(createDataUserUseCase: sl(), registerWithEmailPasswordUseCase: sl()))
    ..registerFactory<RegisterCreateAccountCubit>(() =>  RegisterCreateAccountCubit())
    ..registerFactory<RegisterPlaceResidenceCubit>(() =>  RegisterPlaceResidenceCubit())

    //user Case
    ..registerFactory<CreateDataUserUseCase>(
      () => CreateDataUserUseCase(validatePhoneNumberRepository: sl()),
    )
    ..registerFactory<RegisterWithEmailPasswordUseCase>(
      () => RegisterWithEmailPasswordUseCase(validatePhoneNumberRepository: sl()),
    )

    //Repository
    ..registerFactory<ValidatePhoneNumberRepository>(
      () => ValidatePhoneNumberRepositoryImpl(validatePhoneNumberDataSource: sl()),
    )
    //Dara source
    ..registerFactory<ValidatePhoneNumberDataSource>(() => ValidatePhoneNumberDataSourceImpl(db: sl(), auth: sl()))
    
    
    
    ..registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance)
    ..registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
}
