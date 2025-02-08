import 'package:flutter/material.dart';

enum SortOption {
  relevance,
  priceLowToHigh,
  priceHighToLow,
  discountHighToLow,
}

class SortModal extends StatefulWidget {
  final Function(SortOption) onSort;
  final SortOption currentSort;

  const SortModal({
    super.key,
    required this.onSort,
    required this.currentSort,
  });

  @override
  State<SortModal> createState() => _SortModalState();
}

class _SortModalState extends State<SortModal> {
  late SortOption _selectedOption;

  @override
  void initState() {
    super.initState();
    _selectedOption = widget.currentSort;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Text(
              'Sort by',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          _buildSortOption(
            SortOption.relevance,
            'Relevance (default)',
          ),
          _buildSortOption(
            SortOption.priceLowToHigh,
            'Price (low to high)',
          ),
          _buildSortOption(
            SortOption.priceHighToLow,
            'Price (high to low)',
          ),
          _buildSortOption(
            SortOption.discountHighToLow,
            'Discount (high to low)',
          ),
        ],
      ),
    );
  }

  Widget _buildSortOption(SortOption option, String label) {
    return InkWell(
      onTap: () {
        setState(() {
          _selectedOption = option;
        });
        widget.onSort(option);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Radio<SortOption>(
              value: option,
              groupValue: _selectedOption,
              onChanged: (SortOption? value) {
                if (value != null) {
                  setState(() {
                    _selectedOption = value;
                  });
                  widget.onSort(value);
                }
              },
              activeColor: Colors.green,
            ),
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black87,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Usage example:
void showSortingOptions(BuildContext context) {
  showModalBottomSheet(
    context: context,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    builder: (context) => SortModal(
      currentSort: SortOption.relevance,
      onSort: (SortOption option) {
        // Handle sort option selection
        print('Selected sort option: $option');
        Navigator.pop(context);
      },
    ),
  );
}