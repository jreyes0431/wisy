part of views;

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextEditingController idController =
        ref.watch(userProvider.notifier).idController;

    return Scaffold(
      backgroundColor: CustomColor.primaryRed,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 60),
              const Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  "Wisy,\nyour personal cloud photo app",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 48,
                  ),
                ),
              ),
              const SizedBox(height: 140),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: idController,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "User ID",
                    fillColor: Colors.white,
                    filled: true,
                    border: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                style: const ButtonStyle(
                  minimumSize: MaterialStatePropertyAll(Size(120, 40)),
                  backgroundColor:
                      MaterialStatePropertyAll(CustomColor.primaryRose),
                ),
                onPressed: () {
                  ref.read(userProvider.notifier).updateUserData(ref);
                  context.push("/home");
                },
                child: const Text(
                  "Access",
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
