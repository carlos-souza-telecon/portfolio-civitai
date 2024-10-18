import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:portfolio/pages/home/home_bloc.dart';
import 'package:portfolio/pages/home/models/civitai_images.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc _homeBloc = HomeBloc();

  @override
  initState() {
    super.initState();
    _homeBloc.fetchImagesByUsername();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text('Civitai Images'),
            floating: true,
            pinned: true,
            snap: true,
            bottom: AppBar(
              title: const Text('Civitai Images'),
              actions: [
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: () {
                    _homeBloc.fetchImagesByUsername();
                  },
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed([
              StreamBuilder(
                stream: _homeBloc.stream,
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 0,
                        bottom: 8,
                      ),
                      child: Text('${snapshot.error}'),
                    );
                  }
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Column(
                        children: [
                          LinearProgressIndicator(),
                        ],
                      ),
                    );
                  } else {
                    var response = snapshot.data!;
                    if (response.loading) {
                      return const Center(
                        child: Column(
                          children: [
                            LinearProgressIndicator(),
                          ],
                        ),
                      );
                    }
                    //var resposta = response.response;
                    return civitaiImagesGrid(
                        response.response as CivitaiImages);
                  }
                },
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget civitaiImagesGrid(CivitaiImages civitaiImages) {
    var images = <Widget>[];
    var largura = MediaQuery.of(context).size.width;
    var altura = MediaQuery.of(context).size.height;
    var colunas = defaultTargetPlatform == TargetPlatform.iOS
        ? 1
        : largura > altura
            ? 3
            : 1;

    for (var image in civitaiImages.items!) {
      images.add(
        Card(
          clipBehavior: Clip.hardEdge,
          elevation: 0.8,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4.0),
          ),
          //color: Colors.white,
          child: Material(
            child: InkWell(
              onTap: () => _imageCardClicked(image),
              child: Column(
                children: [
                  Image.network(
                    image.url!,
                    // width: (largura / 1.2) - 16,
                    // height: (altura / 1.2) - 16,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress != null &&
                          loadingProgress.cumulativeBytesLoaded <
                              loadingProgress.expectedTotalBytes!) {
                        return const AspectRatio(
                          aspectRatio: 1,
                          child: Center(
                            child: CircularProgressIndicator(),
                          ),
                        );
                      }
                      return child;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.comment,
                          color: Colors.blue,
                          size: 15,
                        ),
                        Text(
                          ' ${image.stats!.commentCount!} ',
                        ),
                        const Icon(
                          Icons.thumb_up_sharp,
                          color: Colors.indigo,
                          size: 15,
                        ),
                        Text(
                          ' ${image.stats!.likeCount!} ',
                        ),
                        const Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 15,
                        ),
                        Text(
                          ' ${image.stats!.heartCount!} ',
                        ),
                        const Icon(
                          Icons.theater_comedy,
                          color: Colors.orange,
                          size: 15,
                        ),
                        Text(
                          ' ${image.stats!.laughCount!} ',
                        ),
                        const Icon(
                          Icons.water_drop,
                          color: Colors.lightBlue,
                          size: 15,
                        ),
                        Text(
                          ' ${image.stats!.cryCount!}',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    StaggeredGrid imagesList = StaggeredGrid.count(
      crossAxisCount: colunas,
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      //controller: _scrollController,
      //shrinkWrap: true,
      //padding: const EdgeInsets.all(8),
      children: images,
    );
    return imagesList;
  }

  _imageCardClicked(Items image) {
    showDialog(
      context: context,
      //code to make the modal bottom sheet full screen

      builder: (context) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(0),
            ),
          ),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.network(
                  image.url!,
                  fit: BoxFit.cover,
                  width: double.maxFinite,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('${image.meta!.prompt}'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
