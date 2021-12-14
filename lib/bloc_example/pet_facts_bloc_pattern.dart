import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_walkthrough/bloc_example/pet_facts_bloc.dart';
import 'package:flutter_app_walkthrough/resources/colors.dart';
import 'package:flutter_app_walkthrough/resources/strings.dart';
import 'package:flutter_app_walkthrough/util/color_util.dart';

class PetFactsBlocWidget extends StatelessWidget {
  final String title;

  const PetFactsBlocWidget({Key? key, this.title = "petApiExample"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () async {
              bloc.getPetList();
            },
          ),
          IconButton(
            icon: const Icon(
              Icons.clear,
              color: Colors.white,
            ),
            onPressed: () async {
              bloc.clearPetList();
            },
          )
        ],
        title: const Text(ResStrings.petApiExample),
        backgroundColor:
            ColorUtil.createMaterialColor(const Color(ResColors.gradientOne)),
      ),
      body: const PetFactView(),
    );
  }
}

class PetFactView extends StatelessWidget {
  const PetFactView({Key? key});

  @override
  Widget build(BuildContext context) {
    bloc.getPetList();
    return StreamBuilder<List>(
        stream: bloc.subject.stream,
        builder: (context, AsyncSnapshot<List> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text(ResStrings.errorText));
          } else if (snapshot.hasData) {
            if (snapshot.data != null && snapshot.data!.isNotEmpty) {

              // Can handle this as different view states
              return ListView.separated(
                itemCount: snapshot.data!.length,
                separatorBuilder: (context, index) {
                  return const Divider(
                    height: 5,
                    thickness: 1,
                    color: CupertinoColors.separator,
                  );
                },
                itemBuilder: (context, index) {
                  final item = snapshot.data![index] as Map<String, dynamic>;
                  return ListTile(
                      leading: const Icon(Icons.article,
                          color: Color(ResColors.gradientTwo)),
                      title: Text("Fact " + (index + 1).toString()),
                      subtitle: Text(item["fact"]));
                },
              );
            } else {
              return const Center(child: Text(ResStrings.emptyText));
            }
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}
