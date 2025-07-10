import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildteamDropdown extends StatefulWidget {
  final List<String> items;
  final ValueNotifier<String?> selectedValueNotifier;

  const BuildteamDropdown({
    super.key,
    required this.items,
    required this.selectedValueNotifier,
  });

  @override
  State<BuildteamDropdown> createState() => _BuildteamDropdownState();
}

class _BuildteamDropdownState extends State<BuildteamDropdown> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String?>(
      valueListenable: widget.selectedValueNotifier,
      builder: (context, selectedValue, _) {
        return DropdownButtonFormField<String>(
          value: selectedValue,
          isExpanded: true,
          dropdownColor: const Color(0xFF1A1A1A),
          icon: const Icon(Icons.keyboard_arrow_down, color: Colors.white),

          hint: Text(
            'Select the type',
            style: GoogleFonts.urbanist(
              color: Colors.white.withOpacity(0.6),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),

          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 18),
            filled: true,
            fillColor: Color.fromRGBO(33, 36, 38, 1),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255),width: 0.6),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Color.fromARGB(255, 255, 255, 255),width: 0.6),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: Colors.white,width:0.6),
            ),
          ),

          items: widget.items.map((item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(
                item,
                style: GoogleFonts.urbanist(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList(),

          onChanged: (value) {
            widget.selectedValueNotifier.value = value;
          },

          style: GoogleFonts.urbanist(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        );
      },
    );
  }
}
