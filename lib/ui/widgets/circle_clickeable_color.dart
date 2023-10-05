part of widgets;

class CircleClickeableColor extends StatelessWidget {
  const CircleClickeableColor({super.key, this.callback, required this.color});

  final VoidCallback? callback;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 32,
      height: 32,
      child: InkWell(
        onTap: callback,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
