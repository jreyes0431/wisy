part of views;

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                  "Hola! Esto es Wisy, tu app de almacenamiento de fotos",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                ),
              ),
              const SizedBox(height: 140),
              SizedBox(
                width: 200,
                child: TextFormField(
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: "ID de usuario",
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
                onPressed: () {},
                child: const Text(
                  "Entrar",
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
