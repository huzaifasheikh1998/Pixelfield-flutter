import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixelfield/bloc/collection_bloc/collection_bloc.dart';
import 'package:pixelfield/bloc/collection_bloc/collection_event.dart';
import 'package:pixelfield/bloc/collection_bloc/collection_state.dart';
import 'package:pixelfield/core/components/app_textstyle.dart';
import 'package:pixelfield/core/components/content.dart';
import 'package:pixelfield/core/constants/app_assets.dart';
import 'package:pixelfield/core/constants/app_colors.dart';
import 'package:pixelfield/presentation/dashboard/collection_details_screen.dart';

class CollectionScreen extends StatelessWidget {
  const CollectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CollectionBloc()..add(FetchCollectionItems()),
      child: Scaffold(
        backgroundColor: AppColors.screenBg,
        appBar: AppBar(
          backgroundColor: AppColors.screenBg,
          leadingWidth: 200.w,
          leading: Padding(
            padding: EdgeInsets.only(left: 16.w, top: 3.h),
            child: Content(
              data: "My collection",
              style: AppTextSyle.displayLarge.copyWith(
                fontSize: 32.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          actions: [
            SvgPicture.asset(AppAssets.notificationIcon),
            16.horizontalSpace,
          ],
        ),
        body: BlocBuilder<CollectionBloc, CollectionState>(
          builder: (context, state) {
            if (state is CollectionLoading) {
              return Center(
                child: CircularProgressIndicator(color: AppColors.white),
              );
            } else if (state is CollectionLoaded) {
              return GridView.builder(
                padding: EdgeInsets.all(16.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.62,
                ),
                itemCount: state.items.length,
                itemBuilder: (context, index) {
                  final item = state.items[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CollectionDetailScreen(),
                        ),
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 16.h,
                      ),
                      color: AppColors.cardBg,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Image.network(item.imageUrl, height: 120),
                          ),
                          15.verticalSpace,
                          Content(
                              data: item.name,
                              style: AppTextSyle.displayMedium),
                          5.verticalSpace,
                          Content(
                            data: "(${item.available})",
                            style: AppTextSyle.displayTiny.copyWith(
                              color: AppColors.lightText,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (state is CollectionError) {
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
    );
  }
}
