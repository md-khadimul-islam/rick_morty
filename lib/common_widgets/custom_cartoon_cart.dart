import 'package:flutter/material.dart';
import 'package:rick_and_morty/utils/app_colors.dart';
import 'package:rick_and_morty/utils/text_style_util.dart';
import 'package:rick_and_morty/utils/utils.dart';

class CustomCartoonCart extends StatefulWidget {
  const CustomCartoonCart(
      {super.key, this.cartImage, this.cartName, this.onTap});

  final String? cartImage;
  final String? cartName;
  final VoidCallback? onTap;

  @override
  State<CustomCartoonCart> createState() => _CustomCartState();
}

class _CustomCartState extends State<CustomCartoonCart> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: ClipRRect(
          clipBehavior: Clip.antiAlias,
          borderRadius:
              const BorderRadius.only(bottomRight: Radius.elliptical(50, 50)),
          child: Container(
            padding: EdgeInsets.all(Utils.scrHeight * .01),
            height: Utils.scrHeight * .15,
            width: Utils.scrHeight * .2,
            decoration: BoxDecoration(
              // color: Colors.blue,
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(Utils.scrHeight * .01),
              border: Border.all(color: AppColors.buttonColor, width: 1.0),
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/${widget.cartImage}.png',
                        fit: BoxFit.cover,
                        height: Utils.scrHeight * .099,
                        width: Utils.scrHeight * .19),
                    SizedBox(height: Utils.scrHeight * .006),
                    Text('${widget.cartName}',
                        style: semiBoldTS(Colors.white, fontSize: 10))
                  ],
                ),
                Positioned(
                  top: Utils.scrHeight * .006,
                  left: Utils.scrHeight * .008,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    },
                    child: Container(
                      width: Utils.scrHeight * .03,
                      height: Utils.scrHeight * .03,
                      clipBehavior: Clip.antiAlias,
                      decoration: ShapeDecoration(
                        color: isSelected
                            ? const Color(0xFF8C866E)
                            : Colors.black.withOpacity(0.1),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2)),
                      ),
                      child: Icon(
                        isSelected ? Icons.star : Icons.star_border,
                        color:
                            isSelected ? const Color(0xFFFFC107) : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class CustomShapedContainer extends StatelessWidget {
  const CustomShapedContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
        ),
      ),
      child: CustomPaint(
        painter: MyPainter(),
      ),
    );
  }
}

class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.fill;

    Path path = Path()
      ..moveTo(0, 20) // Move to the starting point
      ..lineTo(0, size.height) // Draw vertical line
      ..lineTo(size.width, size.height) // Draw horizontal line
      ..lineTo(size.width, 0) // Draw vertical line
      ..close(); // Close the path to form a shape

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
