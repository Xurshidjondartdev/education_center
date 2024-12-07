import 'package:education_center/src/core/widgets/custom_app_bar_widget.dart';
import 'package:education_center/src/feature/groups/view_model/group_vm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/routes/app_route_names.dart';
import '../../../../core/routes/router_config.dart';
import '../widgets/group_widget.dart';

class GroupPage extends ConsumerWidget {
  const GroupPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final groupsVm = ref.watch(groupVM);
    return Scaffold(
      appBar: const CustomAppBarWidget(title: "View all groups", canPop: true),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SizedBox(
          height: 300, // Kartalar balandligini moslang
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final group = groupsVm.groups[index];
              return GroupWidget(
                name: group["name"]!,
                position: group['position']!,
                onActionPressed: () {
                  RouterConfigService.router.go(AppRouteNames.studentsPage);
                },
                onCardPressed: () {},
                onEditPressed: () {},
                onDeleteConfirmed: () {},
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 16),
            itemCount: groupsVm.groups.length
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          RouterConfigService.router
              .go("${AppRouteNames.home}/${AppRouteNames.addGroups}");
        },
        child: const Icon(Icons.group_add),
      ),
    );
  }
}
