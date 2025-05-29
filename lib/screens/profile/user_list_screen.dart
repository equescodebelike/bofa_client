import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../bloc/user_list/user_list_barrel.dart';
import '../../data/dto/user_dto.dart';
import '../../theme/app_typography.dart';
import '../../theme/color_const.dart';
import 'user_detail_screen.dart';

@RoutePage()
class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  String _sortOption = 'A-Z';
  final List<String> _sortOptions = ['A-Z', 'Z-A'];

  @override
  void initState() {
    super.initState();
    // Fetch users when the screen is initialized
    context.read<UserListBloc>().add(const FetchUserList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: const Text('Магазины'),
              bottom: PreferredSize(
                preferredSize: const Size.fromHeight(120),
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _buildSearchWidget(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 12, bottom: 8),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _buildSortDropdown(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: BlocBuilder<UserListBloc, UserListState>(
                builder: (context, state) {
                  if (state is UserListLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is UserListLoaded) {
                    return _buildUserCategories(state.users.users);
                  } else if (state is UserListError) {
                    return Center(
                      child: Text(
                        'Error: ${state.message}',
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchWidget() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const TextField(
        enabled: false,
        decoration: InputDecoration(
          hintText: 'Поиск',
          prefixIcon: Icon(Icons.search),
          border: InputBorder.none,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
      ),
    );
  }

  Widget _buildSortDropdown() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: DropdownButton<String>(
        value: _sortOption,
        icon: const Icon(Icons.keyboard_arrow_down_rounded),
        elevation: 16,
        style: const TextStyle(color: Colors.black),
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          if (newValue != null) {
            setState(() {
              _sortOption = newValue;
            });
          }
        },
        items: _sortOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  List<UserDTO> _sortUsers(List<UserDTO> users) {
    final sortedUsers = List<UserDTO>.from(users);
    switch (_sortOption) {
      case 'A-Z':
        sortedUsers.sort((a, b) => a.name.compareTo(b.name));
        break;
      case 'Z-A':
        sortedUsers.sort((a, b) => b.name.compareTo(a.name));
        break;
    }
    return sortedUsers;
  }

  Widget _buildUserCategories(List<UserDTO> users) {
    if (users.isEmpty) {
      return const Center(
        child: Text('No users found'),
      );
    }

    // Group users by categories
    Map<String, List<UserDTO>> categorizedUsers = {};

    // Add users to their respective categories
    for (var user in users) {
      if (user.categories != null && user.categories!.isNotEmpty) {
        for (var category in user.categories!) {
          if (!categorizedUsers.containsKey(category)) {
            categorizedUsers[category] = [];
          }
          categorizedUsers[category]!.add(user);
        }
      } else {
        // Handle users without categories
        if (!categorizedUsers.containsKey('Все пользователи')) {
          categorizedUsers['Все пользователи'] = [];
        }
        categorizedUsers['Все пользователи']!.add(user);
      }
    }

    // Sort users in each category
    categorizedUsers = Map.fromEntries(
      categorizedUsers.entries.map(
        (entry) => MapEntry(entry.key, _sortUsers(entry.value)),
      ),
    );

    // Create a list of widgets for each category
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: categorizedUsers.length,
      itemBuilder: (context, index) {
        final entry = categorizedUsers.entries.elementAt(index);
        return _buildUserList(entry.value, entry.key);
      },
    );
  }

  Widget _buildUserList(List<UserDTO> users, String category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Text(
            category,
            style: AppTypography.label.copyWith(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            itemCount: users.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to user details screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(
                          userId: users[index].userId!,
                          userName: users[index].name,
                        ),
                      ),
                    );
                  },
                  child: _buildUserCard(users[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildUserCard(UserDTO user) {
    return Container(
      width: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: SizedBox(
              height: 120,
              width: double.infinity,
              child: user.imageUrl != null && user.imageUrl!.isNotEmpty
                  ? CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl: user.imageUrl!,
                      progressIndicatorBuilder: (_, __, ___) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                      errorWidget: (_, __, ___) {
                        return Image.asset(
                          'assets/image/empty_photo.png',
                          fit: BoxFit.cover,
                        );
                      },
                    )
                  : Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.person,
                        size: 50,
                        color: Colors.grey,
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  user.name,
                  style: AppTypography.personalCardTitle,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: AppTypography.label.copyWith(
                    color: Colors.grey[600],
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
