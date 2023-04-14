import 'package:flutter/material.dart';

import '../screens/personal_detail_screen.dart';

/**
 * Created by Parth Sheth.
 * Created on 06/04/23 at 4:32 PM
 */

class ComponentsWidget extends StatelessWidget {
  const ComponentsWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
  return SingleChildScrollView(
      child: Column(
        children: [
          const Align(alignment: Alignment.topLeft,child: Text('Components',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),
          const Divider(),
          ComponentListing(context,Icons.person,'Personal Details',const PersonalDetailScreen()),
          ComponentListing(context,Icons.history_edu,'Education',const PersonalDetailScreen()),
          ComponentListing(context,Icons.person_outline_outlined,'Experience',const PersonalDetailScreen()),
          ComponentListing(context,Icons.person_outline_outlined,'Skills',const PersonalDetailScreen()),
          ComponentListing(context,Icons.gps_fixed_outlined,'Objective',const PersonalDetailScreen()),
          ComponentListing(context,Icons.person_2,'Reference',const PersonalDetailScreen()),
          const Align(alignment: Alignment.topLeft,child: Text('More Components',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
          const Divider(),
          ComponentListing(context,Icons.rocket_launch,'Project',const PersonalDetailScreen()),
          ComponentListing(context,Icons.edit,'Signature',const PersonalDetailScreen()),
          ComponentListing(context,Icons.messenger,'Cover Letter',const PersonalDetailScreen()),
          ComponentListing(context,Icons.add,'Add More Section',const PersonalDetailScreen()),
          const Align(alignment: Alignment.topLeft,child: Text('Manage Components',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
          const Divider(),
          ComponentListing(context,Icons.update,'Rearrange / Edit Headings',const PersonalDetailScreen()),
          ComponentListing(context,Icons.help,'Help',const PersonalDetailScreen()),
        ],
      ),
    );
  }

  Widget ComponentListing(BuildContext context,IconData icons,String fieldName,Widget page) {
    return ListTile(
      onTap: (){
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => page),
        );
      },
      leading: Icon(icons),
      title: Text(fieldName),
    );
  }

}
