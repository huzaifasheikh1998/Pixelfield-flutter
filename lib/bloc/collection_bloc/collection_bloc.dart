import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:convert';

import 'package:pixelfield/bloc/collection_bloc/collection_event.dart';
import 'package:pixelfield/bloc/collection_bloc/collection_state.dart';
import 'package:pixelfield/data/model/collection_data_model/collection_data_model.dart';

class CollectionBloc extends Bloc<CollectionEvent, CollectionState> {
  CollectionBloc() : super(CollectionInitial()) {
    on<FetchCollectionItems>((event, emit) async {
      emit(CollectionLoading());
      await Future.delayed(Duration(seconds: 2)); // Simulating API delay
      try {
        final String response =
            await rootBundle.loadString('assets/mockup_json/collection.json');
        final List<dynamic> jsonList = jsonDecode(response);
        final List<CollectionItem> items =
            jsonList.map((json) => CollectionItem.fromJson(json)).toList();
        emit(CollectionLoaded(items: items));
      } catch (e) {
        emit(CollectionError(message: "Failed to load collection"));
      }
    });
  }
}
