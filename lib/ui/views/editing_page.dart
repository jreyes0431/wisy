part of views;

class EditingPage extends ConsumerStatefulWidget {
  const EditingPage({super.key, required this.file});
  final File file;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EditingPageState();
}

class _EditingPageState extends ConsumerState<EditingPage> {
  @override
  void dispose() {
    context.go("/home");
    super.dispose();
  }

  Color photoCardBgColor = CustomColor.primaryRed;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8),
                child: Align(
                  alignment: Alignment(-1, 0),
                  child: BackButton(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: PhotoCard(
                  color: photoCardBgColor,
                  file: widget.file,
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleClickeableColor(
                    callback: () {
                      setState(() {
                        photoCardBgColor = CustomColor.primaryRed;
                      });
                    },
                    color: CustomColor.primaryRed,
                  ),
                  const SizedBox(width: 10),
                  CircleClickeableColor(
                    callback: () {
                      setState(() {
                        photoCardBgColor = CustomColor.primaryBlue;
                      });
                    },
                    color: CustomColor.primaryBlue,
                  ),
                  const SizedBox(width: 10),
                  CircleClickeableColor(
                    callback: () {
                      setState(() {
                        photoCardBgColor = CustomColor.primaryRose;
                      });
                    },
                    color: CustomColor.primaryRose,
                  ),
                  const SizedBox(width: 10),
                  CircleClickeableColor(
                    callback: () {
                      setState(() {
                        photoCardBgColor = CustomColor.lightPurple;
                      });
                    },
                    color: CustomColor.lightPurple,
                  ),
                ],
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                  backgroundColor: MaterialStatePropertyAll(photoCardBgColor),
                ),
                onPressed: () {
                  context.go("/home");
                },
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Save",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
