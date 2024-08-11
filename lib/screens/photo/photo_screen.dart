import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:shopliax_assesement/stores/photo/photo_store.dart';
import 'package:shopliax_assesement/themes.dart/colors.dart';

class PhotoScreen extends StatefulWidget {
  @override
  State<PhotoScreen> createState() => _PhotoScreenState();
}

class _PhotoScreenState extends State<PhotoScreen> {
  final GlobalKey<SliverAnimatedListState> _listKey =
      GlobalKey<SliverAnimatedListState>();
  List<dynamic> _displayedItems = [];
  final Connectivity _connectivity = Connectivity();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadPhotos();
    });
  }

  Future<void> _loadPhotos() async {
    final photoStore = Provider.of<PhotoStore>(context, listen: false);
    await photoStore.fetchPhotos();
    _addItemsToList();
  }

  void _addItemsToList() {
    final photoStore = Provider.of<PhotoStore>(context, listen: false);
    _displayedItems.clear();
    _listKey.currentState
        ?.removeAllItems((_, animation) => const SizedBox.shrink());

    Future.forEach(photoStore.photos.asMap().entries,
        (MapEntry<int, dynamic> entry) async {
      await Future.delayed(const Duration(milliseconds: 100));
      _listKey.currentState?.insertItem(entry.key);
      _displayedItems.add(entry.value);
    });
  }

  @override
  Widget build(BuildContext context) {
    final photoStore = Provider.of<PhotoStore>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Photos',
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ShopliaxColors.textsColor,
              ),
        ),
      ),
      body: Observer(
        builder: (_) {
          if (photoStore.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              var connectivityResult = await _connectivity.checkConnectivity();
              if (connectivityResult.contains(ConnectivityResult.none)) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content:
                          Text('No internet connection. Showing saved photos.'),
                    ),
                  );
                }
              }
              await _loadPhotos();
            },
            child: CustomScrollView(
              slivers: [
                if (photoStore.error != null)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        photoStore.error!,
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: Colors.red,
                            ),
                      ),
                    ),
                  ),
                if (photoStore.photos.isEmpty)
                  SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'No photos available. Pull to refresh when online.',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              color: ShopliaxColors.textsColor,
                            ),
                      ),
                    ),
                  )
                else
                  SliverAnimatedList(
                    key: _listKey,
                    initialItemCount: _displayedItems.length,
                    itemBuilder: (context, index, animation) {
                      return _buildAnimatedItem(context, index, animation);
                    },
                  ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedItem(
      BuildContext context, int index, Animation<double> animation) {
    final photo = _displayedItems[index];
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1, 0),
        end: Offset.zero,
      ).animate(animation),
      child: FadeTransition(
        opacity: animation,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
          child: Material(
            elevation: 4,
            child: ListTile(
              contentPadding: const EdgeInsets.all(8),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  photo.thumbnailUrl,
                  width: 50,
                  height: 50,
                  errorBuilder: (context, error, stackTrace) =>
                      const Icon(Icons.error),
                ),
              ),
              title: Text(
                photo.title,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: ShopliaxColors.textsColor,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
