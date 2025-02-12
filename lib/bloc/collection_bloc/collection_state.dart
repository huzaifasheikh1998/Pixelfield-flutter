import 'package:pixelfield/data/model/collection_data_model/collection_data_model.dart';

abstract class CollectionState {}

class CollectionInitial extends CollectionState {}

class CollectionLoading extends CollectionState {}

class CollectionLoaded extends CollectionState {
  final List<CollectionItem> items;
  CollectionLoaded({required this.items});
}

class CollectionError extends CollectionState {
  final String message;
  CollectionError({required this.message});
}
