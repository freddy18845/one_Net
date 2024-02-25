import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:one_net/utils/colour.dart';
import 'package:one_net/utils/fonts_style.dart';
import 'package:one_net/utils/screen_size.dart';
import 'package:one_net/view_models/change_pinpad_theme_view_model.dart';
import 'package:one_net/views/splash_screen.dart';
import 'package:one_net/widgets/buy_airtime_btn.dart';
import 'package:one_net/widgets/flyers.dart';
import 'package:one_net/widgets/footer.dart';
import 'package:one_net/widgets/round_btn.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    Provider.of<PinpadThemeView>(context).colourTheme(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/home.png"), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: ScreenSize().getScreenHeight(2),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    "assets/images/logo2.png",
                    width: ScreenSize().getScreenWidth(70),
                    height: ScreenSize().getScreenHeight(15),
                    fit: BoxFit.cover,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              const SplashScreen(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                    child: RoundBtn(
                      btnLabel: Icon(
                        Icons.power_settings_new,
                        size: ScreenSize().getScreenHeight(4),
                        color: Colors.white,
                      ),
                      innerColor: Colour().primary(),
                      outerColor: Colors.white,
                    ),
                  ),
                ],
              ),
              Container(
                height: ScreenSize().getScreenHeight(37),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(235, 55, 52, 53),
                  borderRadius: BorderRadius.circular(
                    ScreenSize().getScreenHeight(3),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(ScreenSize().getScreenHeight(3.5)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Main Menu",
                                style: FontsStyle().mainMenuText(),
                              ),
                              Text(
                                "Select Buy Airtime To Purchase",
                                style: FontsStyle().mainText(),
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/images/grid.png",
                            width: ScreenSize().getScreenHeight(4.5),
                            height: ScreenSize().getScreenHeight(4.5),
                            fit: BoxFit.fill,
                          ),
                        ],
                      ),
                      Divider(
                        thickness: 1,
                        color: Colour().primary(),
                      ),
                      SizedBox(
                        height: ScreenSize().getScreenHeight(3),
                      ),
                      const BuyAirtimeBtn(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: ScreenSize().getScreenHeight(12),
              ),
              Text(
                "Offers & Promos",
                style: FontsStyle().mainMenuText(),
              ),
              const Divider(),
              SizedBox(
                height: ScreenSize().getScreenHeight(2),
              ),
              const Flyer(),
              const Expanded(
                child: SizedBox.shrink(),
              ),
              const Footer()
            ],
          ),
        ),
      ),
    );
  }
}
