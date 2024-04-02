import 'package:flutter/material.dart';
import 'package:flutter_error_handling/application/usecases/no_connection_usecase.dart';
import 'package:flutter_error_handling/application/usecases/not_found_error_usecase.dart';
import 'package:flutter_error_handling/presentation/presentation.dart';
import 'package:flutter_error_handling/presentation/ui/ui.dart';

import '../../usecase/make_remote_authentication_usecase.dart';

Widget makeHomePage() => HomePage(
      presenter: HomePagePresenterImpl(
        authenticationUsecase: makeRemoteAuthenticationUsecase(),
        noConnectionUsecase: NoConnectionUsecase(url: 'aaaa'),
        notFoundErrorUsecase: NotFoundErrorUsecase(url: 'aaaa'),
      ),
    );
