import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pixelfield/bloc/collection_details_bloc/collection_detail_bloc.dart';
import 'package:pixelfield/bloc/collection_details_bloc/collection_detail_event.dart';
import 'package:pixelfield/bloc/collection_details_bloc/collection_detail_state.dart';
import 'package:pixelfield/core/components/app_textstyle.dart';
import 'package:pixelfield/core/components/content.dart';
import 'package:pixelfield/core/constants/app_assets.dart';
import 'package:pixelfield/core/constants/app_colors.dart';

class CollectionDetailScreen extends StatefulWidget {
  const CollectionDetailScreen({super.key});

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  int selectedTab = 0; // 0: Details, 1: Tasting Notes, 2: History

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionDetailBloc()..add(FetchCollectionDetail()),
      child: Container(
        height: 1.sh,
        width: 1.sw,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.screenBg),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          body: BlocBuilder<CollectionDetailBloc, CollectionDetailState>(
            builder: (context, state) {
              if (state is CollectionDetailLoading) {
                return Center(
                    child: CircularProgressIndicator(color: AppColors.white));
              } else if (state is CollectionDetailLoaded) {
                final collectionDetail = state.collectionDetail;
                return Column(
                  children: [
                    Image.network(collectionDetail.imageUrl, height: 400),
                    Text(collectionDetail.name, style: TextStyle(fontSize: 24)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextButton(
                          onPressed: () => setState(() => selectedTab = 0),
                          child: Text("Details"),
                        ),
                        TextButton(
                          onPressed: () => setState(() => selectedTab = 1),
                          child: Text("Tasting Notes"),
                        ),
                        TextButton(
                          onPressed: () => setState(() => selectedTab = 2),
                          child: Text("History"),
                        ),
                      ],
                    ),
                    Expanded(
                      child: selectedTab == 0
                          ? ListView(
                              children: collectionDetail.detail.entries
                                  .map((entry) => Row(
                                        children: [
                                          Text(entry.key),
                                          Text(entry.value)
                                        ],
                                      ))
                                  .toList(),
                            )
                          : selectedTab == 1
                              ? ListView(
                                  children:
                                      collectionDetail.tastingNotes.entries
                                          .map((entry) => ListTile(
                                                title: Text(entry.key),
                                                subtitle: Text(entry.value),
                                              ))
                                          .toList(),
                                )
                              : Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Text(collectionDetail.history),
                                ),
                    ),
                  ],
                );
              } else if (state is CollectionDetailError) {
                return Center(
                    child: Content(
                  data: state.message,
                  style: AppTextSyle.displayMedium,
                ));
              }
              return Center(
                  child: Content(
                data: "No Data Available",
                style: AppTextSyle.displayMedium,
              ));
            },
          ),
        ),
      ),
    );
  }
}
