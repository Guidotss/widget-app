import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class InfiniteScrollScreen extends StatefulWidget {
  const InfiniteScrollScreen({super.key});

  static const String name = 'infinite_scroll_screen';

  @override
  State<InfiniteScrollScreen> createState() => _InfiniteScrollScreenState();
}

class _InfiniteScrollScreenState extends State<InfiniteScrollScreen> {
  List<int> imagesIds = [1, 2, 3, 4, 5];
  final ScrollController scrollController = ScrollController();
  bool isLoading = false;

  void addFiveImages() {
    final lastId = imagesIds.last;
    imagesIds.addAll([1, 2, 3, 4, 5].map((e) => lastId + e).toList());
  }

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      //scrollController.position.pixels => current position
      //scrollController.position.maxScrollExtent => max position

      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        //add 5 images
        loadNextPage();
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  Future loadNextPage() async {
    if (isLoading) return;
    isLoading = true;

    setState(() {});
    await Future.delayed(const Duration(seconds: 2));

    addFiveImages();
    isLoading = false;

    if (!mounted) return;
    setState(() {});

    moveScrollToBottom();
  }

  void moveScrollToBottom() {
    if (scrollController.position.pixels + 150 <=
        scrollController.position.maxScrollExtent) return;

    scrollController.animateTo(
      scrollController.position.pixels + 120,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 300),
    );
  }

  Future<void> onRefresh() async {
    isLoading = true;
    setState(() {});

    await Future.delayed(const Duration(seconds: 2));
    if (!mounted) return;

    isLoading = false;
    final lastId = imagesIds.last;

    imagesIds.clear();
    imagesIds.add(lastId + 1);

    addFiveImages();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: RefreshIndicator(
          edgeOffset: 10,
          strokeWidth: 2,
          onRefresh: onRefresh,
          child: ListView.builder(
            controller: scrollController,
            itemCount: imagesIds.length,
            itemBuilder: (context, index) {
              return FadeInImage(
                width: double.infinity,
                fit: BoxFit.cover,
                height: 300,
                placeholder: const AssetImage('assets/images/jar-loading.gif'),
                image: NetworkImage(
                    'https://picsum.photos/id/${imagesIds[index]}/500/300'),
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pop(),
        child: isLoading
            ? SpinPerfect(
                infinite: true, child: const Icon(Icons.refresh_rounded))
            : FadeIn(child: const Icon(Icons.arrow_back_rounded)),
      ),
    );
  }
}
