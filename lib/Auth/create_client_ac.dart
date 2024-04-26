import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class CreateClientAccountPage extends StatefulWidget {
  @override
  _CreateClientAccountPageState createState() =>
      _CreateClientAccountPageState();
}

class _CreateClientAccountPageState extends State<CreateClientAccountPage> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';
  String _confirmPassword = '';
  UserType _userType = UserType.player;
  String _playingPosition = '';
  String _contactDetails = '';
  XFile? _experienceProof;
  File? _profilePicture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create Account',
          style: GoogleFonts.poppins(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  'Profile Picture',
                  style: GoogleFonts.poppins(),
                ),
                trailing: IconButton(
                  icon: _profilePicture == null
                      ? const Icon(Icons.add_a_photo)
                      : Image.file(_profilePicture!, width: 32, height: 32),
                  onPressed: () async {
                    final picker = ImagePicker();
                    final pickedFile =
                        await picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      setState(() {
                        _profilePicture = File(pickedFile.path);
                      });
                    }
                  },
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Name',
                  labelStyle: GoogleFonts.poppins(),
                  prefixIcon: const Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _name = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Email',
                  labelStyle: GoogleFonts.poppins(),
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _email = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Password',
                  labelStyle: GoogleFonts.poppins(),
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  }
                  return null;
                },
                onSaved: (value) {
                  _password = value!;
                },
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  labelStyle: GoogleFonts.poppins(),
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != _password) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
                onSaved: (value) {
                  _confirmPassword = value!;
                },
              ),
              const SizedBox(height: 16.0),
              ListTile(
                title: Text(
                  'User Type',
                  style: GoogleFonts.poppins(),
                ),
                trailing: DropdownButton<UserType>(
                  value: _userType,
                  onChanged: (UserType? value) {
                    if (value != null) {
                      setState(() {
                        _userType = value;
                      });
                    }
                  },
                  items: UserType.values
                      .map((userType) => DropdownMenuItem<UserType>(
                            value: userType,
                            child: Text(userType.name),
                          ))
                      .toList(),
                ),
              ),
              if (_userType == UserType.professional)
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Playing Position',
                    labelStyle: GoogleFonts.poppins(),
                    prefixIcon: const Icon(Icons.sports_soccer),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (_userType == UserType.professional &&
                        (value == null || value.isEmpty)) {
                      return 'Please enter your playing position';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _playingPosition = value!;
                  },
                ),
              if (_userType == UserType.professional)
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Contact Details',
                    labelStyle: GoogleFonts.poppins(),
                    prefixIcon: const Icon(Icons.contact_phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  validator: (value) {
                    if (_userType == UserType.professional &&
                        (value == null || value.isEmpty)) {
                      return 'Please enter your contact details';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _contactDetails = value!;
                  },
                ),
              if (_userType == UserType.professional)
                ListTile(
                  title: Text(
                    'Experience Proof',
                    style: GoogleFonts.poppins(),
                  ),
                  trailing: IconButton(
                    icon: const Icon(Icons.upload_file),
                    onPressed: () async {
                      final picker = ImagePicker();
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        setState(() {
                          _experienceProof = pickedFile;
                        });
                      }
                    },
                  ),
                ),
              const SizedBox(height: 32.0),
              ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Perform account creation logic here
                      print('Name: $_name');
                      print('Email: $_email');
                      print('User Type: ${_userType.name}');
                      if (_userType == UserType.professional) {
                        print('Playing Position: $_playingPosition');
                        print('Contact Details: $_contactDetails');
                        print('Experience Proof: ${_experienceProof?.path}');
                      }
                      // ...
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1E88E5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 16,
                      horizontal: 32,
                    ),
                    child: Text(
                      'Create Account',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}

enum UserType {
  player,
  professional,
}

extension UserTypeExtension on UserType {
  String get name {
    switch (this) {
      case UserType.player:
        return 'Player';
      case UserType.professional:
        return 'Professional Player';
    }
  }
}
