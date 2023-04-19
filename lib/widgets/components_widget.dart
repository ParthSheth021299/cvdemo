import 'package:flutter/material.dart';
import '../screens/education_detail_screen.dart';
import '../screens/personal_detail_screen.dart';
import '../screens/skills_screen.dart';

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
          componentListing(context,Icons.person,'Personal Details',const PersonalDetailScreen()),
          componentListing(context,Icons.history_edu,'Education',const EducationDetailScreen()),
          componentListing(context,Icons.person_outline_outlined,'Experience',const PersonalDetailScreen()),
          componentListing(context,Icons.person_outline_outlined,'Skills',const SkillScreen()),
          componentListing(context,Icons.gps_fixed_outlined,'Objective',const PersonalDetailScreen()),
          componentListing(context,Icons.person_2,'Reference',const PersonalDetailScreen()),
          const Align(alignment: Alignment.topLeft,child: Text('More Components',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
          const Divider(),
          componentListing(context,Icons.rocket_launch,'Project',const PersonalDetailScreen()),
          componentListing(context,Icons.edit,'Signature',const PersonalDetailScreen()),
          componentListing(context,Icons.messenger,'Cover Letter',const PersonalDetailScreen()),
          componentListing(context,Icons.add,'Add More Section',const PersonalDetailScreen()),
          const Align(alignment: Alignment.topLeft,child: Text('Manage Components',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20))),
          const Divider(),
          componentListing(context,Icons.update,'Rearrange / Edit Headings',const PersonalDetailScreen()),
          componentListing(context,Icons.help,'Help',const PersonalDetailScreen()),
        ],
      ),
    );
  }

  Widget componentListing(BuildContext context,IconData icons,String fieldName,Widget page) {
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
