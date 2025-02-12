import 'package:pixelfield/data/model/collection_data_model/collection_detail_data_model.dart';

abstract class CollectionDetailState {}

class CollectionDetailInitial extends CollectionDetailState {}

class CollectionDetailLoading extends CollectionDetailState {}

class CollectionDetailLoaded extends CollectionDetailState {
  final CollectionDetail collectionDetail;
  CollectionDetailLoaded({required this.collectionDetail});
}

class CollectionDetailError extends CollectionDetailState {
  final String message;
  CollectionDetailError({required this.message});
}
