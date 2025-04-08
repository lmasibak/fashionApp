




import 'package:flutter/material.dart';
import 'package:myapp/main.dart';
import 'package:myapp/models/user_profile.dart';
import 'package:myapp/screens/auth/login_screen.dart';
import 'package:myapp/widgets/bottom_nav.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isLoading = true;
  UserProfile? userProfile;

  @override
  void initState() {
    super.initState();
    _loadUserProfile();
  }

  Future<void> _loadUserProfile() async {
    try {
      final user = supabase.auth.currentUser;
      
      if (user == null) {
        if (mounted) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()),
          );
        }
        return;
      }
      
      // TODO: Fetch user profile from Supabase
      
      // For demo purposes, we'll create a dummy profile
      await Future.delayed(const Duration(seconds: 1));
      
      if (mounted) {
        setState(() {
          userProfile = UserProfile(
            id: user.id,
            email: user.email!,
            fullName: 'John Doe',
            avatarUrl: '/placeholder.svg?height=200&width=200',
            phoneNumber: '+1 (555) 123-4567',
            address: '123 Fashion St, New York, NY 10001',
            createdAt: DateTime.now(),
          );
          isLoading = false;
        });
      }
    } catch (error) {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
        context.showSnackBar('Error loading profile', isError: true);
      }
    }
  }

  Future<void> _signOut() async {
    try {
      await supabase.auth.signOut();
      
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const LoginScreen()),
        );
      }
    } catch (error) {
      if (mounted) {
        context.showSnackBar('Error signing out', isError: true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Profile',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined, color: Colors.black),
            onPressed: () {
              // TODO: Navigate to settings screen
            },
          ),
        ],
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: NetworkImage(userProfile!.avatarUrl ?? '/placeholder.svg?height=200&width=200'),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          userProfile!.fullName ?? 'No Name',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          userProfile!.email,
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 24),
                        OutlinedButton(
                          onPressed: () {
                            // TODO: Navigate to edit profile screen
                          },
                          style: OutlinedButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 32,
                              vertical: 12,
                            ),
                          ),
                          child: const Text('Edit Profile'),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Divider(),
                  _buildProfileMenuItem(
                    icon: Icons.shopping_bag_outlined,
                    title: 'My Orders',
                    onTap: () {
                      // TODO: Navigate to orders screen
                    },
                  ),
                  _buildProfileMenuItem(
                    icon: Icons.favorite_border,
                    title: 'Wishlist',
                    onTap: () {
                      // TODO: Navigate to wishlist screen
                    },
                  ),
                  _buildProfileMenuItem(
                    icon: Icons.location_on_outlined,
                    title: 'Shipping Addresses',
                    onTap: () {
                      // TODO: Navigate to addresses screen
                    },
                  ),
                  _buildProfileMenuItem(
                    icon: Icons.credit_card_outlined,
                    title: 'Payment Methods',
                    onTap: () {
                      // TODO: Navigate to payment methods screen
                    },
                  ),
                  _buildProfileMenuItem(
                    icon: Icons.headset_mic_outlined,
                    title: 'Customer Support',
                    onTap: () {
                      // TODO: Navigate to support screen
                    },
                  ),
                  _buildProfileMenuItem(
                    icon: Icons.exit_to_app,
                    title: 'Sign Out',
                    onTap: _signOut,
                  ),
                ],
              ),
            ),
      bottomNavigationBar: const BottomNavBar(currentIndex: 3),
    );
  }

  Widget _buildProfileMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: const Icon(Icons.chevron_right),
      onTap: onTap,
    );
  }
}
