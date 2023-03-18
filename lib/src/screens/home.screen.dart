import 'package:flutter/material.dart';
import 'package:vifacilita/data/home.data.dart';
import 'package:vifacilita/src/components/image_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ViFaciliTa"),
      ),
      body: SafeArea(
        child: Center(
          child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Column(
              children: [
                const Divider(),
                Expanded(
                  flex: 1,
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1,
                    ),
                    itemCount: homeData.length,
                    itemBuilder: (BuildContext context, int index) {
                      final cardItem = homeData[index];
                      return ButtonImage(
                        image: cardItem.icon!,
                        onTap: () =>
                            Navigator.of(context).pushNamed(cardItem.link!),
                      );
                    },
                  ),
                ),
                const Divider(),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.call, color: Colors.white),
                    label: Text(
                      "Call emergency",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white,
                          ),
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
