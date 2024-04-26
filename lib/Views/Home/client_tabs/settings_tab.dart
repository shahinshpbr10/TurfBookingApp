import 'package:flutter/material.dart';

class SettingsClient extends StatefulWidget {
  @override
  _SettingsCleintState createState() => _SettingsCleintState();
}

class _SettingsCleintState extends State<SettingsClient> {
  bool _notificationsEnabled = true;
  bool _darkModeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.teal,
        elevation: 0,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Icon(
                  Icons.account_circle,
                  color: Colors.teal,
                ),
                backgroundColor: Colors.teal.withOpacity(0.2),
              ),
              title: Text(
                'My Account',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () {
                // Navigate to account page
              },
            ),
          ),
          SwitchListTile(
            title: Text(
              'Notifications',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            value: _notificationsEnabled,
            onChanged: (bool value) {
              setState(() {
                _notificationsEnabled = value;
              });
            },
            secondary: Icon(
              Icons.notifications,
              color: Colors.teal,
            ),
          ),
          SwitchListTile(
            title: Text(
              'Dark Mode',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            value: _darkModeEnabled,
            onChanged: (bool value) {
              setState(() {
                _darkModeEnabled = value;
              });
            },
            secondary: Icon(
              Icons.brightness_4,
              color: Colors.teal,
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.language,
              color: Colors.teal,
            ),
            title: Text(
              'Change Language',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to language selection page
            },
          ),
          ListTile(
            leading: Icon(
              Icons.policy,
              color: Colors.teal,
            ),
            title: Text(
              'Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to privacy policy page
            },
          ),
          ListTile(
            leading: Icon(
              Icons.assignment,
              color: Colors.teal,
            ),
            title: Text(
              'Terms of Service',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Navigate to terms of service page
            },
          ),
        ],
      ),
    );
  }
}
