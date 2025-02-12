import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pixelfield/bloc/collection_details_bloc/collection_detail_bloc.dart';
import 'package:pixelfield/bloc/collection_details_bloc/collection_detail_event.dart';
import 'package:pixelfield/bloc/collection_details_bloc/collection_detail_state.dart';
import 'package:pixelfield/core/components/app_textstyle.dart';
import 'package:pixelfield/core/components/buttons/primary_button.dart';
import 'package:pixelfield/core/components/content.dart';
import 'package:pixelfield/core/constants/app_assets.dart';
import 'package:pixelfield/core/constants/app_colors.dart';

class CollectionDetailScreen extends StatefulWidget {
  const CollectionDetailScreen({super.key});

  @override
  State<CollectionDetailScreen> createState() => _CollectionDetailScreenState();
}

class _CollectionDetailScreenState extends State<CollectionDetailScreen> {
  int selectedTab = 0;
  int _currentStep = 0;

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
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 8.w, vertical: 4.h),
                              color: AppColors.card,
                              child: Content(
                                data: "Genesis Collection",
                                style: AppTextSyle.displaySmall,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: SvgPicture.asset(AppAssets.cancelBtnIcon),
                            ),
                          ],
                        ),
                        24.verticalSpace,
                        Container(
                          padding: EdgeInsets.all(8.r),
                          color: AppColors.card,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Image.asset(AppAssets.gearIcon),
                                  8.horizontalSpace,
                                  Content(
                                    data: "Genuine Bottle (Unopened)",
                                    style: AppTextSyle.displaySmall.copyWith(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 25.r,
                                color: AppColors.primary,
                              ),
                            ],
                          ),
                        ),
                        13.verticalSpace,
                      ],
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child:
                      BlocBuilder<CollectionDetailBloc, CollectionDetailState>(
                    builder: (context, state) {
                      if (state is CollectionDetailLoading) {
                        return Center(
                            child: CircularProgressIndicator(
                                color: AppColors.white));
                      } else if (state is CollectionDetailLoaded) {
                        final collectionDetail = state.collectionDetail;
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            children: [
                              Image.network(collectionDetail.imageUrl),
                              13.verticalSpace,
                              Container(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 16.w,
                                  vertical: 10.h,
                                ),
                                color: AppColors.cardBg,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Content(
                                      data: "Bottle 135/184",
                                      style: AppTextSyle.displaySmall.copyWith(
                                        color: AppColors.lightText,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Content(
                                          data: collectionDetail.name,
                                          style:
                                              AppTextSyle.displayLarge.copyWith(
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        4.horizontalSpace,
                                        Content(
                                          data: collectionDetail.old,
                                          style:
                                              AppTextSyle.displayLarge.copyWith(
                                            color: AppColors.primary,
                                            fontSize: 32.sp,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Content(
                                      data: "#${collectionDetail.id}",
                                      style: AppTextSyle.displayLarge.copyWith(
                                        fontSize: 32.sp,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    24.verticalSpace,
                                    Container(
                                      height: 40.h,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.r),
                                        color: AppColors.card,
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() => selectedTab = 0);
                                              },
                                              child: Container(
                                                width: 120.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.r),
                                                    color: selectedTab == 0
                                                        ? AppColors.primary
                                                        : AppColors
                                                            .transparent),
                                                child: Center(
                                                  child: Content(
                                                    data: "Details",
                                                    style: AppTextSyle
                                                        .displayTiny
                                                        .copyWith(
                                                      color: selectedTab == 0
                                                          ? AppColors.card
                                                          : AppColors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() => selectedTab = 1);
                                              },
                                              child: Container(
                                                width: 120.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.r),
                                                    color: selectedTab == 1
                                                        ? AppColors.primary
                                                        : AppColors
                                                            .transparent),
                                                child: Center(
                                                  child: Content(
                                                    data: "Tasting notes",
                                                    style: AppTextSyle
                                                        .displayTiny
                                                        .copyWith(
                                                      color: selectedTab == 1
                                                          ? AppColors.card
                                                          : AppColors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: () {
                                                setState(() => selectedTab = 2);
                                              },
                                              child: Container(
                                                width: 120.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            6.r),
                                                    color: selectedTab == 2
                                                        ? AppColors.primary
                                                        : AppColors
                                                            .transparent),
                                                child: Center(
                                                  child: Content(
                                                    data: "History",
                                                    style: AppTextSyle
                                                        .displayTiny
                                                        .copyWith(
                                                      color: selectedTab == 2
                                                          ? AppColors.card
                                                          : AppColors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    20.verticalSpace,
                                    if (selectedTab == 0)
                                      ListView(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: collectionDetail
                                            .detail.entries
                                            .map(
                                              (entry) => Padding(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 10),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Content(
                                                      data: entry.key,
                                                      style: AppTextSyle
                                                          .displayRegularSmall,
                                                    ),
                                                    Content(
                                                      data: entry.value,
                                                      style: AppTextSyle
                                                          .displayRegularSmall
                                                          .copyWith(
                                                        color:
                                                            AppColors.lightText,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      )
                                    else if (selectedTab == 1)
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Content(
                                            data: "Tasting notes",
                                            style: AppTextSyle.displayMedium,
                                          ),
                                          Content(
                                            data: "by Charles MacLean MBE",
                                            style: AppTextSyle
                                                .displayRegularSmall
                                                .copyWith(
                                              color: AppColors.lightText,
                                            ),
                                          ),
                                          12.verticalSpace,
                                          Container(
                                            color: AppColors.card,
                                            child: ListView(
                                              shrinkWrap: true,
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              children: collectionDetail
                                                  .tastingNotes.entries
                                                  .map(
                                                    (entry) => ListTile(
                                                      title: Content(
                                                        data: entry.key,
                                                        style: AppTextSyle
                                                            .displayMedium,
                                                      ),
                                                      subtitle: Content(
                                                        data: entry.value,
                                                        style: AppTextSyle
                                                            .displaySmall
                                                            .copyWith(
                                                          color: AppColors
                                                              .lightText,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                  .toList(),
                                            ),
                                          ),
                                        ],
                                      )
                                    else
                                      Stepper(
                                        currentStep: _currentStep,
                                        onStepContinue: () {
                                          if (_currentStep < 2) {
                                            setState(() {
                                              _currentStep += 1;
                                            });
                                          }
                                        },
                                        onStepCancel: () {
                                          if (_currentStep > 0) {
                                            setState(() {
                                              _currentStep -= 1;
                                            });
                                          }
                                        },
                                        steps: [
                                          Step(
                                            label: Content(
                                              data: "Label",
                                              style: AppTextSyle.displaySmall,
                                            ),
                                            title: Content(
                                              data: "Title",
                                              style: AppTextSyle.displaySmall,
                                            ),
                                            subtitle: Content(
                                              data: "Desciption",
                                              style: AppTextSyle.displaySmall,
                                            ),
                                            content: Image.asset(
                                              AppAssets.attachementTag,
                                            ),
                                            isActive: _currentStep >= 0,
                                          ),
                                          Step(
                                            label: Content(
                                              data: "Label",
                                              style: AppTextSyle.displaySmall,
                                            ),
                                            title: Content(
                                              data: "Title",
                                              style: AppTextSyle.displaySmall,
                                            ),
                                            subtitle: Content(
                                              data: "Desciption",
                                              style: AppTextSyle.displaySmall,
                                            ),
                                            content: Image.asset(
                                              AppAssets.attachementTag,
                                            ),
                                            isActive: _currentStep >= 1,
                                          ),
                                          Step(
                                            label: Content(
                                              data: "Label",
                                              style: AppTextSyle.displaySmall,
                                            ),
                                            title: Content(
                                              data: "Title",
                                              style: AppTextSyle.displaySmall,
                                            ),
                                            subtitle: Content(
                                              data: "Desciption",
                                              style: AppTextSyle.displaySmall,
                                            ),
                                            content: Image.asset(
                                              AppAssets.attachementTag,
                                            ),
                                            isActive: _currentStep >= 2,
                                          ),
                                        ],
                                      ),
                                  ],
                                ),
                              ),
                              20.verticalSpace,
                            ],
                          ),
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
                SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 45.w, vertical: 10.h),
                    child: PrimaryButton(
                      title: "Add to my collection",
                      onTap: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
