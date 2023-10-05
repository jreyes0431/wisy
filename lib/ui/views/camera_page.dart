part of views;

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CameraAwesomeBuilder.awesome(
      saveConfig: SaveConfig.photo(
        pathBuilder: () {
          return getPath(CaptureMode.photo);
        },
      ),
      onMediaTap: (p0) => context.push("/edit-photo", extra: File(p0.filePath)),
      enablePhysicalButton: true,
    );
  }
}
