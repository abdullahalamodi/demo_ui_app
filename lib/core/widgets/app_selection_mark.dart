import '../../common_libs.dart';

class AppSelectionMark extends StatelessWidget {
  const AppSelectionMark({
    required this.isSelected,
    this.isSquare = false,
    super.key,
  });

  final bool isSelected;
  final bool isSquare;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(isSquare ? kRadiusXs : 9.2);

    return Container(
      width: 18.4,
      height: 18.4,
      alignment: AlignmentDirectional.center,
      decoration: BoxDecoration(
        borderRadius: borderRadius,
        border: Border.all(color: const Color(0xFFD1D7EB)),
      ),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 120),
        width: isSelected ? 8.4 : 0,
        height: isSelected ? 8.4 : 0,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(isSquare ? 2 : kRadiusPill),
        ),
      ),
    );
  }
}
