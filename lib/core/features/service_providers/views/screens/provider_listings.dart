import 'dart:core';

import 'package:Akombi/core/Utils/text_strings.dart';
import 'package:Akombi/core/constants/colors.dart';
import 'package:Akombi/core/features/service_providers/controller/nannies.dart';
import 'package:Akombi/core/features/service_providers/models/provider_model.dart';
import 'package:Akombi/core/features/service_providers/models/providers_data.dart';
import 'package:Akombi/core/features/service_providers/views/screens/provider_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'addNanny.dart';

class ProviderListings extends StatefulWidget {
  @override
  State<ProviderListings> createState() => _ProviderListingsState();
}

class _ProviderListingsState extends State<ProviderListings>
    with SingleTickerProviderStateMixin {
  TabController? _serviceProviderTabController;

  List<ProviderModel> providers = ProvidersData().serviceProviders;

  List<ProviderModel> Maids = [];
  List<ProviderModel> Nannies = [];

  ProviderNanniesController controller = Get.find();
  @override
  void initState() {
    controller.providers();
    controller.fetchProviderNanny();
    // TODO: implement initState
    super.initState();
    _serviceProviderTabController = TabController(length: 2, vsync: this);
    Maids = providers.where(
            (ProviderModel) => ProviderModel.typeOfService.contains('Maid')).toList();
    Nannies = providers.where(
            (ProviderModel) => ProviderModel.typeOfService.contains('Nanny')).toList();
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
          style: const TextStyle(
              color: ColorConstants.white, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.feedback_rounded,
                  color: ColorConstants.white)
          ),
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
            itemCount: Nannies.length,
            itemBuilder: (context, index) {
              return ProviderCard();
            }),

        ListView.builder(
            itemCount: Maids.length,
            itemBuilder: (context, index) {
              return ProviderCard(
                  // providers: Maids, index: index
                  );
            }),
      ]),

      floatingActionButton: FloatingActionButton(
          backgroundColor: ColorConstants.tPrimaryColor,
          shape: CircleBorder(),
          child: Icon(
            Icons.add,
              color: Colors.white,
          ),
          onPressed: (){
            Get.to(() => ProviderNaniesAddPage());
          }),
    );
  }
}
