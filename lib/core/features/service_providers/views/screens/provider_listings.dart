import 'package:Akombi/core/Utils/text_strings.dart';
import 'package:Akombi/core/constants/colors.dart';
import 'package:Akombi/core/features/service_providers/models/provider_model.dart';
import 'package:Akombi/core/features/service_providers/models/providers_data.dart';
import 'package:Akombi/core/features/service_providers/views/screens/provider_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';
import 'package:toggle_switch/toggle_switch.dart';

import '../../../../common_widgets/fitness_button.dart';


GetStorage box = GetStorage();

class ProviderListings extends StatefulWidget {
  @override
  State<ProviderListings> createState() => _ProviderListingsState();
}

class _ProviderListingsState extends State<ProviderListings>
    with SingleTickerProviderStateMixin {
  TabController? _serviceProviderTabController;

  List<ProviderModel> providers = ProvidersData().serviceProviders;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _serviceProviderTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _serviceProviderTabController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.tPrimaryColor,
        title: Text(
          // 'Service Providers',
          LocalKeys.serviceProviders.tr,
          style: TextStyle(
              color: ColorConstants.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.feedback_rounded,
                  color: ColorConstants.white)),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: ColorConstants.white,
              ))
        ],
        bottom: TabBar(
            controller: _serviceProviderTabController,
            labelColor: ColorConstants.cardioColor,
            automaticIndicatorColorAdjustment: true,
            dividerColor: ColorConstants.white,
            enableFeedback: true,
            unselectedLabelColor: ColorConstants.white,
            indicatorColor: ColorConstants.cardioColor,
            indicatorPadding: const EdgeInsets.all(5),
            tabs: const [
              Tab(
                  text: "Nannies",
                  icon: Icon(Icons.baby_changing_station_rounded)),
              Tab(text: "Maids", icon: Icon(Icons.cleaning_services))
            ]),
      ),
      body: TabBarView(controller: _serviceProviderTabController, children: [
        ListView.builder(
            itemCount: providers.length,
            itemBuilder: (context, index) {
              return ProviderCard(providers: providers, index: index);
            }),

        // const Center(
        //   child: Text("Maids"),
        // )
        const LanguageTheme(),
      ]),
    );
  }
}



class LanguageTheme extends StatelessWidget {
  const LanguageTheme({super.key});

  @override
  Widget build(BuildContext context) {

    final List<Map<String, Object>> locales = [
      {
        "name": "English",
        "locale": Locale("en", 'US')
      },
      {
        "name": "French",
        "locale": Locale("fr", '	FR')
      }
    ];

    updateLocale(Locale locale, BuildContext context){
      Get.updateLocale(locale);

      // Save the state of data in localStorage
      final GetStorage box = GetStorage();
      box.write('language_code', locale.languageCode);
    }
    String getSavedLocale(){
      final box = GetStorage();
      return box.read('language_code') ?? 'en';
    }
    
    String savedLanguageCode = getSavedLocale();
    int initialIndex = locales.indexWhere((locale) =>
    (locale['locale'] as Locale).languageCode == savedLanguageCode
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                "Change Language",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10,),
            ToggleSwitch(
              minWidth: 90.0,
              initialLabelIndex: initialIndex,
              cornerRadius: 20.0,
              activeFgColor: Colors.white,
              inactiveBgColor: Colors.grey,
              inactiveFgColor: Colors.white,
              totalSwitches: 2,
              labels: ['English', 'French'],
              // icons: [FontAwesomeIcons.mars, FontAwesomeIcons.venus],
              activeBgColors: const [[Colors.blue],[Colors.pink]],
              onToggle: (index) {
                  print('switched to: $index');
                    if(index == 0){
                      updateLocale(locales[0]['locale'] as Locale, context);
                    } else if(index == 1){
                      updateLocale(locales[1]['locale'] as Locale, context);
                    }
                  },
            ),
          ],
        ),

        // const SizedBox(height: 30,),
        // FitnessButton(title: 'Switch Theme', onTap: () {
        //   Get.changeTheme(Get.isDarkMode? ThemeData.light(): ThemeData.dark());
        // },),

      ],
    );
  }
}
