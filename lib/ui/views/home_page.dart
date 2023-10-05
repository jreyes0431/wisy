part of views;

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final User currentUser = ref.watch(userProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackButton(
                    onPressed: () {
                      context.canPop() ? context.pop() : context.push("/login");
                    },
                  ),
                  Text(
                    "Ready for a new one?",
                    overflow: TextOverflow.clip,
                    textAlign: TextAlign.right,
                    style: CustomTitleStyle.regular,
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Align(
                alignment: Alignment.topRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.push('/take-photo');
                  },
                  child: const Text("New photo"),
                ),
              ),
              const SizedBox(height: 8),
              const Divider(),
              const SizedBox(height: 8),
              if (currentUser.photos.isEmpty) ...[
                const SizedBox(height: 220),
                Text(
                  "Ups! It seems that we don't have anything here...\nWhat are you waiting for?!",
                  textAlign: TextAlign.center,
                  style: CustomParagraphStyle.disclaimer,
                ),
              ],
              Expanded(
                child: MasonryGridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: currentUser.photos.length,
                  itemBuilder: (context, index) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        currentUser.photos[index].url,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) return child;
                          return const CircularProgressIndicator.adaptive();
                        },
                        errorBuilder: (context, error, stackTrace) =>
                            const SizedBox.shrink(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
