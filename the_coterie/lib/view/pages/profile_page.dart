import 'package:flutter/material.dart';
import 'package:the_coterie/widgets/skeleton.dart';

import '../../widgets/personal_info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key,});

  @override
  Widget build(BuildContext context) {
    
    return Skeleton(
      
      bodyWidget: FittedBox(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PersonalInfoTile(
                name: "Jane Doe",
                bio: "Bio",
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.chat),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius:
                        new BorderRadius.all(new Radius.circular(40.0)),
                        border: new Border.all(
                          color: Colors.black,
                          width: 2.0,
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundImage: Image(image: AssetImage('./assets/placeholder.png')).image,
                        foregroundColor: Colors.black,
                        radius: 30.0,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.call),
                      color: Colors.black,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ), showAppBars: true,
      txt: "Profile",
    );
  }
}


