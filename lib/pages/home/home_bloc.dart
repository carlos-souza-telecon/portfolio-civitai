import 'package:portfolio/pages/home/home_api.dart';
import 'package:portfolio/pages/home/models/civitai_images.dart';
import 'package:portfolio/utils/bloc_response.dart';
import 'package:portfolio/utils/simple_bloc.dart';

class HomeBloc extends SimpleBloc<BlocResponse?> {
  Future<CivitaiImages?> fetchImagesByUsername() async {
    try {
      add(BlocResponse(loading: true));
      String username = 'RiqueRS';
      var result = await HomeApi.fetchImagesByUsername(username);
      if (result == null) {
        addError('Não foi possível consultar. Verifique a conexão!');
        return null;
      } else {
        add(BlocResponse(
          response: result,
          loading: false,
        ));
        return result;
      }
    } catch (e) {
      addError(e.toString());
      return null;
    }
  }
}
