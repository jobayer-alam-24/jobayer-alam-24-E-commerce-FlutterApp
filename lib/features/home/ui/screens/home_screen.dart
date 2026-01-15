import 'package:e_commerce/app/assets_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/ui/widgets/appbar_icon_button.dart';
import '../../../common/ui/widgets/home_carousel_slider.dart';
import '../../../common/ui/widgets/search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String name = '/home-screen';
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16,),
              ProductSearchBar(searchcontroller: controller,),
              const SizedBox(height: 16,),
              CarouselSliderHome()
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AssetsPath.NavLogoSvg),
      actions: [
        AppBarIconButton(icon: Icons.person_outline, onTap: (){},),
        const SizedBox(width: 6,),
        AppBarIconButton(icon: Icons.call, onTap: (){},),
        const SizedBox(width: 6,),
        AppBarIconButton(icon: Icons.notifications_active_outlined, onTap: (){},),
        const SizedBox(width: 6,),
      ],
    );
  }
}


