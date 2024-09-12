import 'package:Akombi/core/constants/colors.dart';
import 'package:Akombi/core/features/service_providers/models/providers_data.dart';
import 'package:Akombi/core/features/service_providers/views/screens/provider_card.dart';
import 'package:flutter/material.dart';

class ProviderListings extends StatefulWidget {
  @override
  State<ProviderListings> createState() => _ProviderListingsState();
}

class _ProviderListingsState extends State<ProviderListings>
    with SingleTickerProviderStateMixin {
  TabController? _serviceProviderTabController;

  List providers = ProvidersData().serviceProviders;

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
        title: const Text(
          'Service Providers',
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
        const Center(
          child: Text("Maids"),
        )
      ]),
    );
  }
}
