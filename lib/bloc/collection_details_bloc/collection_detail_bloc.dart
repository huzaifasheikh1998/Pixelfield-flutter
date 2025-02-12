// Collection Detail BLoC
import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pixelfield/bloc/collection_details_bloc/collection_detail_event.dart';
import 'package:pixelfield/bloc/collection_details_bloc/collection_detail_state.dart';
import 'package:pixelfield/data/model/collection_data_model/collection_detail_data_model.dart';

class CollectionDetailBloc
    extends Bloc<CollectionDetailEvent, CollectionDetailState> {
  CollectionDetailBloc() : super(CollectionDetailInitial()) {
    on<FetchCollectionDetail>((event, emit) async {
      emit(CollectionDetailLoading());
      await Future.delayed(Duration(seconds: 2)); // Simulating API call
      try {
        final String response = await rootBundle
            .loadString('assets/mockup_json/collection_details.json');
        final Map<String, dynamic> jsonData = jsonDecode(response);
        final CollectionDetail collectionDetail =
            CollectionDetail.fromJson(jsonData);
        emit(CollectionDetailLoaded(collectionDetail: collectionDetail));
      } catch (e) {
        emit(CollectionDetailError(
            message: "Failed to load collection details"));
      }
    });
  }
}
