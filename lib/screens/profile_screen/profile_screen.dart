import 'package:e_commerce_app2/config_or_core/utils/query/height_width_query.dart';
import 'package:e_commerce_app2/screens/profile_screen/widget/change_name_dialog.dart';
import 'package:e_commerce_app2/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/profile_bloc.dart';


class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileBloc>().add(FetchProfileEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyCustomAppBar(title: "Profile",),
      body: Column(
        children: [
          BlocBuilder<ProfileBloc,ProfileState>(builder: (context,state){
            if(state is ProfileLoading)
              {
                return const Center(child: CircularProgressIndicator(),);
              }
            if(state is ProfileLoaded)
              {
                return Center(
                  child: ListTile(
                    title: Text("Name: ${state.data!["name"]}",style: Theme.of(context).textTheme.headlineMedium,),
                    subtitle: Text("Email: ${state.data!["email"]}",style: Theme.of(context).textTheme.headlineSmall,),
                    trailing: InkWell(
                      onTap: (){
                        changeNameDialog(context);
                      },
                      child: RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Edit ",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                            const WidgetSpan(
                              child: Icon(Icons.edit,size: 18,),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              }
            else if(state is ProfileError)
              {
                return Center(child: Text(
                  "Something went wrong ${state.errorMessage}",
                  style: Theme.of(context).textTheme.headline5!
                      .copyWith(color: Colors.red),)
                );
              }
            return const SizedBox();
          })
        ],
      ),
      bottomNavigationBar: const MyCustomBotNavBar(),
    );
  }
}
