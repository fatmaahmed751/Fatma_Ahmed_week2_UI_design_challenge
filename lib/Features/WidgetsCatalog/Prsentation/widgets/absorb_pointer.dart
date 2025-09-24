import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
class AdvancedAbsorbPointerExample extends StatefulWidget {
  const AdvancedAbsorbPointerExample({super.key});

  @override
  _AdvancedAbsorbPointerExampleState createState() =>
      _AdvancedAbsorbPointerExampleState();
}

class _AdvancedAbsorbPointerExampleState
    extends State<AdvancedAbsorbPointerExample> {
  bool _isLocked = false;
  bool _isLoading = false;

  Future<void> _simulateLoading() async {
    setState(() {
      _isLoading = true;
      _isLocked = true;
    });

    await Future.delayed(Duration(milliseconds: 100));

    if (mounted) {
      setState(() {
        _isLoading = false;
        _isLocked = false;
      });

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('success!')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton.icon(
            onPressed:
            _isLoading
                ? null
                : () {
              setState(() {
                _isLocked = !_isLocked;
              });
            },
            icon: Icon(_isLocked ? Icons.lock : Icons.lock_open),
            label: Text(
              _isLocked ? 'screen locked 🔒' : 'screnn open 🔓',
              style: TextStyle(fontSize: 16.sp),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: _isLocked ? Colors.red[100] : Colors.green[100],
            ),
          ),
          Gap(12.h),
          if (_isLoading)
            Container(
              padding: EdgeInsets.all(12.w),
              decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(
                  8.r,
                ),
              ),
              child: Row(
                children: [
                  CircularProgressIndicator(),
                  Gap( 10.w),
                  Text(
                    'Loading is progress!',
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
          Gap(12.h),
          ElevatedButton.icon(
            onPressed: _simulateLoading,
            icon: Icon(Icons.refresh),
            label: Text('updated', style: TextStyle(fontSize: 16.sp)),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
          ),
          Gap( 20.h),
          AbsorbPointer(
            absorbing: _isLocked || _isLoading,
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10.w,
              mainAxisSpacing: 10.h,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: List.generate(6, (index) {
                return Card(
                  color: Colors.teal[100],
                  child: InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Item is  $index ✅'),
                          backgroundColor: Colors.teal,
                        ),
                      );
                    },
                    child: Center(
                      child: Text(
                        'Item $index',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}