import 'package:flutter/material.dart';

import '../../widgets/personal_info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: FittedBox(
        alignment: Alignment.center,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              PersonalInfoTile(
                title: "Jane Doe",
                subtitle: "Bio",
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
                        backgroundImage: AssetImage('placeholder'),
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
      ),
    );
  }
}


