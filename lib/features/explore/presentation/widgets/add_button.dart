import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 8, // Add icon at top right
      right: 8,
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder:
                (_) => Center(
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      width: 280,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          _buildPopupOption(Icons.map, 'Add to Plan', context),
                          const Divider(height: 1),
                          _buildPopupOption(
                            Icons.calendar_today,
                            'Add to Trip',
                            context,
                          ),
                          const Divider(height: 1),
                          _buildPopupOption(
                            Icons.favorite_border,
                            'Add to Wishlist',
                            context,
                          ),
                          const Divider(height: 1),
                          _buildPopupOption(
                            Icons.check_circle_outline,
                            'Add to Experienced',
                            context,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
          );
        },
        child: Icon(Icons.add, color: Colors.grey.shade300, size: 24),
      ),
    );
  }
}

Widget _buildPopupOption(IconData icon, String title, BuildContext context) {
  return ListTile(
    leading: Icon(icon, color: Colors.redAccent),
    title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
    onTap: () => Navigator.pop(context),
  );
}
