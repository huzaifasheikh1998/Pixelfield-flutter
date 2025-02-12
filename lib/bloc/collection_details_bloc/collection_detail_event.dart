abstract class CollectionDetailEvent {}

class FetchCollectionDetail extends CollectionDetailEvent {}

class FilterCollection extends CollectionDetailEvent {
  final String keyword;
  FilterCollection({required this.keyword});
}
