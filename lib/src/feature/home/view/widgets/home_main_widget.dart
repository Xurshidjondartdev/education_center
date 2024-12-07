import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileCard extends StatelessWidget {
  final String name;
  final String position;
  final VoidCallback onActionPressed;
  final VoidCallback onCardPressed;
  final VoidCallback onEditPressed;
  final VoidCallback onDeleteConfirmed;

  const ProfileCard({
    super.key,
    required this.name,
    required this.position,
    required this.onActionPressed,
    required this.onCardPressed,
    required this.onEditPressed,
    required this.onDeleteConfirmed,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: CupertinoButton(
        onPressed: onCardPressed,
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(16.r),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Stack(
            children: [
              Container(
                width: double.infinity,
                padding: REdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 40.r,
                      backgroundColor: Colors.blue[100],
                      child: Text(
                        name.substring(0, 1),
                        style: TextStyle(
                          fontSize: 36.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      position,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 16.h),
                    ElevatedButton(
                      onPressed: onActionPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.withOpacity(0.8),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                      ),
                      child: const Text(
                        "        View groups        ",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                top: 8.r,
                right: 8.r,
                child: IconButton(
                  onPressed: () {
                    _showMoreOptions(context);
                  },
                  icon: Icon(
                    Icons.more_vert,
                    size: 24.r,
                    color: Colors.grey[700],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showMoreOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16.r)),
      ),
      builder: (context) {
        return Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.edit, color: Colors.blue),
                title: Text(
                  "Edit",
                  style: TextStyle(fontSize: 16.sp),
                ),
                onTap: onEditPressed,
              ),
              ListTile(
                leading: const Icon(Icons.delete, color: Colors.red),
                title: Text(
                  "Delete",
                  style: TextStyle(fontSize: 16.sp),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _showDeleteConfirmationDialog(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          title: const Text("Confirmation"),
          content: const Text("Are you sure you want to delete it?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("No"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                onDeleteConfirmed();
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
