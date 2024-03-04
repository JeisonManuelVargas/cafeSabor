import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:cafe_sabor/core/errors/failure.dart';
import 'package:cafe_sabor/core/base/base_usecase.dart';
import 'package:cafe_sabor/features/profile/domain/repositories/profile_auth_repository.dart';

class SaveImageUseCase extends BaseUseCase<String, File> {
  SaveImageUseCase({required this.profileRepository});

  final ProfileRepository profileRepository;

  @override
  Future<Either<Failure, String>> call(File params) => profileRepository.saveImage(params);
}
