import 'package:social_boticario/app/core/utils/custom/either.dart';
import '../../domain/entities/connection_entity.dart';
import '../../domain/errors/errors.dart';
import '../../domain/services/connectivity_service.dart';
import '../drivers/connectivity_driver.dart';

class ConnectivityService implements IConnectivityService {
  final IConnectivityDriver driver;

  ConnectivityService(this.driver);
  @override
  Future<CustomEither<IConnectionFailure, bool>> isOnline() async {
    try {
      var check = await driver.isOnline;
      if (check) {
        return SuccessResponse(true);
      }
      throw ConnectionError('Você está offline');
    } on IConnectionFailure catch (e) {
      return FailureResponse(e);
    } catch (e) {
      return FailureResponse(ConnectionError(
        'Erro ao tentar verificar a conexão $e',
      ));
    }
  }

  @override
  Future<CustomEither<IConnectionFailure, Stream<ConnectionEntity>>> listenConnection() async {
    try {
      return SuccessResponse(await driver.listenConnection());
    } on IConnectionFailure catch (e) {
      return FailureResponse(e);
    } catch (e) {
      return FailureResponse(ConnectionError(
        'Erro ao tentar verificar a conexão $e',
      ));
    }
  }

  @override
  Future<CustomEither<IConnectionFailure, ConnectionEntity>> checkConnectionType() async {
    try {
      return SuccessResponse(await driver.checkConnectionType());
    } on IConnectionFailure catch (e) {
      return FailureResponse(e);
    } catch (e) {
      return FailureResponse(ConnectionError(
        'Erro ao tentar verificar a conexão $e',
      ));
    }
  }
}
