part of views;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User currentUser = ref.watch(userProvider);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 16),
              Align(
                alignment: const Alignment(0.9, 0),
                child: Text(
                  "Are you ready for a new one?",
                  textAlign: TextAlign.right,
                  style: CustomTitleStyle.regular,
                ),
              ),
              const SizedBox(height: 8),
              Align(
                alignment: const Alignment(0.9, 0),
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("New photo"),
                ),
              ),
              const SizedBox(height: 8),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Divider(),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Text(
                  "Here... this is your ocean of photos",
                  textAlign: TextAlign.center,
                  style: CustomTitleStyle.grandTitle,
                ),
              ),
              const SizedBox(height: 8),
              if (currentUser.photos.isEmpty) ...[
                const SizedBox(height: 220),
                Text(
                  "Ups! It seems that we don't have anything here...\nWhat are you waiting for?!",
                  textAlign: TextAlign.center,
                  style: CustomParagraphStyle.disclaimer,
                ),
              ],
              ...List<Widget>.generate(
                currentUser.photos.length,
                (int index) => PhotoThumbnail(
                  photo: currentUser.photos[index],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
