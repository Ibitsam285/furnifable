import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:furnifable/app/data/constants/constants.dart';
import 'package:furnifable/app/models/product_model.dart';
import 'package:furnifable/app/models/user_model.dart';
import 'package:furnifable/app/modules/home/components/banner_card.dart';
import 'package:furnifable/app/modules/home/components/home_appbar.dart';
import 'package:furnifable/app/modules/home/components/product_card.dart';
import 'package:furnifable/app/modules/widgets/buttons/custom_text_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(
        user: dummyUser,
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        children: [
          SizedBox(height: 20.h),
          const BannerCard(),
          SizedBox(height: 13.h),
          Row(
            children: [
              Text(
                'Popular 🔥',
                style: AppTypography.kSemiBold16,
              ),
              const Spacer(),
              CustomTextButton(
                onPressed: () {},
                text: 'See All',
                fontSize: 12.sp,
                color: AppColors.kPrimary,
              ),
            ],
          ),
          AnimationLimiter(
            child: GridView.count(
              shrinkWrap: true,
              childAspectRatio: 153.w / 221.h,
              physics: const NeverScrollableScrollPhysics(),
              padding: const EdgeInsets.all(8.0),
              crossAxisCount: 2,
              crossAxisSpacing: AppSpacing.tenHorizontal,
              mainAxisSpacing: AppSpacing.twentyVertical,
              children: List.generate(
                dummyProductList.length,
                (index) {
                  return AnimationConfiguration.staggeredGrid(
                    columnCount: 2,
                    position: index,
                    duration: const Duration(milliseconds: 375),
                    child: FadeInAnimation(
                      duration: const Duration(seconds: 1),
                      child: FadeInAnimation(
                        child: ProductCard(
                          product: dummyProductList[index],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 90.h),
        ],
      ),
    );
  }
}
