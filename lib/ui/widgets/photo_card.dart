part of widgets;

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    super.key,
    required this.photo,
    required this.color,
  });

  final Photo photo;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: color,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 24,
          bottom: 120,
          left: 24,
          right: 24,
        ),
        child: SizedBox(
          height: 380,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(
              photo.url,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => SizedBox.expand(
                child: ColoredBox(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      "Sorry... we had a loading problem",
                      textAlign: TextAlign.center,
                      style: CustomParagraphStyle.disclaimer,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
