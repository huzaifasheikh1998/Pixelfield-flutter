// Collection Detail BLoC
import 'dart:convert';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:pixelfield/bloc/collection_details_bloc/collection_detail_event.dart';
import 'package:pixelfield/bloc/collection_details_bloc/collection_detail_state.dart';
import 'package:pixelfield/data/model/collection_data_model/collection_detail_data_model.dart';

class CollectionDetailBloc
    extends Bloc<CollectionDetailEvent, CollectionDetailState> {
  CollectionDetailBloc() : super(CollectionDetailInitial()) {
    on<FetchCollectionDetail>((event, emit) async {
      emit(CollectionDetailLoading());

      // Check internet connection
      var connectivityResult = await Connectivity().checkConnectivity();
      bool isConnected =
          connectivityResult.contains(ConnectivityResult.mobile) ||
              connectivityResult.contains(ConnectivityResult.wifi);

      final box = Hive.box('collectionBox');

      if (isConnected) {
        try {
          // Fetch JSON from assets
          final String response = await rootBundle
              .loadString('assets/mockup_json/collection_details.json');
          final Map<String, dynamic> jsonData = jsonDecode(response);
          final CollectionDetail collectionDetail =
              CollectionDetail.fromJson(jsonData);

          // Store fetched data in Hive for offline access
          box.put('collectionDetail', jsonEncode(jsonData));

          emit(CollectionDetailLoaded(collectionDetail: collectionDetail));
        } catch (e) {
          emit(CollectionDetailError(
              message: "Failed to load collection details"));
        }
      } else {
        // Load data from Hive if offline
        if (box.containsKey('collectionDetail')) {
          final cachedData = jsonDecode(box.get('collectionDetail'));
          final CollectionDetail cachedCollectionDetail =
              CollectionDetail.fromJson(cachedData);
          emit(
              CollectionDetailLoaded(collectionDetail: cachedCollectionDetail));
        } else {
          emit(CollectionDetailError(
              message: "No internet and no offline data available"));
        }
      }
    });

    on<FilterCollection>((event, emit) async {
      final box = Hive.box('collectionBox');

      if (box.containsKey('collectionDetail')) {
        final cachedData = jsonDecode(box.get('collectionDetail'));
        final CollectionDetail cachedCollectionDetail =
            CollectionDetail.fromJson(cachedData);

        // Apply filtering on offline data
        final filteredDetails = cachedCollectionDetail.detail.entries
            .where((entry) =>
                entry.key.toLowerCase().contains(event.keyword.toLowerCase()))
            .toList();

        emit(CollectionDetailFiltered(filteredDetails: filteredDetails));
      } else {
        emit(CollectionDetailError(
            message: "No offline data available for filtering"));
      }
    });
  }
}
