import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

import '../screens/contact_us_screen.dart';

/**
 * Created by Parth Sheth.
 * Created on 05/04/23 at 5:03 PM
 */

class CustomDrawerWidget extends StatelessWidget {
  const CustomDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
              child: Container(
                child: Image.asset('assets/images/png/applogo.png'),
              ),
          ),
           ListTile(
            leading: Icon(Icons.share,color: Colors.black,),
            title: Text('Share'),
            onTap: () {
              Share.share('Hello');
            },
          ),
          const ListTile(
            leading: Icon(Icons.star_rate,color: Colors.black,),
            title: Text('Rate now'),
          ),
          const ListTile(
            leading: Icon(Icons.settings,color: Colors.black,),
            title: Text('Setting'),
          ),
           ListTile(
            leading: Icon(Icons.contact_page,color: Colors.black,),
            title: Text('Contact us'),
            onTap: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>const ContactUsScreen()));
            },
          ),
          const ListTile(
            leading: Icon(Icons.info,color: Colors.black,),
            title: Text('About us'),
          ),
        ],
      ),
    );
  }
}
