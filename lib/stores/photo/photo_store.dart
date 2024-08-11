import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shopliax_assesement/services/api_service.dart';
import '../../models/photo/photo.dart';

part 'photo_store.g.dart';

class PhotoStore = _PhotoStore with _$PhotoStore;

abstract class _PhotoStore with Store {
  final ApiService _apiService = ApiService();
  final Connectivity _connectivity = Connectivity();

  _PhotoStore() {
    // Load local photos when the store is initialized
    _loadLocalPhotos().then((localPhotos) {
      if (localPhotos.isNotEmpty) {
        photos = ObservableList.of(localPhotos);
      }
    });
  }

  @observable
  ObservableList<Photo> photos = ObservableList<Photo>();

  @observable
  bool isLoading = false;

  @observable
  String? error;

  @action
  Future<void> fetchPhotos() async {
    isLoading = true;
    error = null;

    // Check for internet connectivity
    var connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult.contains(ConnectivityResult.none)) {
      // No internet connection, load local photos
      final localPhotos = await _loadLocalPhotos();
      if (localPhotos.isNotEmpty) {
        photos = ObservableList.of(localPhotos);
        error = 'No internet connection. Showing saved photos.';
      } else {
        error =
            'No internet connection and no saved photos. Please connect to the internet and try again.';
      }
      isLoading = false;
      return;
    }

    try {
      final fetchedPhotos = await _apiService.fetchPhotos();
      photos = ObservableList.of(fetchedPhotos.take(20));
      await _savePhotosLocally(photos);
    } catch (e) {
      error = 'Failed to fetch photos. Showing saved photos.';
      final localPhotos = await _loadLocalPhotos();
      if (localPhotos.isNotEmpty) {
        photos = ObservableList.of(localPhotos);
      } else {
        error = 'Failed to fetch photos and no saved photos available.';
      }
    } finally {
      isLoading = false;
    }
  }

  Future<void> _savePhotosLocally(List<Photo> photos) async {
    final prefs = await SharedPreferences.getInstance();
    final photosJson = photos.map((p) => p.toJson()).toList();
    await prefs.setString('local_photos', json.encode(photosJson));
  }

  Future<List<Photo>> _loadLocalPhotos() async {
    final prefs = await SharedPreferences.getInstance();
    final photosJson = prefs.getString('local_photos');
    if (photosJson != null) {
      final List<dynamic> decodedPhotos = json.decode(photosJson);
      return decodedPhotos.map((json) => Photo.fromJson(json)).toList();
    }
    return [];
  }
}
