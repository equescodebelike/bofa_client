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
      appBar: AppBar(
        title: const Text('Магазины'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Search widget (non-functional but styled like the showcase)
              GestureDetector(
                onTap: () {
                  // Could implement search functionality in the future
                },
                child: _buildSearchWidget(),
              ),
              // Sort dropdown
              Padding(
                padding: const EdgeInsets.only(left: 12),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: _buildSortDropdown(),
                ),
              ),
              const SizedBox(height: 15),
              // User list with BlocBuilder
              Expanded(
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
      ),
    );
  }

  Widget _buildSearchWidget() {
    return const TextField(
      enabled: false,
      decoration: InputDecoration(
        hintText: 'Поиск',
        prefixIcon: Icon(Icons.search),
      ),
    );
  }

  Widget _buildSortDropdown() {
    return DropdownButton<String>(
      value: _sortOption,
      icon: const Icon(Icons.keyboard_arrow_down_rounded),
      elevation: 16,
      style: const TextStyle(color: Colors.black),
      onChanged: (String? newValue) {
        if (newValue != null) {
          setState(() {
            _sortOption = newValue;
            // Here you could add sorting logic based on the selected option
          });
        }
      },
      items: _sortOptions.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }

  Widget _buildUserCategories(List<UserDTO> users) {
    if (users.isEmpty) {
      return const Center(
        child: Text('No users found'),
      );
    }

    return _buildUserList(users, 'Все пользователи');
  }

  Widget _buildUserList(List<UserDTO> users, String category) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            category,
            style: AppTypography.label.copyWith(fontSize: 16),
          ),
        ),
        SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: users.map((user) {
              return Padding(
                padding: const EdgeInsets.all(8),
                child: GestureDetector(
                  onTap: () {
                    // Navigate to user details screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UserDetailScreen(
                          userId: user.userId!,
                          userName: user.name,
                        ),
                      ),
                    );
                  },
                  child: _buildUserCard(user),
                ),
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildUserCard(UserDTO user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // User image container
        Container(
          width: 200,
          height: 120,
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: AppColor.black.withOpacity(0.08),
                offset: const Offset(0, 4),
                blurRadius: 12,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: Stack(
            children: [
              // User image
              Positioned.fill(
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
            ],
          ),
        ),
        // User info
        SizedBox(
          width: 200,
          child: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // User name
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        user.name,
                        style: AppTypography.personalCardTitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        user.email,
                        style: AppTypography.label,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                // Empty space where status indicator was
                const SizedBox(width: 8),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
