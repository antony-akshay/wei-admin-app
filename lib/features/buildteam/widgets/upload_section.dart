import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

class UploadSection extends StatefulWidget {
  final String label;
  final double height;

  const UploadSection({super.key, required this.label, this.height = 10});

  @override
  State<UploadSection> createState() => _UploadSectionState();
}

class _UploadSectionState extends State<UploadSection> {
  FilePickerResult? result;

  Future<void> pickfile() async {
    result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            softWrap: true,
            style: GoogleFonts.urbanist(
              fontSize: 16.sp,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
          ),
          SizedBox(height: widget.height.h),
          GestureDetector(
            onTap: pickfile,
            child: SizedBox(
              width: 168.w,
              height: 134.h,
              child: SvgPicture.asset('assets/images/upload_interface.svg'),
            ),
          ),
          SizedBox(height: 8.h),
          if (result != null)
            Container(
              height: 42.h,
              width: 168.w,
              decoration: BoxDecoration(
                color: const Color.fromRGBO(56, 56, 56, 1),
                borderRadius: BorderRadius.circular(8.r),
              ),
              padding: EdgeInsets.symmetric(horizontal: 12.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      result!.files.first.name,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.urbanist(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        result = null;
                      });
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.white,
                      size: 16.sp,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
